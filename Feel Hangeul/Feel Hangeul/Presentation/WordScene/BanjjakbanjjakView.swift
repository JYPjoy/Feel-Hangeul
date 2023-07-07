//
//  BanjjakbanjjakView.swift
//  Feel Hangeul
//
//  Created by Joy on 2023/07/08.
// TODO: 반짝, scaleEffect, 글자들로 별 모양 만들어도 괜찮을 듯

import SwiftUI

struct BanjjakbanjjakView: View {
    @StateObject var coordinator = Coordinator()
    @State var scale : CGFloat = 0.5
    @State private var value = 1.0
    @State var show = false
    
        private let letters = Array("반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝반짝")
    
    var body: some View {
        ZStack {
            coordinator.navigationLinkSection()
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
                        .animation(Animation.linear(duration:1.2).repeatForever(autoreverses: true), value: show)
                        .onAppear { self.value = 0 }
                        .scaleEffect(self.scale * .random(in: 1...2.5))
                        .frame(width: .random(in: 1...100),
                               height: CGFloat.random (in:20...100),
                               alignment: .center)
                        .position(CGPoint(x: .random(in: 0...Const.width),y: .random(in:0...Const.height)))
                }
            }.glow()
            DetailWordView(word: "반짝반짝", meaning: "[Ban-jjak-Ban-jjak]", explanation: "▶︎ \"반짝반짝\" means twinkling, sparking.", example: "▶︎ (ex) In Mauna Kea, you can see stars shining 반짝반짝 in the sky.").glow()
        }
        .onAppear {
            self.scale = 1.2
            show.toggle()
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

struct BanjjakbanjjakView_Previews: PreviewProvider {
    static var previews: some View {
        BanjjakbanjjakView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}

