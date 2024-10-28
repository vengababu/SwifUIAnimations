//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI

struct RippleAnimationView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Background color
            
            ForEach(0..<5) { i in
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color(hue: 0.6, saturation: 0.5, brightness: 1.0 - Double(i) * 0.2))
                    .frame(width: isAnimating ? CGFloat(100 + i * 100) : 50, height: isAnimating ? CGFloat(100 + i * 100) : 50)
                    .scaleEffect(isAnimating ? 1.5 : 0.5) // Controls scaling during animation
                    .opacity(isAnimating ? 0.1 : 1.0) // Fades out as it expands
                    .animation(
                        Animation.easeOut(duration: 1.5).repeatForever(autoreverses: false)
                            .delay(Double(i) * 0.3), // Staggered effect for ripples
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            isAnimating = true // Start animation on appear
        }
    }
}

struct RippleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        RippleAnimationView()
    }
}
