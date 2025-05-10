//
//  DetailView.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 5/5/25.
//

import SwiftUI

struct DetailView: View {
    
    let planet: Planet
    
    var body: some View {
        ScrollView {
            VStack {
                Text(planet.title)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Image(planet.name)
                
                Text(planet.description)
                    .padding()
                    .font(.callout)
                    .frame(alignment: .center)
                    
                Text("The diameter of this planet is: **\(planet.diameterKm)** kms")
                    .font(.callout)
                    .padding()
                
                Text("The distance from the Sun is: **\(planet.distanceFromSunKm)** kms")
                    .font(.callout)
                    .padding()
            }
            .frame(maxWidth: 380)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    DetailView(planet: Planet(name: "earth", title: "Earth", description: "The third planet from the Sun and the only known place in the universe to support life.", diameterKm: 12742, distanceFromSunKm: 149600000))
}
