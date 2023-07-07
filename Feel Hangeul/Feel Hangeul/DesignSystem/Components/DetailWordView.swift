//
//  DetailWordView.swift
//  Feel Hangeul
//
//  Created by Joy on 2023/07/08.
//

import SwiftUI

struct DetailWordView: View {
    let word: String
    let meaning: String
    let explanation: String
    let example: String
    
    var body: some View {
        VStack(spacing: 10){
            Text(word)
                .font(.system(size: 80, weight: .bold))
                .modifier(FittingFontSizeModifier())
                .padding()
                .shadow(color: .r3, radius: 5)
            
            HStack(spacing: 10) {
                Text(meaning)
                    .font(.system(size: 30, weight: .regular))
                    .modifier(FittingFontSizeModifier())
                
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
                    .modifier(FittingFontSizeModifier())
                Text(example)
                    .font(.system(size: 25, weight: .regular))
                    .modifier(FittingFontSizeModifier())
            }
        }
        .foregroundColor(.white)
        
    }
}

struct wordView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWordView(word: "주룩주룩", meaning: "Rainy", explanation: "설명", example: "사용 예시1")
            .previewInterfaceOrientation(.landscapeLeft)
            .background(.black)
    }
}
