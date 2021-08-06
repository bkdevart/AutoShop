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
            VStack {
                VStack {
                    HStack {
                        Text(vehicle.make)
                        Text(vehicle.model)
                    }
                    .font(.title)
                    .foregroundColor(.white)
                    Text(String(vehicle.year))
                        .foregroundColor(.white)
                }
                .padding(20)
                // add check for image, use generic car if not present
                Image(vehicle.model)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding()
            }
            .background(Color(red: 0.219, green: 0.509, blue: 0.607, opacity: 0.75))
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .padding(20)
            
            VStack {
                Form {
                    Section(header: Text("Employees assigned to \(vehicle.model)")
                                .font(.headline)) {
                        List(vehicle.assignee, id: \.id) { employee in
                            NavigationLink(destination: EmployeeView(employee: employee)) {
                                VStack(alignment: .leading) {
                                    Text("\(employee.username)")
                                }
                            }                 .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        }
                    }
                }
            }
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
