//
//  InfoCard.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 28/06/26.
//


import SwiftUI

struct InfoCard<Content: View>: View {

    let title: String
    @ViewBuilder let content: Content

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: BrandSpacing.medium
        ) {
            Text(title)
                .font(.headline)
                .foregroundStyle(BrandColor.primaryText)

            content
        }
        .padding(BrandSpacing.large)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(BrandColor.surface)
        .clipShape(
            RoundedRectangle(
                cornerRadius: BrandRadius.card,
                style: .continuous
            )
        )
        .overlay {

            RoundedRectangle(
                cornerRadius: BrandRadius.card,
                style: .continuous
            )
            .stroke(
                BrandColor.subtleBorder,
                lineWidth: 1
            )
        }
    }
}
