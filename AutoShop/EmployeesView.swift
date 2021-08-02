//
//  EmployeesView.swift
//  AutoShop
//
//  Created by Brandon Knox on 8/1/21.
//

import SwiftUI

struct EmployeesView: View {
    @State var results = [Employee]()
    
    var body: some View {
        Form {
            List(results, id: \.id) { employee in
                NavigationLink(destination: EmployeeView(employee: employee)) {
                    VStack(alignment: .leading) {
                        Text("\(employee.username)")
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("Employees")
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        // create the URL we want to read
        guard let url = URL(string: "http://127.0.0.1:8000/employee") else {
            print("Invalid URL")
            return
        }
        
        // wrap url in URLRequest to configure how the URL will be accessed
        let request = URLRequest(url: url)
        
        // create and start a network task from the URLRequest
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result of the networking task
            if let data = data {
                if let decodedResponse = try?JSONDecoder().decode([Employee].self, from: data) {
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

struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesView()
    }
}
