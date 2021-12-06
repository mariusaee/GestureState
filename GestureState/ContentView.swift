//
//  ContentView.swift
//  GestureState
//
//  Created by Marius Malyshev on 06.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragAmount = CGSize.zero
    @GestureState private var isLongPressed = false
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(dragAmount)
                .gesture(
                    DragGesture().updating($dragAmount) { value, state, transaction in
                        state = value.translation
                    }
                )
                .animation(Animation.linear, value: dragAmount)
            
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(isLongPressed ? .blue : .red)
                .scaleEffect(isLongPressed ? 2 : 1)
                .gesture(
                    LongPressGesture().updating($isLongPressed, body: { value, state, transaction in
                        state = value
                    })
                )
                .animation(.spring(), value: isLongPressed)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
