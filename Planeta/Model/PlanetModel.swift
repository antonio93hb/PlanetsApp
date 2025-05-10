//
//  Planet.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 5/5/25.
//

import SwiftUI

struct Planet: Identifiable {
    let id = UUID()
    let name: String
    let title: String
    let description: String
    let diameterKm: Int
    let distanceFromSunKm: Int
}
