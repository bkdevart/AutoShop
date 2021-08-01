//
//  PersonView.swift
//  AutoShop
//
//  Created by Brandon Knox on 6/2/21.
//

import SwiftUI

struct PersonView: View {
    let person: Person
    
    var body: some View {
        VStack {
            HStack {
                Text(person.first_name)
                Text(person.last_name)
            }
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .padding()
            Text(person.date_of_birth)
        }
    }
    
    init(person: Person) {
        self.person = person
    }
}

struct PersonView_Previews: PreviewProvider {
    static let previewPerson = Person(id: 1,
                               first_name: "Jack",
                               last_name: "Smith",
                               date_of_birth: "2021")
    
    static var previews: some View {
        PersonView(person: previewPerson)
    }
}
