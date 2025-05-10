//
//  GridView.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 7/5/25.
//

import SwiftUI

struct GridView: View {
    
    let planets: [Planet] = planetas
    
    let adaptative: [GridItem] = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptative) {
                    ForEach(planets) { planet in
                        NavigationLink(destination: DetailView(planet: planet)) {
                            HStack{
                                GridCellView(planet: planet)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .safeAreaPadding()
            .navigationTitle("Planets")
        }
    }
}

#Preview {
    GridView()
}
