//
//  FireFlySwarnAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI


struct FireFlySwarnAnimation: View {
    @State private var fireflies = Array(repeating: Firefly(), count: 30)

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background

            ForEach(fireflies.indices, id: \.self) { index in
                Circle()
                    .fill(fireflies[index].color)
                    .frame(width: fireflies[index].size, height: fireflies[index].size)
                    .position(fireflies[index].position)
                    .animation(
                        Animation.linear(duration: 3)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.1),
                        value: fireflies[index].position
                    )
                    .onAppear {
                        fireflies[index].position = randomPosition()
                    }
            }
        }
    }

    private func randomPosition() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 0...400), y: CGFloat.random(in: 0...800))
    }
}

struct Firefly {
    var color: Color = [Color.yellow, Color.green, Color.cyan].randomElement()!
    var size: CGFloat = CGFloat.random(in: 5...10)
    var position: CGPoint = .zero
}

struct FireFlySwarnAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FireFlySwarnAnimation()
    }
}
