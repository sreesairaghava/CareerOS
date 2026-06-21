//
//  CompanyNoteCategory.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation

enum CompanyNoteCategory: String, CaseIterable, Codable {

    case general
    case interview
    case networking
    case referral
    case research
}

extension CompanyNoteCategory {

    var displayName: String {
        switch self {
        case .general:
            return "General"

        case .interview:
            return "Interview"

        case .networking:
            return "Networking"

        case .referral:
            return "Referral"

        case .research:
            return "Research"
        }
    }
}