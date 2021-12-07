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
    @State private var position = CGSize.zero
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
                // Ниже пишем код
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
                // Ниже пишем код
                .foregroundColor(isLongPressed ? .red : .blue)
                .scaleEffect(isLongPressed ? 2 : 1)
                .gesture(
                    LongPressGesture().updating($isLongPressed) { value, state, transaction in
                        state = value
                    }
                )
                .animation(.spring(), value: isLongPressed)
            
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
                // Ниже пишем код
                .offset(x: position.width, y: position.height)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            position = value.translation
                        })
                        .onEnded({ value in
                            position = .zero
                        })
                )
                .animation(Animation.linear, value: position)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
