//
//  RootView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 13/06/26.
//


import SwiftUI

struct RootView: View {
    @State private var selectedTab: AppTab = .dashboard
    var body: some View {
        TabView(selection: $selectedTab) {

            Tab("Dashboard", systemImage: AppTab.dashboard.systemImage, value: AppTab.dashboard) {
                DashboardView()
            }
            
            Tab("Companies", systemImage: AppTab.companies.systemImage, value: AppTab.companies) {
                CompaniesView()
            }
            
        }
    }
}

#Preview {
    RootView()
}
