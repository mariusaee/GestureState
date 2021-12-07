//
//  ExampleView.swift
//  GestureState
//
//  Created by Marius Malyshev on 07.12.2021.
//

import SwiftUI

struct ExampleView: View {
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

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
