//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import Foundation
import SwiftUI
import AVFoundation

// MARK: - main화면
struct DugeunDugeunView: View {
    @StateObject var coordinator = Coordinator()
    @State var scale : CGFloat = 0.5
    @State var audio : AVAudioPlayer!
    
    var body: some View {
        ZStack{
            coordinator.navigationLinkSection()
            Color(.black)
                .ignoresSafeArea(.all)
            VStack(){
                Spacer()
                HeartBeatView()
                TimelineView(.cyclic(timeOffsets: [0.2, 0.2, 0.4])) { timeline in
                  Heart(date: timeline.date)
                 }
                Spacer()
                DetailWordView(word: "두근두근", meaning: "[Du-Geun-Du-Geun]", explanation: "▶︎ \"두근두근\" is a onomatopoeic word, which mimics the sound of heart beating, \"pit a pat\" in English. \nPeople use this word when they feel thrilled or nervous. ", example: "▶︎ (ex) Everyday I go to Apple Developer Academy at Postech, my heart goes 두근두근, is filled with joy.") //My heart went pit a pat., blow one's mind
                Spacer()
            }
        }
        .onAppear {
            let song = NSDataAsset (name: "dugeun")
            self.audio = try! AVAudioPlayer(data: song!.data, fileTypeHint: "mp3")
            self.audio.play()
        
        }
        .onDisappear {
            self.audio.stop()
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              coordinator.push(destination: .main)
            } label: {
            }
          }
        }
    }
}


struct Heart: View {
    @State private var phase = 0

    let scales: [CGFloat] = [1.0, 2.0, 3.0]
    let date: Date
    
    var body: some View {
        HStack {
            Text("두근두근")
                .font(.largeTitle)
                .foregroundColor(.red)
                .scaleEffect(scales[phase])
            
                .animation(.spring(response: 0.10,
                                   dampingFraction: 0.24,
                                   blendDuration: 0.2),
                           value: phase)
                .onChange(of: date) { _ in
                    advanceAnimationPhase()
                }
                .onAppear {
                    advanceAnimationPhase()
                }
        }
    }
    
    func advanceAnimationPhase() {
        phase = (phase + 1) % scales.count
    }
}


struct  DugeunDugeunView_Previews: PreviewProvider {
    static var previews: some View {
        DugeunDugeunView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
