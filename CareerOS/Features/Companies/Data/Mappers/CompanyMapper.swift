//
//  CompanyMapper.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation

enum CompanyMapper {

    static func toDomain(
        from entity: CompanyEntity
    ) -> Company {

        Company(
            id: entity.id,
            name: entity.name,
            websiteURL: entity.websiteURL.flatMap(URL.init(string:)),
            industry: CompanyIndustry(
                rawValue: entity.industry
            ) ?? .other,
            createdAt: entity.createdAt,
            updatedAt: entity.updatedAt
        )
    }

    static func toEntity(
        from company: Company
    ) -> CompanyEntity {

        CompanyEntity(
            id: company.id,
            name: company.name,
            websiteURL: company.websiteURL?.absoluteString,
            industry: company.industry.rawValue,
            createdAt: company.createdAt,
            updatedAt: company.updatedAt
        )
    }
}