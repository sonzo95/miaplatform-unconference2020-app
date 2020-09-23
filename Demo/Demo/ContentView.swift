//
//  ContentView.swift
//  Demo
//
//  Created by Stefano Sonzogni on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
    var items = [
        Guitar(name: "PRS Semi Hollow", description: "Semi-hollow, 24.5\" scale, PRS HSH pickups", imageName: "prs-semi-hollow"),
        Guitar(name: "PRS Silver Sky", description: "Full-body, 25.5\" scale, PRS single coil pickups", imageName: "prs-silver-sky"),
        Guitar(name: "PRS Semi Hollow", description: "Full-body, 24.5\" scale, Fender V-mod pickups", imageName: "fender-telecaster"),
        Guitar(name: "PRS Semi Hollow", description: "Full-body, 25.5\" scale, Seymour Duncan pickups", imageName: "ibanez-rg"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Guitar Catalog").font(.largeTitle).padding()
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(items) {
                        guitar in
                        GuitarView(guitar: guitar)
                    }
                }.padding()
            }
        }
    }
}

struct GuitarView: View {
    var guitar: Guitar
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(guitar.imageName).resizable().aspectRatio(contentMode: .fill)
            VStack(alignment: .leading, spacing: 6) {
                Text(guitar.name).font(.system(size: 24, weight: .semibold, design: .default)).foregroundColor(.init(white: 0.1))
                Text(guitar.description).font(.body).foregroundColor(.init(white: 0.4))
            }.padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        }.background(Color.init(white: 0.97)).cornerRadius(16).shadow(radius: 8)
    }
}

struct Guitar: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
