//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/18.
//

import SwiftUI

struct BangUlBangUlView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            Text("Hello, world")
                .foregroundColor(.white)
        }
    }
}

struct BangUlBangUlView_Previews: PreviewProvider {
    static var previews: some View {
        BangUlBangUlView()
    }
}
