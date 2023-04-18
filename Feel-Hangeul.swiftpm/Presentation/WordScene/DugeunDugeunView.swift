//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import Foundation
import SwiftUI

struct DugeunDugeunView: View {
    @State var scale : CGFloat = 0.5
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea(.all)
            VStack{
                HeartBeatView()
                TimelineView(.cyclic(timeOffsets: [0.2, 0.2, 0.4])) { timeline in
                  Heart(date: timeline.date)
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
            Text("두근")
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
                    //TODO: 음원 추가
                    //SoundManager.shared.playSound(formusicName: "heartbeat")
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
