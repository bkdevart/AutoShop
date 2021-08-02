//
//  VehiclesView.swift
//  AutoShop
//
//  Created by Brandon Knox on 8/2/21.
//

import SwiftUI

struct VehiclesView: View {
    @State var results = [Vehicle]()
    
    var body: some View {
        Form {
            List(results, id: \.id) { vehicle in
                NavigationLink(destination: VehicleView(vehicle: vehicle)) {
                    VStack(alignment: .leading) {
                        Text("\(vehicle.make), \(vehicle.model)")
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("Vehicles")
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        // create the URL we want to read
        guard let url = URL(string: "http://127.0.0.1:8000/vehicle") else {
            print("Invalid URL")
            return
        }
        
        // wrap url in URLRequest to configure how the URL will be accessed
        let request = URLRequest(url: url)
        
        // create and start a network task from the URLRequest
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result of the networking task
            if let data = data {
                if let decodedResponse = try?JSONDecoder().decode([Vehicle].self, from: data) {
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

struct VehiclesView_Previews: PreviewProvider {
    static var previews: some View {
        VehiclesView()
    }
}
