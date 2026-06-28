//
//  CompaniesViewState.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 28/06/26.
//

import Foundation

enum CompaniesViewState {
    case loading
    case empty
    case loaded([Company])
    case failed(String)
}
