//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct JjaengJjaengView: View {
    // MARK:- variables
    let animationDuration: Double = 0.25
    @State var isAnimating: Bool = false
    @State var shrinkIcon: Bool = false
    @State var floatLike: Bool = false
    @State var showFlare: Bool = false
    
    var shining: some View {
        ShiningView(isAnimating: $floatLike)
            .offset(y: -130)
            .animation(Animation.spring().delay(animationDuration / 2))
    }
    var sun: some View {
        Circle()
    }

    // MARK:- views
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack(){
                if (floatLike) {
                    shining
                }
                sun.foregroundColor(self.isAnimating ? Color.yellow : Color.likeOverlay).glow()
                Text("Long Press this circle")
                    .foregroundColor(self.isAnimating ? .black : .white)
            }
            .frame(width: 300, height: 300)
        }
        .onLongPressGesture {
            if (!floatLike) {
                sun.frame(width: 300, height: 300)
                self.floatLike.toggle()
                self.isAnimating.toggle()
                Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
                    self.shrinkIcon.toggle()
                    self.showFlare.toggle()
                }
            } else {
                self.isAnimating = false
                self.showFlare = false
                self.floatLike = false
            }
        }
        .animation(.easeOut(duration: 2), value: isAnimating)
    }
}




struct JjaengJjaengView_Previews: PreviewProvider {
    static var previews: some View {
        JjaengJjaengView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
