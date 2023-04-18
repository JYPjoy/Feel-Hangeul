//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/18.
// TODO: 반짝, scaleEffect, 글자들로 별 모양 만들어도 괜찮을 듯

import SwiftUI

struct BanjjakbanjjakView: View {
    @State var scale : CGFloat = 0.5
    @State var opacity: Double = 1
    //TODO:  반짝이고, scaleEffect 들어가면 좋을듯
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            
            ForEach (1...50, id:\.self) { _ in
                //Text("반")
                Circle()
                    .foregroundColor(.clear)
                    .overlay{
                        Text("반")
                            .font(.system(size: 10))
                            //.glow()
                            //.foregroundColor([.c2, .c1].randomElement())
                            .foregroundColor([.yellow, .white].randomElement())
                            
                    }
                    .scaleEffect(self.scale * .random(in: 1...3))
                    .frame(width: .random(in: 1...100),
                           height: CGFloat.random (in:20...100),
                           alignment: .center)
                    .position(CGPoint(x: .random(in: 0...Const.width),y: .random (in:0...Const.height)))
            }
            
//            ForEach (1...50, id:\.self) { _ in
//                Text("짝")
//                    .foregroundColor(.yellow)
//                    .font(.system(size: 30))
//                    .twinkle().twinkle()
//                    .scaleEffect(self.scale * .random(in: 1...3))
//                    .frame(width: .random(in: 1...100),
//                           height: CGFloat.random (in:20...100),
//                           alignment: .center)
//                    .position(CGPoint(x: .random(in: 0...Const.width),y: .random (in:0...Const.height)))
//            }
        }
        .onAppear {
            self.scale = 1.5
            withAnimation(Animation.linear(duration: 1).repeatForever()){
                self.opacity = 0.2
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
