//
//  Guitar.swift
//  Demo
//
//  Created by Simone Montalto on 24/09/20.
//

import Foundation

struct Guitar: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var isFavorite = false
}
