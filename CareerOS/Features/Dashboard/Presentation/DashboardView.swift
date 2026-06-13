//
//  DashboardView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 13/06/26.
//


import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "CareerOS",
                systemImage: "briefcase",
                description: Text("Dashboard coming soon")
            )
            .navigationTitle(AppConstants.NavigationTitle.dashboard)
        }
    }
}

#Preview {
    DashboardView()
}
