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
        VStack(alignment: .leading) {
            Text("Guitar Catalog").font(.largeTitle).padding()
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(guitarViewModel.guitars) {
                        guitar in
                        GuitarView(guitar: guitar)
                    }
                }.padding()
            }
        }.onAppear(perform: {
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
