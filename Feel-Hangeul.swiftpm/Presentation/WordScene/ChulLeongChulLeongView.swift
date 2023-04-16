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
                VStack {
                    HStack(spacing: 10) {
                        ForEach(0..<letters.count) { num in
                            Circle()
                            .foregroundColor(enabled ? .c2 : .c3)
                            //                                .fill(enabled ? LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            
                            
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 50, weight: .heavy, design: .serif))
                                }
                            
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(enabled ? .c2 : .c3)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 50, weight: .heavy, design: .serif))
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(enabled ? .c2 : .c3)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 50, weight: .heavy, design: .serif))
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(enabled ? .c2 : .c3)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 50, weight: .heavy, design: .serif))
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(enabled ? .c2 : .c3)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 50, weight: .heavy, design: .serif))
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    HStack(spacing: 10) {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(enabled ? .c2 : .c3)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 50, weight: .heavy, design: .serif))
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
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
            Text("Drag any circles")

                .padding()
                .background(.black)
                .font(.system(size: 50, weight: .regular))
                .foregroundColor(.white)
            
//            wordView(word: "출렁출렁", meaning: "[Chul-Leong-Chul-Leong]", explanation: "주룩주룩 is a Korean mimetic word, which mimcs the sound of rain falling.", example1: "ex> It has been raining 주룩주룩 all through the night.", example2: "ex> It has been raining 주룩주룩 all through the night.") //TODO: 해당 단어만 attributed text로 따로 굵기, 색상 다르게 하면 좋을 듯
//                .background(.black)
                
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
