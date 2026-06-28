//
//  TimelineView.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 28/06/26.
//


import SwiftUI

struct TimelineView: View {

    let items: [TimelineItem]

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ForEach(
                Array(items.enumerated()),
                id: \.element.id
            ) { index, item in

                TimelineRow(
                    item: item,
                    isLast: index == items.count - 1
                )
            }
        }
    }
}

private struct TimelineRow: View {

    let item: TimelineItem
    let isLast: Bool

    var body: some View {

        HStack(
            alignment: .top,
            spacing: BrandSpacing.medium
        ) {
            marker

            VStack(
                alignment: .leading,
                spacing: BrandSpacing.xSmall
            ) {
                Text(item.title)
                    .font(.body.weight(.medium))
                    .foregroundStyle(BrandColor.primaryText)

                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(BrandColor.secondaryText)

                Text(
                    item.date.formatted(
                        date: .abbreviated,
                        time: .shortened
                    )
                )
                .font(.caption)
                .foregroundStyle(BrandColor.secondaryText)
            }
            .padding(
                .bottom,
                isLast ? 0 : BrandSpacing.large
            )
        }
    }

    private var marker: some View {

        VStack(
            spacing: 0
        ) {
            Circle()
                .fill(BrandColor.accent)
                .frame(
                    width: 10,
                    height: 10
                )

            if !isLast {

                Rectangle()
                    .fill(BrandColor.subtleBorder)
                    .frame(
                        width: 2
                    )
                    .frame(
                        maxHeight: .infinity
                    )
            }
        }
        .frame(
            width: 16
        )
    }
}

#Preview {
    TimelineView(items: [.init(title: "Created", subtitle: "company", date: .now), .init(title: "Deleted", subtitle: "company", date: .now), .init(title: "Added", subtitle: "company", date: .now), .init(title: "Removed", subtitle: "company", date: .now)])
}
