//
//  GuitarDetailView.swift
//  Demo
//
//  Created by Stefano Sonzogni on 24/09/2020.
//

import SwiftUI
import Combine

struct GuitarDetailView: View {
    
    @ObservedObject var guitar: Guitar
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image(guitar.imageName).resizable().aspectRatio(contentMode: .fit).mask(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.clear]), startPoint: .top, endPoint: .bottom))
            }
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(guitar.name).font(.system(size: 20, weight: .semibold, design: .default)).foregroundColor(.init(white: 0.1))
                    Spacer()
                    if guitar.isFavorite {
                        Image(systemName: "heart.fill").foregroundColor(.red).onTapGesture(perform: {
                            guitar.isFavorite.toggle()
                        })
                    } else {
                        Image(systemName: "heart").foregroundColor(.red).onTapGesture(perform: {
                            guitar.isFavorite.toggle()
                        })
                    }
                }
                Text(guitar.description).font(.subheadline).foregroundColor(.init(white: 0.4))
            }.padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            
            Spacer()
        }
    }
    
}

struct GuitarDetailView_Previews: PreviewProvider {
    
    static let guitar = Guitar(name: "PRS Semi Hollow", description: "Semi-hollow, 24.5\" scale, PRS HSH pickups", imageName: "prs-semi-hollow")
    
    static var previews: some View {
        GuitarDetailView(guitar: guitar)
    }
}
