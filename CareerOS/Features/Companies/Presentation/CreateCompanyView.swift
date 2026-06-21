//
//  CreateCompanyView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import SwiftUI

struct CreateCompanyView: View {

    let repository: CompanyRepository

    @Environment(\.dismiss)
    private var dismiss

    @State
    private var companyName = ""

    @State
    private var selectedIndustry: CompanyIndustry = .technology

    var body: some View {

        NavigationStack {

            Form {

                Section("Company") {

                    TextField(
                        "Company Name",
                        text: $companyName
                    )
                }

                Section("Industry") {

                    Picker(
                        "Industry",
                        selection: $selectedIndustry
                    ) {

                        ForEach(
                            CompanyIndustry.allCases,
                            id: \.self
                        ) { industry in

                            Text(
                                industry.displayName
                            )
                            .tag(industry)
                        }
                    }
                }
            }
            .navigationTitle("New Company")
            .toolbar {

                ToolbarItem(
                    placement: .topBarLeading
                ) {

                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    Button("Save") {
                        saveCompany()
                    }
                    .disabled(
                        companyName
                            .trimmingCharacters(
                                in: .whitespacesAndNewlines
                            )
                            .isEmpty
                    )
                }
            }
        }
    }

    private func saveCompany() {

        let company = CompanyFactory.create(
            name: companyName,
            industry: selectedIndustry
        )

        do {

            try repository.saveCompany(
                company
            )

            dismiss()

        } catch {

            print(error)
        }
    }
}
