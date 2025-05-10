//
//  GridCellView.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 7/5/25.
//

import SwiftUI

struct GridCellView: View {
    
    let planet: Planet

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray)
                .opacity(0.2)
            
            VStack{
                
                Text(planet.title)
                    .font(.headline)
                
                Image(planet.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
            }
        }
    }
}

#Preview {
    GridCellView(planet: Planet(name: "earth", title: "Earth", description: "The third planet from the Sun and the only known place in the universe to support life.", diameterKm: 12742, distanceFromSunKm: 149600000))
}
