//
//  File.swift
//
//
//  Created by Joy on 2023/04/16.
//

import Foundation
import SwiftUI

/// 반짝이게 해줌
struct Glow: ViewModifier{
    func body(content: Content) -> some View {
        ZStack{
            content
                .blur(radius: 20)
                //TODO: 애니메이션 넣어도 됨
            content
        }
    }
}

/// 반짝반짝에 사용됨
struct Twinkle: ViewModifier{
    @State private var shine = false
    func body(content: Content) -> some View {
        ZStack{
            content
                .blur(radius: shine ? 50 : 25)
                .scaleEffect(self.shine ? 1.2 : 0.7)
                .animation(.easeOut(duration: 0.5).repeatForever(), value: shine)
                
                .onAppear{
                    shine.toggle()
                }
            content
        }
    }
}

/// 해당 View에 맞게 text 크기 조절
struct FittingFontSizeModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 50))
      .minimumScaleFactor(0.001)
  }
}


extension View {
    func glow() -> some View {
        modifier(Glow())
    }
    
    func twinkle() -> some View {
        modifier(Twinkle())
    }
}

