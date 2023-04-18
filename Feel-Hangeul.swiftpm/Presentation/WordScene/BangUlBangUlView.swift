//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/18.
//

import SwiftUI

struct BangUlBangUlView: View {
    @State private var bubble = false
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()

            Circle()
                .frame(width: 200, height:200)
                .opacity(0.5)
                .foregroundColor(bubble ? .yellow : .clear)
                .animation(.easeOut(duration: 1), value: bubble)
                .overlay{
                    Text("방울")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                    
                }
                .onTapGesture {
                    bubble.toggle()
                }
        }
    }
}

//TODO: 할 일
/*
- 색깔 바뀔 때 애니메이션 효과 추가하기 ☑️
- 방울방울 글씨를 여기저기에 뿌리기 (Bubble처럼)
- TapGesture 시 bubble이 나타나는 효과 추가하기☑️
 */


struct BangUlBangUlView_Previews: PreviewProvider {
    static var previews: some View {
        BangUlBangUlView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}
