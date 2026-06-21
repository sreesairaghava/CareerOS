//
//  SwiftDataCompanyRepositoryFactory.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import SwiftData

struct SwiftDataCompanyRepositoryFactory:
    CompanyRepositoryFactory {

    func makeCompanyRepository(
        modelContext: ModelContext
    ) -> CompanyRepository {

        SwiftDataCompanyRepository(
            modelContext: modelContext
        )
    }
}