//
//  CompanyEntity.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation
import SwiftData

@Model
final class CompanyEntity {
    @Attribute(.unique)
    var id: UUID
    var name: String
    var websiteURL: String?
    var industry: String
    var createdAt: Date
    var updatedAt: Date
    @Relationship(deleteRule: .cascade)
    var notes: [CompanyNoteEntity]
    init(
        id: UUID,
        name: String,
        websiteURL: String?,
        industry: String,
        createdAt: Date,
        updatedAt: Date,
        notes: [CompanyNoteEntity] = []
    ) {
        self.id = id
        self.name = name
        self.websiteURL = websiteURL
        self.industry = industry
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.notes = notes
    }
}
