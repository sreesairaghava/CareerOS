//
//  AppDependencyContainer.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import Foundation

enum AppDependencyContainer {

    static func makeDependencies()
    -> AppDependencies {

        AppDependencies(
            companyRepositoryFactory:
                SwiftDataCompanyRepositoryFactory()
        )
    }
}