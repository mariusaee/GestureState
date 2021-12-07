//
//  ContentView.swift
//  GestureState
//
//  Created by Marius Malyshev on 06.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width: 150, height: 150)
            
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
