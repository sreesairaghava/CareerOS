//
//  CompanyRepositoryFactory.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import SwiftData

protocol CompanyRepositoryFactory {

    func makeCompanyRepository(
        modelContext: ModelContext
    ) -> CompanyRepository
}