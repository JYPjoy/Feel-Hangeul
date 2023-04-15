//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct ChulLeongChulLeongView: View {
    let letters = Array("출렁출렁출렁출렁출렁출렁")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
 
        ZStack{
            Color(UIColor.black)
                .ignoresSafeArea()
            VStack(spacing: 15){
                // TODO: 간격 조절 필요
                Text("Drag any characters in below.")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(.white)
                HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.system(size: 50, weight: .light, design: .serif))
                            .foregroundColor(enabled ? .c2: .c3)
                            
                            .offset(dragAmount)
                            .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                    }
                }
                .padding()
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }

                        .onEnded { _ in
                            withAnimation{
                                dragAmount = .zero
                                enabled.toggle()
                            }
                        }
                )
            }
            
//            wordView(word: "출렁출렁", meaning: "[Chul-Leong-Chul-Leong]", explanation: "주룩주룩 is a Korean mimetic word, which mimcs the sound of rain falling.", example1: "ex> It has been raining 주룩주룩 all through the night.", example2: "ex> It has been raining 주룩주룩 all through the night.") //TODO: 해당 단어만 attributed text로 따로 굵기, 색상 다르게 하면 좋을 듯
        }

    }
}

struct ChulLeongChulLeongView_Previews: PreviewProvider {
    static var previews: some View {
        ChulLeongChulLeongView()
            .background(.black)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
