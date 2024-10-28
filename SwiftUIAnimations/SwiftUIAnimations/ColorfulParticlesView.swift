//
//  ColorparticleVw.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI


struct ColorfulParticlesView: View {
    @State private var particles: [Particle1] = []
    private let particleCount = 100

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(particle.position)
                    .opacity(particle.opacity)
                    .animation(.easeInOut(duration: particle.animationDuration), value: particle.opacity)
            }
        }
        .onAppear {
            createParticles()
        }
    }

    private func createParticles() {
        for _ in 0..<particleCount {
            let size = CGFloat.random(in: 5...15)
            let x = CGFloat.random(in: 0...UIScreen.main.bounds.width)
            let y = CGFloat.random(in: 0...UIScreen.main.bounds.height)
            let color = Color.random()
            let animationDuration = Double.random(in: 0.5...1.5)

            let particle = Particle1(position: CGPoint(x: x, y: y), size: size, color: color, opacity: 1.0, animationDuration: animationDuration)
            particles.append(particle)

            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                if let index = self.particles.firstIndex(where: { $0.id == particle.id }) {
                    self.particles[index].opacity = 0
                }
            }
        }
    }
}

struct Particle1: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat
    var color: Color
    var opacity: Double
    var animationDuration: Double
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

struct ColorfulParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulParticlesView()
    }
}
