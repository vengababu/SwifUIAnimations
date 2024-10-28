//
//  SpiralGalaxyAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI


struct SpiralGalaxyAnimation: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background
            
            ForEach(0..<100) { i in
                Circle()
                    .fill(Color.white.opacity(0.7))
                    .frame(width: 3, height: 3)
                    .offset(
                        x: CGFloat(i) * cos(Double(i) / 5) * 2,
                        y: CGFloat(i) * sin(Double(i) / 5) * 2
                    )
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(
                        Animation.linear(duration: Double(i) / 20 + 5)
                            .repeatForever(autoreverses: false),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct SpiralGalaxyAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SpiralGalaxyAnimation()
    }
}
