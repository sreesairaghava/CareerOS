//
//  CompanyNoteEntity.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation
import SwiftData

@Model
final class CompanyNoteEntity {

    @Attribute(.unique)
    var id: UUID
    var title: String
    var content: String
    var category: String
    var createdAt: Date
    var updatedAt: Date

    init(
        id: UUID,
        title: String,
        content: String,
        category: String,
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.category = category
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
