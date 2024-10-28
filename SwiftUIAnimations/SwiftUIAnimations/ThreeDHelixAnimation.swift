//
//  3DHelixAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI

struct ThreeDHelixAnimation: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background
            
            ForEach(0..<30) { i in
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [color(at: i), color(at: i + 1)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 12, height: 12) // Particle size
                    .offset(
                        x: CGFloat(sin(Double(i) * .pi / 15) * 100),
                        y: CGFloat(cos(Double(i) * .pi / 15) * 50)
                    )
                    .rotationEffect(.degrees(isAnimating ? Double(i) * 12 : 0))
                    .animation(
                        Animation.linear(duration: 6)
                            .repeatForever(autoreverses: false),
                        value: isAnimating
                    )
                    .opacity(isAnimating ? 0.7 : 1.0)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }

    private func color(at index: Int) -> Color {
        let hue = Double(index % 15) / 15.0
        return Color(hue: hue, saturation: 0.8, brightness: 1.0)
    }
}

struct ThreeDHelixAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDHelixAnimation()
    }
}
