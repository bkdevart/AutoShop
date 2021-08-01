//
//  ContentView.swift
//  AutoShop
//
//  Created by Brandon Knox on 6/2/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            Form {
                List {
                    NavigationLink("PeopleView", destination: PeopleView())
                    NavigationLink("EmployeeView", destination: PeopleView())
                    NavigationLink("VehicleView", destination: PeopleView())
                }
                .navigationTitle("Views")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
