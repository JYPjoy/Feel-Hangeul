//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct WordView: View {
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
                    Image(systemName: "headphones.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(explanation)
                    .font(.system(size: 25, weight: .regular))
                Text(example1)
                    .font(.system(size: 25, weight: .regular))
                Text(example2)
                    .font(.system(size: 25, weight: .regular))
            }
        }
        .foregroundColor(.white)
        
    }
}

struct wordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: "주룩주룩", meaning: "Rainy", explanation: "설명", example1: "사용 예시1", example2: "사용 예시2")
            .previewInterfaceOrientation(.landscapeLeft)
            .background(.black)
    }
}
