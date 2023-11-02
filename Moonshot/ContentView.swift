//
//  ContentView.swift
//  Moonshot
//
//  Created by Martin Lienhard on 3/1/22.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct Address: Codable {
    let street: String
    let city: String
}

struct User: Codable {
    let name: String
    let address: Address
}


struct ContentView: View {
    /*
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    */
    
    //must specify the file extension when withExtension is nil
    //refer to Bundle-Decodable
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        //Text("\(astronauts.count)").padding()
        //Text("\(missions.count)").padding()
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            //Text("Detail view")
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        
        /*
        Button("Decode JSON") {
            let input = """
            {
                "name": "Rihanna",
                "address": {
                    "street": "123, Singer Ave",
                    "city": "Atlanta"
                }
            }
            """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
        */
        
        /*
        NavigationView {
            List(0..<20) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
                .navigationTitle("SwiftUI")
            }
            
        }
        */
        
        /*
        ScrollView(.vertical) {
            LazyVGrid(columns: layout) {
                ForEach(0..<40) {
                    Text("Item \($0)")
                }
            }
        }
        */
        
        /*
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<40) {
                    Text("Item \($0)")
                }
            }
        }
        */
        
        /*
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(0..<40) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            } //expands scroll area to left & right edges of screen
            .frame(maxWidth: .infinity)
        }
        */
        
        /*
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<40) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            } //expands scroll area to left & right edges of screen
            .frame(maxWidth: .infinity)
        }
        */
        
        /*
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                //.scaledToFill()
                .frame(width: geo.size.width * 0.8)
                //.frame(width: geo.size.width, height: geo.size.height)
        }
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
