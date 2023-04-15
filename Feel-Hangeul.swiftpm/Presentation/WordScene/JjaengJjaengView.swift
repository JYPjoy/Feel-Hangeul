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
    
    // MARK:- views
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack(){
                if (floatLike) {
                    ShiningView(isAnimating: $floatLike)
                        .offset(y: -130)
                        .animation(Animation.spring().delay(animationDuration / 2))
                }
                Circle()
                    .foregroundColor(self.isAnimating ? Color.likeColor : Color.likeOverlay)
            }
            .frame(width: 250, height: 250)
            .offset(x: -200, y: -80)
        }
        .onLongPressGesture {
            if (!floatLike) {
                self.floatLike.toggle()
                self.isAnimating.toggle()
                Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
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
