//
//  File.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import Foundation
import SwiftUI

extension View {
    func glow() -> some View {
        modifier(Glow())
    }
}

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
