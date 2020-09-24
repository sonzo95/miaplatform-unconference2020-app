//
//  ContentView.swift
//  Demo
//
//  Created by Stefano Sonzogni on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var guitarViewModel: GuitarViewModel
    
    var body: some View {
        NavigationView {
            List(guitarViewModel.guitars) { guitar in
                NavigationLink(destination: GuitarDetailView(guitar: guitar)) {
                    GuitarView(guitar: guitar)
                }
            }
            .navigationBarTitle(Text("Guitar Catalog"))
        }
        .onAppear(perform: {
            guitarViewModel.fetch()
        })
    }
}

struct GuitarView: View {
    var guitar: Guitar
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(guitar.imageName).resizable().aspectRatio(contentMode: .fill)
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(guitar.name).font(.system(size: 24, weight: .semibold, design: .default)).foregroundColor(.init(white: 0.1))
                    Spacer()
                    if guitar.isFavorite {
                        Image(systemName: "heart.fill").foregroundColor(.red)
                    } else {
                        Image(systemName: "heart").foregroundColor(.red)
                    }
                }
                Text(guitar.description).font(.body).foregroundColor(.init(white: 0.4))
            }.padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        }.background(Color.init(white: 0.97)).cornerRadius(16).shadow(radius: 8)
    }
}

struct GuitarDetailView: View {
    
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

struct ContentView_Previews: PreviewProvider {
    
    static let gvm = GuitarViewModel()
    
    static var previews: some View {
        ContentView(guitarViewModel: gvm)
    }
}
