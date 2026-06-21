//
//  MockCompanyRepository.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//

import Foundation

final class MockCompanyRepository: CompanyRepository {
    func fetchCompanies() throws -> [Company] {
        [.init(id: .init(), name: "Uber", industry: .technology, createdAt: .now, updatedAt: .now)]
    }
    func saveCompany(_ company: Company) throws {}
    
    func deleteCompany(withID id: UUID) throws {}
}
