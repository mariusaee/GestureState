//
//  ContentView.swift
//  GestureState
//
//  Created by Marius Malyshev on 06.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragAmount = CGSize.zero
    
    var body: some View {
        Image(systemName: "star")
            .offset(dragAmount)
            .gesture(
                DragGesture().updating($dragAmount) { value, state, transaction in
                    state = value.translation
                }
            )
            .animation(Animation.linear, value: dragAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
