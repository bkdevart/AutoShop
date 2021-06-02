//
//  Person.swift
//  AutoShop
//
//  Created by Brandon Knox on 6/2/21.
//

import Foundation

struct Person: Codable, Identifiable {
    var id: Int
    var first_name: String
    var last_name: String
    var date_of_birth: String  // make date
}
