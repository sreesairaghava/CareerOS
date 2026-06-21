//
//  AppDependenciesKey.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import SwiftUI

private struct AppDependenciesKey:
    EnvironmentKey {

    static let defaultValue =
        AppDependencyContainer.makeDependencies()
}

extension EnvironmentValues {

    var appDependencies: AppDependencies {

        get {
            self[AppDependenciesKey.self]
        }

        set {
            self[AppDependenciesKey.self] = newValue
        }
    }
}