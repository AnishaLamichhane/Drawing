//
//  Challenge1&2.swift
//  project 9 Challenge
//
//  Created by Anisha Lamichhane on 5/26/21.
//

import SwiftUI

struct Arrow: InsettableShape {
    var insetAmount: CGFloat = 0
    
    var animatableData: CGFloat{
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let distance = (rect.midX) / 2
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to:CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to:CGPoint(x: rect.minX + distance, y: rect.midY))
        path.addLine(to:CGPoint(x: rect.minX + distance, y: rect.maxY))
        path.addLine(to:CGPoint(x: rect.maxX - distance, y: rect.maxY))
        path.addLine(to:CGPoint(x: rect.maxX - distance, y: rect.midY))
        path.addLine(to:CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to:CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
    
//    challenge 2
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
    
}

struct Challenge1_2: View {
    @State private var insetAmount: CGFloat = 1
    var body: some View {
        VStack {
            Arrow()
            .strokeBorder(Color.green, style: StrokeStyle(lineWidth: insetAmount, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 300, alignment: .center)
            .padding([.horizontal, .bottom])
            
//            challenge 2
            Button ("Tap Me" ){
                withAnimation(.linear(duration: 3)) {
                    self.insetAmount = (self.insetAmount == 1) ? 20 : 1
                }
                
            }
            .foregroundColor(.orange)
            .font(.title)
            
        }
    }
}

struct Challenge1_2_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1_2().preferredColorScheme(.dark)
    }
}
