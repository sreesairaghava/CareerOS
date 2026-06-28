//
//  CompanyDetailView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 28/06/26.
//


import SwiftUI

struct CompanyDetailView: View {
    
    let company: Company
    
    private var timelineItems: [TimelineItem] {
        
        [
            TimelineItem(
                title: "Company Added",
                subtitle: "Started tracking this company",
                date: company.createdAt
            ),
            TimelineItem(
                title: "Company Updated",
                subtitle: "Company details were last changed",
                date: company.updatedAt
            )
        ]
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(
                alignment: .leading,
                spacing: BrandSpacing.large
            ) {
                headerView
                
                InfoCard(title: "Company") {
                    
                    detailRow(
                        title: "Name",
                        value: company.name
                    )
                    
                    detailRow(
                        title: "Industry",
                        value: company.industry.displayName
                    )
                }
                
                if let websiteURL = company.websiteURL {
                    
                    InfoCard(title: "Website") {
                        
                        Link(
                            websiteURL.absoluteString,
                            destination: websiteURL
                        )
                        .font(.body)
                    }
                }
                InfoCard(title: "Timeline") {
                    
                    TimelineView(
                        items: timelineItems
                    )
                }
            }
            .padding(BrandSpacing.large)
        }
        .background(BrandColor.background)
        .navigationTitle(company.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var headerView: some View {
        
        VStack(
            alignment: .leading,
            spacing: BrandSpacing.small
        ) {
            Text(company.name)
                .font(.largeTitle.bold())
                .foregroundStyle(BrandColor.primaryText)
            
            Text(company.industry.displayName)
                .font(.subheadline)
                .foregroundStyle(BrandColor.secondaryText)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
    
    private func detailRow(
        title: String,
        value: String
    ) -> some View {
        
        HStack(
            alignment: .firstTextBaseline
        ) {
            Text(title)
                .foregroundStyle(BrandColor.secondaryText)
            
            Spacer()
            
            Text(value)
                .foregroundStyle(BrandColor.primaryText)
                .multilineTextAlignment(.trailing)
        }
        .font(.body)
    }
}

#Preview {
    CompanyDetailView(company: CompanyFactory.create(name: "Salesforce", industry: .technology))
}
