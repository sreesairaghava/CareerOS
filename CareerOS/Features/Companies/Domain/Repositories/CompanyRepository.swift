//
//  CompanyRepository.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation

protocol CompanyRepository {

    func fetchCompanies() throws -> [Company]

    func saveCompany(_ company: Company) throws

    func deleteCompany(
        withID id: UUID
    ) throws
}