//
//  File.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import Foundation
import SwiftUI

struct BeatingHeart: View {
    var body: some View {
        TimelineView(.cyclic(timeOffsets: [0.2, 0.2, 0.4])) { timeline in
            Heart(date: timeline.date)
        }
    }
}

struct Heart: View {
    @State private var phase = 0
    let scales: [CGFloat] = [1.0, 1.6, 2.0]
    
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
                }

        }
    }
    
    func advanceAnimationPhase() {
        phase = (phase + 1) % scales.count
    }
}


struct BeatingHeart_Previews: PreviewProvider {
    static var previews: some View {
        BeatingHeart()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
