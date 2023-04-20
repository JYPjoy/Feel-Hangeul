//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import SwiftUI

struct CapusuleGroupView: View {
    
    // MARK:- variables
    @Binding var isAnimating: Bool
    
    // MARK:- views
    var body: some View {
        ZStack {
            ShrinkingCapsule(rotationAngle: .degrees(-180), offset: CGSize(width: 0, height: -15), isAnimating: $isAnimating)
            ShrinkingCapsule(rotationAngle: .degrees(-220), offset: CGSize(width: -80, height: 7.5), isAnimating: $isAnimating)
            ShrinkingCapsule(rotationAngle: .degrees(-150), offset: CGSize(width: 80, height: 7.5), isAnimating: $isAnimating)
            ShrinkingCapsule(rotationAngle: .degrees(-240), offset: CGSize(width: -135, height: 70), isAnimating: $isAnimating)
            ShrinkingCapsule(rotationAngle: .degrees(230), offset: CGSize(width: 135, height: 70), isAnimating: $isAnimating)
            
            LowerCapsuleView(isAnimating: $isAnimating)
        }
        .onTapGesture {
            self.isAnimating.toggle()
        }
    }
}

struct CapusuleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CapusuleGroupView(isAnimating: .constant(false))
    }
}
