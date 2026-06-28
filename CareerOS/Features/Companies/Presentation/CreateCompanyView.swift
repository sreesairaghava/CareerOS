//
//  CreateCompanyView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 21/06/26.
//


import SwiftUI

struct CreateCompanyView: View {

    let viewModel: CompaniesViewModel

    @Environment(\.dismiss)
    private var dismiss

    @State
    private var companyName = ""
    
    @State
    private var websiteURLText = ""

    @State
    private var selectedIndustry: CompanyIndustry = .technology
    
    private var trimmedCompanyName: String {

        companyName
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
    }

    private var websiteURL: URL? {

        let trimmedWebsite = websiteURLText
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )

        guard !trimmedWebsite.isEmpty else {
            return nil
        }

        let normalizedWebsite = trimmedWebsite.contains("://")
        ? trimmedWebsite
        : "https://\(trimmedWebsite)"

        return URL(
            string: normalizedWebsite
        )
    }

    private var canSave: Bool {

        !trimmedCompanyName.isEmpty
    }

    var body: some View {

        NavigationStack {

            Form {

                Section("Company") {

                    TextField(
                        "Company Name",
                        text: $companyName
                    )
                }
                
                Section("Website") {

                    TextField(
                        "apple.com",
                        text: $websiteURLText
                    )
                    .keyboardType(.URL)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                }

                Section("Industry") {

                    Picker(
                        "Industry",
                        selection: $selectedIndustry
                    ) {

                        ForEach(
                            CompanyIndustry.allCases,
                            id: \.self
                        ) { industry in

                            Text(
                                industry.displayName
                            )
                            .tag(industry)
                        }
                    }
                }
            }
            .navigationTitle("New Company")
            .toolbar {

                ToolbarItem(
                    placement: .topBarLeading
                ) {

                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    Button("Save") {
                        saveCompany()
                    }
                    .disabled(!canSave)
                }
            }
        }
    }

    private func saveCompany() {

        let didSave = viewModel.createCompany(
            name: trimmedCompanyName,
            websiteURL: websiteURL,
            industry: selectedIndustry
        )

        if didSave {
            dismiss()
        }
    }
}
