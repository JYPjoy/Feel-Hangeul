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
            
            VStack{
                Spacer()
                Spacer()
                Spacer()
                DetailWordView(word: "방울방울", meaning: "[Bang-Ul-Bang-Ul]", explanation: "▶︎ \"방울방울\" is a mimetic word, which indicates condensation of tiny droplets of liquid.", example: "▶︎ (ex) Sweat beads were dripping down 방울방울 from his forehead.")
                    .background(.black)
                
                Text("Touch any characters(방울) below. ")
                    .padding()
                    .background(.black)
                    .font(.system(size: 35, weight: .regular))
                    .foregroundColor(.white)
                    .modifier(FittingFontSizeModifier())
                
                ZStack{
                    ForEach (0..<100, id:\.self) { num in
                        Circle ()
                            .frame(width: .random(in: 1...100),
                                   height: CGFloat.random (in:20...100),
                                   alignment: .center)
                            .foregroundColor(bubble ? [.b1, .b2].randomElement(): .clear)
                            .animation(.easeOut(duration: 1), value: bubble)
                            .opacity(0.5)
                            .overlay(
                                Text(String("방울"))
                                    .font(.system(size: 15))
                                    .foregroundColor(.bubble)
                                    .onTapGesture {
                                        bubble.toggle()
                                    }
                            )
                        .onAppear { self.value = 0 }
                        .onTapGesture {
                            show.toggle()
                        }
                        .scaleEffect(self.scale * .random(in: 1...2.5))
                        .position(CGPoint(x: .random(in: 0...Const.width),y: .random(in:0...Const.height)))
                    }
                }
            }
            
     

        }
        .onAppear {
            self.scale = 1.1
            //show.toggle()
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

struct BangUlBangUlView_Previews: PreviewProvider {
    static var previews: some View {
        BangUlBangUlView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}
