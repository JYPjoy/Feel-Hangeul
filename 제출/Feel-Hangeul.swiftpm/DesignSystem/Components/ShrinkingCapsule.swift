//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import SwiftUI

struct ShrinkingCapsule: View {
    // MARK:- variables
    let animationDuration: Double = 0.4
    let rotationAngle: Angle
    let offset: CGSize
    
    @Binding var isAnimating: Bool
    @State var hideCapsule: Bool = false
    
    var body: some View {
        ZStack {
            Capsule(style: .continuous)
                .fill(.clear)
                .overlay(
                    VStack{
                        Text("쨍").foregroundColor(.j1).font(.system(size: 50)).glow()
                        Text("쨍").foregroundColor(.j2).font(.system(size: 50)).glow()
                        Text("쨍").foregroundColor(.j3).font(.system(size: 50)).glow()
                        Text("쨍").foregroundColor(.j4).font(.system(size: 45)).glow()
                        Text("쨍").foregroundColor(.j5).font(.system(size: 40)).glow()
                        Text("쨍").foregroundColor(.j6).font(.system(size: 35)).glow()
                        Text("쨍").foregroundColor(.j7).font(.system(size: 30)).glow()
                        Text("쨍").foregroundColor(.j7).font(.system(size: 25)).glow()
                        Text("쨍").foregroundColor(.j7).font(.system(size: 20)).glow()
                        Text("쨍").foregroundColor(.j7).font(.system(size: 18)).glow()
                    }
                )
                .frame(width: 40, height: self.isAnimating ? 30 : 100, alignment: .bottomLeading) //15, 30:65
                .rotationEffect(rotationAngle)
        }
        .offset(offset)
        .animation(Animation.easeIn(duration: animationDuration))
    }
}


struct ShrinkingCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ShrinkingCapsule(rotationAngle: .degrees(35), offset: CGSize(width: 10, height: 10), isAnimating: .constant(false))
    }
}
