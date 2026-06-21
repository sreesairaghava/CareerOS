//
//  CompanyIndustry.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//

import Foundation

enum CompanyIndustry: String, CaseIterable, Codable {
    case technology
    case finance
    case healthcare
    case ecommerce
    case gaming
    case other
}

extension CompanyIndustry {

    var displayName: String {
        switch self {
        case .technology:
            return "Technology"

        case .finance:
            return "Finance"

        case .healthcare:
            return "Healthcare"

        case .ecommerce:
            return "E-Commerce"

        case .gaming:
            return "Gaming"

        case .other:
            return "Other"
        }
    }
}
