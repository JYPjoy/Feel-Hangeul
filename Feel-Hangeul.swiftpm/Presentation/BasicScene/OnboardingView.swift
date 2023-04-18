//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/17.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        ZStack{
            coordinator.navigationLinkSection()
            Image("bgImage")
                .resizable()
                .ignoresSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 30)
                .padding(.horizontal, 90)
                .padding(.vertical, 60)
                .foregroundColor(.white)
                .opacity(0.8)
            
            VStack(spacing: 30){
                Image("joy") //TODO: 로고가 와야 할 거 같음
                    .resizable()
                    .frame(width: 160, height:160)
                
                Text("Feel Hangeul")
                    .font(.system(size: 40, weight: .bold))
                
                Text("설명설명")
                    .font(.system(size: 20, weight: .regular))
                
                HStack{
                    Image("joy")
                        .resizable()
                        .frame(width: 100, height:100)
                    
                    Text("sdddddddddddddddddddssssssssssss")
                        .font(.system(size: 15, weight: .regular))
                }
                
                Button{
                    coordinator.push(destination: .main)
                }label: {
                    Text("START")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 55)
                        .background(
                            Color.r3.cornerRadius(10)
                        )
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}
