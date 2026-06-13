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
            
            DashboardView()
                .tabItem {
                    Label(
                        AppTab.dashboard.title,
                        systemImage: AppTab.dashboard.systemImage
                    )
                }
                .tag(AppTab.dashboard)
            Text("Applications")
                .tabItem {
                    Label(
                        AppTab.applications.title,
                        systemImage: AppTab.applications.systemImage
                    )
                }
                .tag(AppTab.applications)
        }
    }
}

#Preview {
    RootView()
}
