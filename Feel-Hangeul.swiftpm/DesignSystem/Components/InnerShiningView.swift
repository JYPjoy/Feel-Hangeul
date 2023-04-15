//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct InnerShiningView: View {
    
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
                .frame(width: 50, height: 300, alignment: .bottomLeading)
                .overlay(
                    VStack(spacing: 30) {
                        //CGAffineTransform
                        Text("").foregroundColor(.yellow).font(.system(size: 35))
                        Text("").foregroundColor(.yellow).font(.system(size: 35))
                        Text("").foregroundColor(.yellow).font(.system(size: 35))
                        Text("쨍").foregroundColor(.yellow).font(.system(size: 35))
                        Text("쨍").foregroundColor(.yellow).font(.system(size: 25))
                        Text("쨍").foregroundColor(.yellow).font(.system(size: 20))
                        Text("쨍").foregroundColor(.yellow).font(.system(size: 15))
                        Text("쨍").foregroundColor(.yellow).font(.system(size: 10))
                        Text("쨍").foregroundColor(.yellow).font(.system(size: 5))
                    })
                .rotationEffect(rotationAngle) //30: 65
        }.offset(offset)
    }
}

struct InnerShiningView_Previews: PreviewProvider {
    static var previews: some View {
        InnerShiningView(rotationAngle: .degrees(35), offset: CGSize(width: 10, height: 10), isAnimating: .constant(false))
    }
}
