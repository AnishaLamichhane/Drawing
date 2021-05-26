//
//  Challenge3.swift
//  project 9 Challenge
//
//  Created by Anisha Lamichhane on 5/26/21.
//

import SwiftUI

struct colorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var body: some View {
        ZStack{
            ForEach(0..<steps){ value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        color(for: value, brightness: 1),
                        color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double)-> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
        
    }
}

struct Challenge3: View {
    @State private var colorCycle: CGFloat = 0.0
    var body: some View {
        VStack {
            colorCyclingRectangle(amount: Double(self.colorCycle))
            .frame(width: 300, height: 300)
                .padding([.horizontal, .bottom])
            Slider(value: $colorCycle)
                .padding([.horizontal, .bottom])
        }
    }
}

struct Challenge3_Previews: PreviewProvider {
    static var previews: some View {
        Challenge3().preferredColorScheme(.dark)
    }
}
