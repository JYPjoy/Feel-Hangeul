//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import SwiftUI
import AVFAudio

struct MainView: View {
    @StateObject var coordinator = Coordinator(isRoot: true)
    
    var body: some View {
        ZStack{
            coordinator.navigationLinkSection()
            Image("bgImage")
                .resizable()
                .ignoresSafeArea(.all)
            ScrollView(.horizontal, showsIndicators : false){
                HStack{
                    ForEach(wordCard.indices, id: \.self){ index in
                        GeometryReader { geometry in
                            Rectangle()
                                .fill(wordCard[index].color)
                                .cornerRadius(22)
                                .overlay(
                                    Button(action: {
                                        TTSManager.shared.speak(TTSManager.getAVSpeechUtterance(string:wordCard[index].word))
                                        coordinator.push(destination: wordCard[index].destination)
                                        
                                        // TODO: 2초 후 종료해야 되지 않을까?
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//                                            TTSManager.stop()
//                                            coordinator.push(destination: wordCard[index].destination)
//                                        }
                                    }){
                                        VStack(spacing: 10){
                                            Text(wordCard[index].word)
                                                .font(.system(size:60).bold())
                                                .modifier(FittingFontSizeModifier())
                                            
                                            Text(wordCard[index].pronunciation)
                                                .font(.system(size: 25))
                                                .modifier(FittingFontSizeModifier())
                                            
                                        }
                                        .frame(width: (Const.width/3.5), height: (Const.width/3.5))
                                        .foregroundColor(.black)
                                    }
                                )
                                .offset(x: -10, y: geometry.size.height / 3)
                                .rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minX / -10)), axis: (x: 0.0, y: 0, z: 1.0))
                                .frame(width: (Const.width/3.5), height: (Const.width/3.5))
                                .shadow(color: wordCard[index].color.opacity(0.7), radius: 20,x: 15, y:15)
                        }
                        .frame(width: 250.0, height: Const.height)
                    }
                }
                .padding(.leading, 120)
                .padding(.trailing, 550)
            }
        }
        .onAppear{
//            // TODO: 강제 오디오 스타트
//            do{
//                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//                try AVAudioSession.sharedInstance().setActive(true)
//             }
//            catch
//            { print("Fail to enable session") }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad12.9")
    }
}
