//
//  AppTab.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 13/06/26.
//


import Foundation

enum AppTab: String, CaseIterable, Identifiable {
    
    case dashboard
    case applications
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .applications:
            return "Applications"
        }
    }
    
    var systemImage: String {
        switch self {
        case .dashboard:
            return "rectangle.grid.2x2"
        case .applications:
            return "list.bullet"
        }
    }
}
