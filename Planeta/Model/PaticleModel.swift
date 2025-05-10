//
//  PaticleModel.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 10/5/25.
//

import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat // Posición horizontal (relativa: 0 a 1)
    var y: CGFloat // Posición vertical (relativa: 0 a 1)
    var size: CGFloat  // Tamaño de la partícula
    var velocity: CGSize // Velocidad de movimiento en x e y
    var color: Color       
}
