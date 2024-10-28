//
//  ParticleExplosionAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI

struct ParticleExplosionView: View {
    @State private var particles = Array(repeating: Particle(), count: 50)
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background

            ForEach(particles.indices, id: \.self) { index in
                Circle()
                    .fill(particles[index].color)
                    .frame(width: particles[index].size, height: particles[index].size)
                    .offset(particles[index].offset)
                    .animation(
                        Animation.interpolatingSpring(stiffness: 50, damping: 5)
                            .delay(Double(index) * 0.02),
                        value: isAnimating
                    )
            }
        }
        .onAppear {
            startAnimation()
        }
    }

    private func startAnimation() {
        particles = particles.map { particle in
            var newParticle = particle
            newParticle.offset = randomOffset()
            return newParticle
        }
        isAnimating = true
    }

    private func randomOffset() -> CGSize {
        CGSize(width: CGFloat.random(in: -200...200), height: CGFloat.random(in: -200...200))
    }
}

struct Particle {
    var color: Color = [Color.cyan, Color.pink, Color.purple, Color.blue].randomElement()!
    var size: CGFloat = CGFloat.random(in: 8...16)
    var offset: CGSize = .zero
}

struct ParticleExplosionView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleExplosionView()
    }
}
