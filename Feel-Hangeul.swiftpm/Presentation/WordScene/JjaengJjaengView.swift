//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct JjaengJjaengView: View {
    @StateObject var coordinator = Coordinator()
    // MARK: - variables
    let animationDuration: Double = 0.25
    @State var isAnimating: Bool = false
    @State var shrinkIcon: Bool = false
    @State var floatLike: Bool = false
    @State var showFlare: Bool = false
    @State var show: Bool = false
    
    var sun: some View {
        Circle()
    }
    
    // MARK: - views
    var body: some View {
        ZStack {
            coordinator.navigationLinkSection()
            Color.black
                .edgesIgnoringSafeArea(.all)
            HStack(spacing: 120){
                ZStack() {
                    if (floatLike) {
                        CapusuleGroupView(isAnimating: $floatLike)
                            .offset(y: -130)
                            .scaleEffect(self.showFlare ? 1.1 : 0.9)
                            .opacity(self.floatLike ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).repeatForever())
                    }
                    sun.foregroundColor(self.isAnimating ? Color.red : Color.j1).glow()
                    Text("Long Press this circle\nfor 1second.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(self.isAnimating ? .black : .white)
                        .font(.system(size: 20, weight: .bold))
                    
                }
                .frame(width: 300, height: 300)
                .scaleEffect(self.shrinkIcon ? 0.35 : 1)
                .animation(Animation.spring(response: animationDuration, dampingFraction: 1, blendDuration: 1))
                .onLongPressGesture(minimumDuration: 0.2) {
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
                VStack {
                    Spacer()
                    Spacer()
                    DetailWordView(word: "쨍쨍", meaning: "[Jjaeng-Jjaeng]", explanation: "▶︎ \"쨍쨍\"is a Korean mimic word, used to describe\n the sun is blazing down intensely.", example: "▶︎ (ex) These days Texas's weather is so nice \nand sunny. The sun is blazing down 쨍쨍 on us.")
                        .padding()
                    Spacer()
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(destination: .main)
                } label: {
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
