//
//  ContentView.swift
//  AutoShop
//
//  Created by Brandon Knox on 6/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var results = [Person]()
    
    var body: some View {
        NavigationView {
            Form {
                List(results, id: \.id) { person in
                    NavigationLink(destination: PersonView(person: person)) {
                        VStack(alignment: .leading) {
                            Text("\(person.last_name), \(person.first_name)")
                                .font(.headline)
                        }
                    }
                }
                .navigationBarTitle("Person")
            }
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        // create the URL we want to read
        guard let url = URL(string: "http://127.0.0.1:8000/person") else {
            print("Invalid URL")
            return
        }
        
        // wrap url in URLRequest to configure how the URL will be accessed
        let request = URLRequest(url: url)
        
        // create and start a network task from the URLRequest
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result of the networking task
            if let data = data {
                if let decodedResponse = try?JSONDecoder().decode([Person].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse
                    }
                    print("Results returned")
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            print(request)
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
