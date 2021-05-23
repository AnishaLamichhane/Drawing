//
//  MetalRendering.swift
//  project 9
//
//  Created by Anisha Lamichhane on 5/22/21.
//

import SwiftUI
struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    var body: some View {
        ZStack{
            ForEach(0..<steps){ value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        color(for: value, brightness: 1),
                        color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        } // The drawingGroup() modifier is helpful to know about and to keep in your arsenal as a way to solve performance problems when you hit them, but you should not use it that often.
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

struct MetalRendering: View {
    @State private var colorCycle = 0.0
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            Slider(value: $colorCycle)
        }
    }
}

struct MetalRendering_Previews: PreviewProvider {
    static var previews: some View {
        MetalRendering()
    }
}
