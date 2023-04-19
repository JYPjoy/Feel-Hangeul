//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/17.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var coordinator = Coordinator(isRoot: true)
    
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
            
            VStack(spacing: 23){
    
                Image("logo") //TODO: 로고가 와야 할 거 같음
                    .resizable()
                    .frame(width: 150, height:150)
                Text("Feel Hangeul")
                    .font(.system(size: 50, weight: .bold))
                
                VStack(spacing: 5) {
                    Text("This App is about Onomatopoeia, Mimetic words of Hanguel.")
                        .font(.system(size: 25, weight: .regular))
                        .modifier(FittingFontSizeModifier())

                    Text("I hope everybody \"Feel Hanguel\" through this app.")
                        .font(.system(size: 25, weight: .regular))
                        .modifier(FittingFontSizeModifier())
                    
                    Text("All you need is iPad!")
                        .font(.system(size: 25, weight: .regular))
                        .modifier(FittingFontSizeModifier())
                    
                    Text("Are you ready to start? Then, Let’s get started!")
                        .font(.system(size: 25, weight: .regular))
                        .modifier(FittingFontSizeModifier())
      
                }

                HStack{
                    Image("smartphone")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("Please Preview this on iPad device 12.9 in LandscapeLeft orientation.\n THANK YOU👍")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.red)
                        .modifier(FittingFontSizeModifier())
         
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
//
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}
