//
//  ParticleViewModel.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 10/5/25.
//

import SwiftUI

class ParticleViewModel: ObservableObject {
    @Published var particles: [Particle] = []
    private var timer: Timer?
    
    func createParticles(count: Int, color: Color = .blue) {
        particles = (0..<count).map { _ in
            Particle(
                x: CGFloat.random(in: 0...1),
                y: CGFloat.random(in: 0...1),
                size: CGFloat.random(in: 2...6),
                velocity: CGSize(
                    width: CGFloat.random(in: -0.005...0.005),
                    height: CGFloat.random(in: -0.005...0.005)
                ),
                color: color
            )
        }
    }
    
    
    func startMovingParticles() {
        timer?.invalidate() // detener si ya existe
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { _ in
            for i in self.particles.indices {
                self.particles[i].x += self.particles[i].velocity.width
                self.particles[i].y += self.particles[i].velocity.height
                
                // Si se sale de los límites, rebota
                if self.particles[i].x < 0 || self.particles[i].x > 1 {
                    self.particles[i].velocity.width *= -1
                }
                if self.particles[i].y < 0 || self.particles[i].y > 1 {
                    self.particles[i].velocity.height *= -1
                }
            }
        }
    }
    
    func changeParticleColors() {
        let newColor = Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
        
        for i in particles.indices {
            particles[i].color = newColor
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
