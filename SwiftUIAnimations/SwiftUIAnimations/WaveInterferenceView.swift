//
//  WaveAnimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI


struct WaveInterferenceView: View {
    @State private var phase = 0.0
    @State private var colorChange: CGFloat = 0.0
    @State private var waveAmplitude: CGFloat = 20

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background
            
            ForEach(0..<6) { i in
                WaveShape(phase: phase + Double(i) * .pi / 3, amplitude: waveAmplitude)
                    .stroke(Color(hue: Double(colorChange), saturation: 1, brightness: 1), lineWidth: 2)
                    .frame(height: 150)
                    .offset(y: CGFloat(i) * 25 - 75)
            }
        }
        .onAppear {
            // Start a timer to update the phase, color, and amplitude continuously
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                phase += 0.1 // Increment phase for wave animation
                colorChange += 0.01 // Change color hue over time
                waveAmplitude = 20 + sin(phase * 0.5) * 10 // Vary amplitude dynamically

                if colorChange > 1 {
                    colorChange -= 1 // Reset color change
                }
            }
        }
    }
}

struct WaveShape: Shape {
    var phase: Double
    var amplitude: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midHeight = rect.height / 2
        let waveLength = rect.width / 10  // Adjusted wave length

        path.move(to: CGPoint(x: 0, y: midHeight))

        for x in stride(from: 0, to: rect.width, by: 1) {
            // Create a wave with varying amplitude
            let y = sin((x / waveLength) + phase) * amplitude + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}

struct WaveInterferenceView_Previews: PreviewProvider {
    static var previews: some View {
        WaveInterferenceView()
    }
}
