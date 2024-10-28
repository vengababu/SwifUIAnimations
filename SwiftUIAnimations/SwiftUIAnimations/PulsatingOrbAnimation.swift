//
//  PulsatingOrbAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI

struct PulsatingOrbAnimation: View {
    @State private var isAnimating = false
    
    let colors: [Color] = [
        .blue, .purple, .cyan, .pink
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background
            
            ForEach(0..<4) { i in
                Circle()
                    .fill(colors[i].opacity(0.6))
                    .frame(width: isAnimating ? CGFloat(150 + i * 50) : 100,
                           height: isAnimating ? CGFloat(150 + i * 50) : 100)
                    .scaleEffect(isAnimating ? 1.3 : 0.8)
                    .blur(radius: 10)
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.3),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct PulsatingOrbAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingOrbAnimation()
    }
}
