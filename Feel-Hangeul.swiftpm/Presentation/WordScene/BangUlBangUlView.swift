//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/18.
//

import SwiftUI

struct BangUlBangUlView: View {
    @State private var bubble = false
    @StateObject var coordinator = Coordinator()
    @State var scale : CGFloat = 0.5
    @State private var value = 1.0
    @State var show = false
    
    
    var body: some View {
        ZStack{
            coordinator.navigationLinkSection()
            Color.black
                .ignoresSafeArea()

//            Circle()
//                .frame(width: 200, height:200)
//                .opacity(0.5)
//                .foregroundColor(bubble ? .yellow : .clear)
//                .animation(.easeOut(duration: 1), value: bubble)
//                .overlay{
//                    Text("방울")
//                        .font(.system(size: 100))
//                        .foregaroundColor(.white)
//
//                }
//                .onTapGesture {
//                    bubble.toggle()
//                }
            
            
            ZStack{
                ForEach (0..<150, id:\.self) { num in
                    Circle ()
                        .overlay(
                            Text(String("방울"))
                                .font(.system(size: 18))
                                .foregroundColor([.b1, .b2].randomElement())
                        )
//                        .opacity(value)
//                        //.animation(Animation.linear(duration:1.2).repeatForever(autoreverses: true), value: show)
//                        .onAppear { self.value = 0 }
//                        .scaleEffect(self.scale * .random(in: 1...2.5))
//                        .frame(width: .random(in: 1...100),
//                               height: CGFloat.random (in:20...100),
//                               alignment: .center)
//                        .position(CGPoint(x: .random(in: 0...Const.width),y: .random(in:0...Const.height)))
                }
            }
            DetailWordView(word: "방울방울", meaning: "[Bang-Ul-Bang-Ul]", explanation: "▶︎ (ex) \"반짝반짝\" means twinkling, sparking", example: "▶︎ In Mauna Kea, you can see stars shining 반짝반짝 in the sky.")
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

//TODO: 할 일
/*
- 색깔 바뀔 때 애니메이션 효과 추가하기 ☑️
- 방울방울 글씨를 여기저기에 뿌리기 (Bubble처럼)
 클릭 시 커짐 
- TapGesture 시 bubble이 나타나는 효과 추가하기☑️
 */


struct BangUlBangUlView_Previews: PreviewProvider {
    static var previews: some View {
        BangUlBangUlView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}
