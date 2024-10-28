//
//  ExpandingCirlcanimation.swift
//  SwiftUIAnimations
//
//  Created by Venga Babu on 28/10/24.
//

import SwiftUI


struct ExpandingCirclesView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            ForEach(1...5, id: \.self) { i in
                Circle()
                    .fill(Color.blue.opacity(0.6))
                    .scaleEffect(scale + CGFloat(i) * 0.2)
                    .frame(width: 100, height: 100)
                    .opacity(1 - Double(i) * 0.2)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scale)
            }
        }
        .onAppear {
            scale = 1.5 // Expand effect
        }
    }
}

struct ExpandingCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingCirclesView()
    }
}
