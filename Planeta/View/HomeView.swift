//
//  HomeView.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 6/5/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showText = false
    @State private var showCapsule = false
    @State private var selectedPlanet: Planet?
    
    @StateObject private var particleVM = ParticleViewModel()
    
    let planets: [Planet] = planetas.sorted {$0.distanceFromSunKm > $1.distanceFromSunKm}
    
    var body: some View {
        
        VStack {
            Text("Planets")
                .font(.title)
                .bold()
                .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(planets) { planet in
                        Button {
                            selectedPlanet = planet
                        } label: {
                            VStack{
                                
                                Text(planet.title)
                                    .bold()
                                
                                Image(planet.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }
                        }
                        .buttonStyle(.plain)
                        .sheet(item: $selectedPlanet) { planet in
                            DetailView(planet: planet)
                        }
                    }
                }
                .scrollTargetLayout() //Con esto decimos cual son los escalones
                .padding()
            }
            .scrollTargetBehavior(.viewAligned) // Con esto provocamos el efecto de escalonar el scrollview
            .background(
                LinearGradient(
                    colors: [.yellow, .purple, .blue],
                    startPoint: .trailing,
                    endPoint: .leading
                )
            )
        }
        
        VStack {
            Text("The distance between the Sun and Earth is")
                .font(.headline)
                .bold()
            HStack {
                VStack{
                    Text("☀️")
                    Text("Sun")
                }
                
                ZStack(alignment: .leading){
                    Capsule()
                        .frame(width: 200, height: 10)
                        .foregroundStyle(.secondary)
                    
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: showCapsule ? 200 : 0, height: 10)
                        .animation(.easeInOut(duration: 2), value: showCapsule)
                }
                .frame(width: 200, height: 10)
                
                VStack{
                    Text("🌎")
                    Text("Earth")
                }
            }
            
            Text("The distance is about **149.6 millions kilometers**. ")
                .offset(y: showText ? 0 : -100)
                .opacity(showText ? 1 : 0)
                .animation(.spring(response: 2), value: showText)
            
            
            Button("Show me the distance") {
                withAnimation(.bouncy(duration: 2)){
                    showText.toggle()
                    showCapsule.toggle()
                }
            }
            .font(.headline)
            .padding()
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
            GeometryReader { geo in
                ZStack {
                    ForEach(particleVM.particles) { particle in
                        Circle()
                            .fill(particle.color)
                            .frame(width: particle.size, height: particle.size)
                            .position(
                                x: particle.x * geo.size.width,
                                y: particle.y * geo.size.height
                            )
                    }
                }
                .contentShape(Rectangle()) // Esto asegura que el área completa sea "tocable"
                .onTapGesture {
                    withAnimation {
                        particleVM.changeParticleColors()
                    }
                }
            }
            .frame(height: 200) // Puedes ajustar la altura del área de partículas
            .background(Color.black)
            .cornerRadius(16)
            .padding()
        }
        .padding()
        .onAppear {
            particleVM.createParticles(count: 100)
            particleVM.startMovingParticles()
        }
    }
}

#Preview {
    HomeView()
}
