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
        VStack(spacing: 30) {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(dragAmount)
                .gesture(
                    DragGesture().updating($dragAmount) { value, state, transaction in
                        state = value.translation
                    }
                )
                .animation(Animation.linear, value: dragAmount)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(isLongPressed ? .red : .blue)
                .scaleEffect(isLongPressed ? 2 : 1)
                .gesture(
                    LongPressGesture().updating($isLongPressed, body: { value, state, transaction in
                        state = value
                    })
                )
                .animation(.spring(), value: isLongPressed)
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 150, height: 150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
