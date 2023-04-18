//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct JjaengJjaengView: View {
    
    // MARK: - variables
    let animationDuration: Double = 0.25
    @State var isAnimating: Bool = false
    @State var shrinkIcon: Bool = false
    @State var floatLike: Bool = false
    @State var showFlare: Bool = false
    
    var sun: some View {
        Circle()
    }
    
    // MARK: - views
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            HStack{
                Spacer()
                ZStack() {
                    if (floatLike) {
                        CapusuleGroupView(isAnimating: $floatLike)
                            .offset(y: -130)
                            .scaleEffect(self.showFlare ? 1.2 : 0.9)
                            .opacity(self.floatLike ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).repeatForever())
                    }
                    sun.foregroundColor(self.isAnimating ? Color.red : Color.j1).glow()
                    Text("Long Press this circle.")
                        .foregroundColor(self.isAnimating ? .black : .white)
                        .font(.system(size: 25))
                    
                }
                .frame(width: 300, height: 300)
                .scaleEffect(self.shrinkIcon ? 0.35 : 1)
                .animation(Animation.spring(response: animationDuration, dampingFraction: 1, blendDuration: 1))
                .offset(x: -200, y:0)
                .onLongPressGesture {
                    if (!floatLike) {
                        self.floatLike.toggle()
                        self.isAnimating.toggle()
                        self.shrinkIcon.toggle()
                        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                            self.shrinkIcon.toggle()
                            self.showFlare.toggle()
                        }
                    } else {
                        self.isAnimating = false
                        self.shrinkIcon = false
                        self.showFlare = false
                        self.floatLike = false
                    }
                }
                
                VStack(){
                    Spacer()
                    DetailWordView(word: "쨍쨍", meaning: "[Jjaeng-Jjaeng]", explanation: "주룩주룩 is a Korean mimetic word, \nwhich mimcs the sound of rain falling.", example1: "ex> It has been raining 주룩주룩 all through the night.", example2: "ex> It has been raining 주룩주룩 all through the night.")
                        .padding()
                }
            }
            
        }
    }
}


struct JjaengJjaengView_Previews: PreviewProvider {
    static var previews: some View {
        JjaengJjaengView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
