//
//  Guitar.swift
//  Demo
//
//  Created by Simone Montalto on 24/09/20.
//

import Foundation
import Combine

class Guitar: Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    @Published var isFavorite = false
    
    init(name: String, description: String, imageName: String) {
        self.name = name
        self.description = description
        self.imageName = imageName
    }
}
