//
//  CompaniesViewModel.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 28/06/26.
//


import Foundation
import Observation

@Observable
final class CompaniesViewModel {

    private let repository: CompanyRepository

    private(set) var viewState: CompaniesViewState = .loading
    
    private var allCompanies: [Company] = []

    var searchText = "" {
        didSet {
            applySearch()
        }
    }
    
    var isSearching: Bool {

        !searchText
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
            .isEmpty
    }

    init(
        repository: CompanyRepository
    ) {
        self.repository = repository
    }

    func loadCompanies() {

        viewState = .loading

        do {

            allCompanies = try repository
                .fetchCompanies()

            applySearch()

        } catch {

            viewState = .failed(error.localizedDescription)
        }
    }

    func createCompany(
        name: String,
        websiteURL: URL?,
        industry: CompanyIndustry
    ) -> Bool {
        let company = CompanyFactory.create(
            name: name,
            websiteURL: websiteURL,
            industry: industry
        )

        do {

            try repository.saveCompany(
                company
            )

            loadCompanies()

            return true

        } catch {

            viewState = .failed(error.localizedDescription)

            return false
        }
    }
    
    func deleteCompany(
        withID id: Company.ID
    ) {

        do {

            try repository.deleteCompany(
                withID: id
            )

            loadCompanies()

        } catch {

            viewState = .failed(error.localizedDescription)
        }
    }
    
    func updateCompany(
        _ company: Company,
        name: String,
        websiteURL: URL?,
        industry: CompanyIndustry
    ) -> Bool {

        var updatedCompany = company
        updatedCompany.name = name
        updatedCompany.websiteURL = websiteURL
        updatedCompany.industry = industry
        updatedCompany.updatedAt = Date()

        do {

            try repository.updateCompany(
                updatedCompany
            )

            loadCompanies()

            return true

        } catch {

            viewState = .failed(error.localizedDescription)

            return false
        }
    }
    
    private func applySearch() {

        let trimmedSearchText = searchText
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )

        let visibleCompanies: [Company]

        if trimmedSearchText.isEmpty {

            visibleCompanies = allCompanies

        } else {

            visibleCompanies = allCompanies.filter { company in

                company.name.localizedCaseInsensitiveContains(
                    trimmedSearchText
                )
                || company.industry.displayName.localizedCaseInsensitiveContains(
                    trimmedSearchText
                )
            }
        }

        if visibleCompanies.isEmpty {
            viewState = .empty
        } else {
            viewState = .loaded(visibleCompanies)
        }
    }
}
