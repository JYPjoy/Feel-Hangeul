//
//  File.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct ShiningView: View {
    // MARK:- variables
    @Binding var isAnimating: Bool
    
    // MARK:- views
    var body: some View {
        ZStack {
            InnerShiningView(rotationAngle: .degrees(-180), offset: CGSize(width: 0, height: -15), isAnimating: $isAnimating)
            InnerShiningView(rotationAngle: .degrees(-220), offset: CGSize(width: -80, height: 7.5), isAnimating: $isAnimating)
            InnerShiningView(rotationAngle: .degrees(-150), offset: CGSize(width: 80, height: 7.5), isAnimating: $isAnimating)
            InnerShiningView(rotationAngle: .degrees(-240), offset: CGSize(width: -135, height: 70), isAnimating: $isAnimating)
            InnerShiningView(rotationAngle: .degrees(230), offset: CGSize(width: 135, height: 70), isAnimating: $isAnimating)
            
            
            ZStack {
                InnerShiningView(rotationAngle: .degrees(16), offset: CGSize(width: -42.5, height: 10), isAnimating: $isAnimating)
                InnerShiningView(rotationAngle: .degrees( -16), offset: CGSize(width: 42.5, height: 10), isAnimating: $isAnimating)
                InnerShiningView(rotationAngle: .degrees(48), offset: CGSize(width: -107, height: -30), isAnimating: $isAnimating)
                InnerShiningView(rotationAngle: .degrees(-48), offset: CGSize(width: 107, height: -30), isAnimating: $isAnimating)
                InnerShiningView(rotationAngle: .degrees(82), offset: CGSize(width: -142, height: -95), isAnimating: $isAnimating )
                InnerShiningView(rotationAngle: .degrees(-82), offset: CGSize(width: 142, height: -95), isAnimating: $isAnimating)
            }
            .offset(y: 260)

            
        }
        .onTapGesture { // .onTapGesture
            self.isAnimating.toggle()
        }
    }
}

struct UpperCapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        ShiningView(isAnimating: .constant(false))
    }
}
