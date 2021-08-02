//
//  EmployeeView.swift
//  AutoShop
//
//  Created by Brandon Knox on 8/1/21.
//

import SwiftUI

struct EmployeeView: View {
    let employee: Employee
    
    var body: some View {
        VStack {
            VStack {
                Text(employee.username)
                Text("\(employee.person.first_name) \(employee.person.last_name)")
            }
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .padding()
            Text(employee.hireDate)
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static let previewPerson = Person(id: 1,
                               first_name: "Jack",
                               last_name: "Smith",
                               date_of_birth: "2021")
    
    static let previewEmployee = Employee(person: previewPerson,
                                          username: "SmithJ",
                                          hireDate: "hired: 2021-01-01",
                                          salary: 40000)
    static var previews: some View {
        EmployeeView(employee: previewEmployee)
    }
}
