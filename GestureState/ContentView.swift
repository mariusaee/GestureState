//
//  ContentView.swift
//  GestureState
//
//  Created by Marius Malyshev on 06.12.2021.
//

import SwiftUI

struct ContentView: View {
    @GestureState var dragAmount = CGSize.zero
    
    var body: some View {
        Image(systemName: "star")
            .offset(dragAmount)
            .gesture(
                DragGesture().updating($dragAmount) { value, state, transaction in
                    state = value.translation
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
