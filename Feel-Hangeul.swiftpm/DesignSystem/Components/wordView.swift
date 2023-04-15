//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct wordView: View {
    let word: String
    let meaning: String
    let explanation: String
    let example1: String
    let example2: String
    
    var body: some View {
        VStack(spacing: 10){
            Text(word)
                .font(.system(size: 100, weight: .bold))
                .padding()
                .shadow(color: .r3, radius: 5)
            
            HStack(spacing: 10) {
                Text(meaning)
                    .font(.system(size: 30, weight: .regular))
                
                Button {
                    TTSManager.shared.speak(TTSManager.getAVSpeechUtterance(string:word))
                } label: {
                    Text("TTS 버튼")
                        .font(.system(size: 30, weight: .regular))
                }
            }
            
            VStack(alignment: .leading) {
                Text(explanation)
                    .font(.system(size: 20, weight: .regular))
                Text(example1)
                    .font(.system(size: 20, weight: .regular))
                Text(example2)
                    .font(.system(size: 20, weight: .regular))
            }
        }
        .foregroundColor(.white)
        
    }
}

struct wordView_Previews: PreviewProvider {
    static var previews: some View {
        wordView(word: "주룩주룩", meaning: "Rainy", explanation: "설명", example1: "사용 예시1", example2: "사용 예시2")
            .previewInterfaceOrientation(.landscapeLeft)
            .background(.black)
    }
}
