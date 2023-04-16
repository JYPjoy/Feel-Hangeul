//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import SwiftUI

struct MainView: View {
    @StateObject var coordinator = Coordinator()
    var body: some View {
        VStack {
            coordinator.navigationLinkSection()
            
            Button {
                coordinator.push(destination: .jurukjuruk)
            } label: {
                Text("주룩주룩")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
            }
            
            
            Button {
                coordinator.push(destination: .chulleongchulleong)
            } label: {
                Text("출렁출렁")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
            }
            
            Button {
                coordinator.push(destination: .jjaengjjaeng)
            } label: {
                Text("쨍쨍")
                    .foregroundColor(.green)
                    .padding()
                    .background(.red)
            }
            
            
            Button {
               // coordinator.push(destination: .dugeundugeun)
            } label: {
                Text("두근두근")
                    .foregroundColor(.green)
                    .padding()
                    .background(.red)
            }
           
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
