//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

// TODO: iPHONE에서 밑에 잘려 보이는 문제 해결해야 함
struct ChulLeongChulLeongView: View {
    let letters = Array("출렁출렁출렁출렁출렁출렁출렁")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        //ScrollView(.vertical, showsIndicators : false)
        ZStack{
            Color(UIColor.black)
                .ignoresSafeArea()
            VStack(){
                VStack {
                    Spacer()
                    DetailWordView(word: "출렁출렁", meaning: "[Chul-Leong-Chul-Leong]", explanation: "주룩주룩 is a Korean mimetic word, which mimcs the sound of rain falling.", example: "ex> It has been raining 주룩주룩 all through the night.")
                    Spacer()
                    Text("Drag any character below.")
                        .padding()
                        .background(.black)
                        .font(.system(size: 35, weight: .regular))
                        .foregroundColor(.white)
                        .modifier(FittingFontSizeModifier())
                    Spacer()
                    HStack() {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 68, height: 68)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 48, weight: .heavy))
                                        .foregroundColor(enabled ? .c2 : .c3)
                                        .modifier(FittingFontSizeModifier())
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    
                    HStack() {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 68, height: 68)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 48, weight: .heavy))
                                        .foregroundColor(enabled ? .c2 : .c3)
                                        .modifier(FittingFontSizeModifier())
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    
                    HStack() {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 68, height: 68)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 48, weight: .heavy))
                                        .foregroundColor(enabled ? .c2 : .c3)
                                        .modifier(FittingFontSizeModifier())
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    HStack() {
                        ForEach(0..<letters.count) { num in
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 68, height: 68)
                                .overlay{
                                    Text(String(letters[num]))
                                        .padding(5)
                                        .font(.system(size: 48, weight: .heavy))
                                        .foregroundColor(enabled ? .c2 : .c3)
                                        .modifier(FittingFontSizeModifier())
                                }
                                .offset(dragAmount)
                                .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    Spacer()
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
            Spacer()
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
