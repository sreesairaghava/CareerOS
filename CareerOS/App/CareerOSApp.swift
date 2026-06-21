//
//  CareerOSApp.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 13/06/26.
//

import SwiftUI
import SwiftData

@main
struct CareerOSApp: App {
    private let dependencies = AppDependencyContainer.makeDependencies()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(
                    \.appDependencies,
                     dependencies
                )
        }
        .modelContainer(for: [
            CompanyEntity.self,
            CompanyNoteEntity.self
        ])
    }
}
