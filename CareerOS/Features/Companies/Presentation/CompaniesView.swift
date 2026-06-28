//
//  CompaniesView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//

import SwiftUI

struct CompaniesView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Environment(\.appDependencies)
    private var dependencies
    
    var body: some View {
        
        CompaniesContentView(
            viewModel: CompaniesViewModel(
                repository: companyRepository
            )
        )
    }
    
    private var companyRepository: CompanyRepository {
        
        dependencies
            .companyRepositoryFactory
            .makeCompanyRepository(
                modelContext: modelContext
            )
    }
}

private struct CompaniesContentView: View {
    
    @State
    private var viewModel: CompaniesViewModel
    
    @State
    private var isShowingCreateCompany = false
    
    init(
        viewModel: CompaniesViewModel
    ) {
        _viewModel = State(
            initialValue: viewModel
        )
    }
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                
                switch viewModel.viewState {
                    
                case .loading:
                    
                    ProgressView()
                    
                case .empty:
                    
                    ContentUnavailableView(
                        viewModel.isSearching ? "No Results" : "No Companies",
                        systemImage: viewModel.isSearching ? "magnifyingglass" : "building.2",
                        description: Text(
                            viewModel.isSearching
                            ? "Try a different company or industry"
                            : "Create your first company"
                        )
                    )
                    
                case .loaded(let companies):
                    
                    List {
                        
                        ForEach(companies) { company in
                            
                            NavigationLink {
                                
                                CompanyDetailView(
                                    company: company
                                )
                                
                            } label: {
                                
                                VStack(
                                    alignment: .leading,
                                    spacing: 4
                                ) {
                                    Text(company.name)
                                    
                                    Text(company.industry.displayName)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .onDelete { offsets in
                            
                            let ids = offsets.map {
                                companies[$0].id
                            }
                            
                            for id in ids {
                                
                                viewModel.deleteCompany(
                                    withID: id
                                )
                            }
                        }
                    }
                case .failed(let message):
                    
                    ContentUnavailableView(
                        "Unable to Load Companies",
                        systemImage: "exclamationmark.triangle",
                        description: Text(message)
                    )
                }
            }
            .navigationTitle("Companies")
            .searchable(
                text: $viewModel.searchText,
                prompt: "Search Companies"
            )
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
            .task {
                viewModel.loadCompanies()
            }
        }
        .sheet(
            isPresented: $isShowingCreateCompany
        ) {
            
            CreateCompanyView(
                viewModel: viewModel
            )
        }
    }
}
