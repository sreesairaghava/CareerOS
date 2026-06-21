//
//  AppTab.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 13/06/26.
//


import Foundation

enum AppTab: String, CaseIterable, Identifiable {
    
    case dashboard
    case companies
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .companies:
            return "Companies"
        }
    }
    
    var systemImage: String {
        switch self {
        case .dashboard:
            return "rectangle.grid.2x2"
        case .companies:
            return "building.2"
        }
    }
}
