//
//  GuitarViewModel.swift
//  Demo
//
//  Created by Simone Montalto on 24/09/20.
//

import Foundation
import Combine

class GuitarViewModel: ObservableObject {
    
    @Published var guitars = [Guitar]()
    
    func fetch() {
        guitars = [
            Guitar(name: "PRS Semi Hollow", description: "Semi-hollow, 24.5\" scale, PRS HSH pickups", imageName: "prs-semi-hollow"),
            Guitar(name: "PRS Silver Sky", description: "Full-body, 25.5\" scale, PRS single coil pickups", imageName: "prs-silver-sky"),
            Guitar(name: "PRS Semi Hollow", description: "Full-body, 24.5\" scale, Fender V-mod pickups", imageName: "fender-telecaster"),
            Guitar(name: "PRS Semi Hollow", description: "Full-body, 25.5\" scale, Seymour Duncan pickups", imageName: "ibanez-rg"),
        ]
    }
    
}
