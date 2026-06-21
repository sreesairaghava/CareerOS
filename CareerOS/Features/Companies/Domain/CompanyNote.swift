//
//  CompanyNote.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation

struct CompanyNote: Identifiable, Equatable {
    let id: UUID
    let companyID: UUID
    var title: String
    var content: String
    var category: CompanyNoteCategory
    let createdAt: Date
    var updatedAt: Date
}
