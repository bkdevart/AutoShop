//
//  Vehicle.swift
//  AutoShop
//
//  Created by Brandon Knox on 8/2/21.
//

import Foundation

struct Vehicle: Codable, Identifiable {
    let id = UUID()
    let location: String
    let towRequired: Bool
    let make, model: String
    let year: Int
    let assignee: [Employee]

    enum CodingKeys: String, CodingKey {
        case location
        case towRequired = "tow_required"
        case make, model, year, assignee
    }
}
