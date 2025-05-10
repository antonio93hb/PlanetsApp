//
//  ContentView.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("List", systemImage: "list.bullet") {
                ListView()
            }
            Tab("Grid", systemImage: "square.grid.3x3") {
                GridView()
            }
            Tab("Questionnaire", systemImage: "questionmark.circle") {
                QuestionnaireView()
            }
        }
        //.tabViewStyle(.tabBarOnly)
    }
}

#Preview {
    ContentView()
}
