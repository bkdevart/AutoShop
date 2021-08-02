//
//  VehicleView.swift
//  AutoShop
//
//  Created by Brandon Knox on 8/2/21.
//

import SwiftUI

struct VehicleView: View {
    let vehicle: Vehicle
    
    var body: some View {
        VStack {
            HStack {
                Text(vehicle.make)
                Text(vehicle.model)
            }
            Image(systemName: "car")
                .resizable()
                .scaledToFit()
                .padding()
        }
    }
}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        let previewPerson = Person(id: 1,
                                   first_name: "Jack",
                                   last_name: "Smith",
                                   date_of_birth: "2021")
        
        let previewEmployee = Employee(person: previewPerson,
                                              username: "SmithJ",
                                              hireDate: "hired: 2021-01-01",
                                              salary: 40000)
        
        let previewVehicle = Vehicle(location: "main", towRequired: true, make: "Toyota", model: "Camry", year: 2019, assignee: [previewEmployee])
        
        VehicleView(vehicle: previewVehicle)
    }
}
