//
//  ExampleView.swift
//  GestureState
//
//  Created by Marius Malyshev on 07.12.2021.
//

import SwiftUI

struct ExampleView: View {
    
    @State private var position = CGSize.zero
    @GestureState private var trianglePosition = CGSize.zero
    @GestureState private var isLongPressed = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
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
                .animation(.linear, value: position)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(trianglePosition)
                .gesture(
                    DragGesture()
                        .updating($trianglePosition, body: { value, state, transaction in
                            state = value.translation
                        })
                )
                .animation(.linear, value: trianglePosition)
            
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(isLongPressed ? .red : .blue)
                .scaleEffect(isLongPressed ? 2 : 1)
                .gesture(
                    LongPressGesture()
                        .updating($isLongPressed) { value, state, _ in
                            state = value
                        }
                )
                .animation(.spring(), value: isLongPressed)
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
