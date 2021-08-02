//
//  Employee.swift
//  AutoShop
//
//  Created by Brandon Knox on 8/1/21.
//

import Foundation

struct Employee: Codable, Identifiable {
    let id: Int
    let person: Person
    let username: String
    let hireDate: String  // make date
    let salary: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "person_id"
        case person, username
        case hireDate = "hire_date"
        case salary
    }
}
