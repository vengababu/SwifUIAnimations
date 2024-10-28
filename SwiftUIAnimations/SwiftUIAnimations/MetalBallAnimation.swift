//
//  MetalBallAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI


struct MetalBallAnimation: View {
    @State private var positions = Array(repeating: CGPoint.zero, count: 5)

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background
            
            ForEach(positions.indices, id: \.self) { i in
                Circle()
                    .fill(Color.purple.opacity(0.7))
                    .frame(width: 80, height: 80)
                    .position(positions[i])
                    .animation(
                        Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.3),
                        value: positions[i]
                    )
                    .onAppear {
                        positions[i] = randomPosition()
                    }
            }
        }
    }

    private func randomPosition() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 50...350), y: CGFloat.random(in: 50...700))
    }
}

struct MetalBallAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MetalBallAnimation()
    }
}
