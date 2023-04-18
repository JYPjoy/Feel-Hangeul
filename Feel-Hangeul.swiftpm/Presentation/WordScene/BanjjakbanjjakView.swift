//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/18.
// TODO: 반짝, scaleEffect, 글자들로 별 모양 만들어도 괜찮을 듯

import SwiftUI

struct BanjjakbanjjakView: View {
    @State var scale : CGFloat = 0.5
    @State private var value = 1.0
        private let letters = Array("반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝")
    
    var body: some View {
        ZStack {
            Color(UIColor.black)
                .ignoresSafeArea()
            
            ZStack{
                ForEach (0..<100, id:\.self) { num in
                    Circle ()
                        .overlay(
                            Text(String(letters[num]))
                                .font(.system(size: 18))
                                .foregroundColor([.b1, .b2, .b3, .b4, .b5, .b6, .b7].randomElement())
                        )
                        .opacity(value)
                        .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: true))
                        .onAppear { self.value = 0 }
                        .scaleEffect(self.scale * .random(in: 1...2.5))
                        .frame(width: .random(in: 1...100),
                               height: CGFloat.random (in:20...100),
                               alignment: .center)
                        .position(CGPoint(x: .random(in: 0...Const.width),y: .random(in:0...Const.height)))
                }
            }.glow()
            DetailWordView(word: "반짝반짝", meaning: "[Ban-jjak-Ban-jjak]", explanation: "반짝반짝 is a Korean mimetic word, which mimcs the sound of rain falling.", example1: "- 애플 아카데미에서의 감정들", example2: "- It has been raining 주룩주룩 all thorugh the night.").glow()
        }
        .onAppear {
            self.scale = 1.2
        }
    }
}

struct BanjjakbanjjakView_Previews: PreviewProvider {
    static var previews: some View {
        BanjjakbanjjakView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}