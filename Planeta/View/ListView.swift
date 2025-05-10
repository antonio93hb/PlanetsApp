//
//  Planet.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 5/5/25.
//

import SwiftUI

struct ListView: View {
    
    let planets: [Planet] = planetas
    
    var body: some View {
        NavigationStack {
            List(planets) { planet in
                NavigationLink(destination: DetailView(planet: planet)) {
                    HStack{
                        Image(planet.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        Text(planet.title)
                    }
                }
            }
            .navigationTitle("Planets")
        }
    }
}

#Preview {
    ListView()
}
