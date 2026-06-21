//
//  CompaniesView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//

import SwiftUI
import SwiftData

struct CompaniesView: View {

    @Environment(\.modelContext)
    private var modelContext

    @Environment(\.appDependencies)
    private var dependencies

    @Query(
        sort: \CompanyEntity.name
    )
    private var companies: [CompanyEntity]

    @State
    private var isShowingCreateCompany = false

    var body: some View {

        NavigationStack {

            Group {

                if companies.isEmpty {

                    ContentUnavailableView(
                        "No Companies",
                        systemImage: "building.2",
                        description: Text(
                            "Create your first company"
                        )
                    )

                } else {

                    List(companies) { company in
                        Text(company.name)
                    }
                }
            }
            .navigationTitle("Companies")
            .toolbar {

                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    Button {

                        isShowingCreateCompany = true

                    } label: {

                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(
            isPresented: $isShowingCreateCompany
        ) {

            CreateCompanyView(
                repository: dependencies
                    .companyRepositoryFactory
                    .makeCompanyRepository(
                        modelContext: modelContext
                    )
            )
        }
    }
}
