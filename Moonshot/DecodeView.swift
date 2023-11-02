//
//  DecodeView.swift
//  Moonshot
//
//  Created by Martin Lienhard on 7/27/22.
//

import SwiftUI

struct product: Codable, Hashable, Identifiable {
    let id: String
    var name: String
    var points: Int
    var description: String?
}

struct DecodeView: View {
    /*
    func jsonTwo() -> [product]{
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let products = try? decoder.decode([product].self, from: data)
        return products!
    }
    */
    func jsonTwo() -> [Astronaut]{
        let url = Bundle.main.url(forResource: "astronauts", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let products = (try? decoder.decode([Astronaut].self, from: data))
        return products!
    }
    
    var body: some View {
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        //let astronauts = jsonTwo()
        Text("\(astronauts.count)").padding()
        /*
        List{
            ForEach(jsonTwo(), id: \.self) { item in
                VStack(alignment: .leading, spacing: 0) {
                    Text("id: \(item.id)")
                    Text("name: \(item.name) - points: \(item.points)")
                    Text("\(item.description ?? "")")
                }
            }
        }
        */
    }
}

struct DecodeView_Previews: PreviewProvider {
    static var previews: some View {
        DecodeView()
    }
}
