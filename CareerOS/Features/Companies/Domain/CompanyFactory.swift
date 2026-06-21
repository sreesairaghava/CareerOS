//
//  CompanyFactory.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation

enum CompanyFactory {

    static func create(
        name: String,
        industry: CompanyIndustry
    ) -> Company {

        let now = Date()

        return Company(
            id: UUID(),
            name: name,
            websiteURL: nil,
            industry: industry,
            createdAt: now,
            updatedAt: now
        )
    }
}