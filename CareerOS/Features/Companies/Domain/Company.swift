//
//  Company.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//

import Foundation

struct Company: Identifiable, Equatable {

    let id: UUID
    var name: String
    var websiteURL: URL?
    var industry: CompanyIndustry
    let createdAt: Date
    var updatedAt: Date
}
