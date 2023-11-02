//
//  CrewView.swift
//  Moonshot
//
//  Created by Martin Lienhard on 11/2/23.
//

import Foundation
import SwiftUI

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        //Text("Astronaut detail")
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule().strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    var crew: [CrewMember] = []
    crew.append(CrewMember(role: missions[0].crew[0].role, astronaut: astronauts[0]))
    crew.append(CrewMember(role: missions[0].crew[1].role, astronaut: astronauts[1]))
    crew.append(CrewMember(role: missions[0].crew[2].role, astronaut: astronauts[2]))
    
    return CrewView(crew: crew)
        .preferredColorScheme(.dark)
}
