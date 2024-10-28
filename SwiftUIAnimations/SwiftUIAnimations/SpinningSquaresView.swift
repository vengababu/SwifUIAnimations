//
//  SpinningSquare.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI

struct SpinningSquaresView: View {
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            ForEach(0..<8) { i in
                Rectangle()
                    .fill(Color.blue.opacity(0.7))
                    .frame(width: 40, height: 40)
                    .offset(x: 100, y: 0)
                    .rotationEffect(.degrees(rotation + Double(i) * 45))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: rotation)
            }
        }
        .onAppear {
            rotation = 360 // Full rotation
        }
    }
}

struct SpinningSquaresView_Previews: PreviewProvider {
    static var previews: some View {
        SpinningSquaresView()
    }
}
