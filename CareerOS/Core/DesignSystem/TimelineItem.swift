//
//  TimelineItem.swift
//  CareerOS
//
//  Created by Sree Sai Raghava Dandu on 28/06/26.
//


import Foundation

struct TimelineItem: Identifiable {

    let id = UUID()
    let title: String
    let subtitle: String
    let date: Date
}