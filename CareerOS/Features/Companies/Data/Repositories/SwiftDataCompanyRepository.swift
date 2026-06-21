//
//  SwiftDataCompanyRepository.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation
import SwiftData

final class SwiftDataCompanyRepository: CompanyRepository {

    private let modelContext: ModelContext

    init(
        modelContext: ModelContext
    ) {
        self.modelContext = modelContext
    }

    func fetchCompanies() throws -> [Company] {

        let descriptor = FetchDescriptor<CompanyEntity>(
            sortBy: [
                SortDescriptor(\.name)
            ]
        )

        let entities = try modelContext.fetch(
            descriptor
        )

        return entities.map {
            CompanyMapper.toDomain(from: $0)
        }
    }

    func saveCompany(
        _ company: Company
    ) throws {

        let entity = CompanyMapper.toEntity(
            from: company
        )

        modelContext.insert(entity)

        try modelContext.save()
    }

    func deleteCompany(
        withID id: UUID
    ) throws {

        let descriptor = FetchDescriptor<CompanyEntity>()

        let entities = try modelContext.fetch(
            descriptor
        )

        guard let entity = entities.first(
            where: { $0.id == id }
        ) else {
            return
        }

        modelContext.delete(entity)

        try modelContext.save()
    }
}
