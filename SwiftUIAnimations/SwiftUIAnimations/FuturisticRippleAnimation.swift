//
//  FuturisticRippleAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI

struct FuturisticRippleAnimation: View {
    @State private var isAnimating = false

    let colors: [Color] = [
        Color.blue.opacity(0.8),
        Color.cyan.opacity(0.7),
        Color.pink.opacity(0.6),
        Color.purple.opacity(0.5)
    ]

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Background
            
            ForEach(0..<8) { i in
                Circle()
                    .stroke(colors[i % colors.count], lineWidth: 4)
                    .frame(width: isAnimating ? CGFloat(300 + i * 50) : 0,
                           height: isAnimating ? CGFloat(300 + i * 50) : 0)
                    .scaleEffect(isAnimating ? 1.2 : 0.5)
                    .opacity(isAnimating ? 0.1 : 1.0)
                    .blur(radius: isAnimating ? 15 : 5)
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.2),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct FuturisticRippleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FuturisticRippleAnimation()
    }
}
