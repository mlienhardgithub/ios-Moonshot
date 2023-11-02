//
//  AstronautView.swift
//  Moonshot
//
//  Created by Martin Lienhard on 10/26/23.
//

import Foundation
import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct AstronautView_Previews: PreviewProvider {
#Preview {
    //static
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    /*
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
            .preferredColorScheme(.dark)
    }
    */
    return AstronautView(astronaut: astronauts[0])
        .preferredColorScheme(.dark)
}
