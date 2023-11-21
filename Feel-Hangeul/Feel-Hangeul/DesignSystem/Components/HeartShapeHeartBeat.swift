//
//  File.swift
//
//
//  Created by Joy on 2023/04/17.
//

import SwiftUI

struct HeartShapeHeartBeat : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX/3, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX/3, y: (rect.midY+rect.maxY)/2))
        path.addLine(to: CGPoint(x: (rect.midX/3) + 20, y: (rect.midY/2)))
        path.addLine(to: CGPoint(x: (rect.midX/3) + 20, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX-25, y: rect.midY))
        path.addCurve(to: CGPoint(x: rect.midX-5, y: -10),
                      control1: CGPoint(x: rect.midX-72, y: 15),
                      control2: CGPoint(x: rect.midX-72, y: -45))
        
        path.addCurve(to: CGPoint(x: rect.midX+20, y: rect.midY),
                      control1: CGPoint(x: rect.midX+65, y: -45),
                      control2: CGPoint(x: rect.midX+65, y: 15))
    
        path.addLine(to: CGPoint(x: (rect.maxX+rect.midX)/2, y: rect.midY))
        path.addLine(to: CGPoint(x: (rect.maxX+rect.midX)/2, y: (rect.midY+rect.maxY)/2))
        path.addLine(to: CGPoint(x: ((rect.maxX+rect.midX)/2) + 20, y: (rect.midY/2)))
        path.addLine(to: CGPoint(x: ((rect.maxX+rect.midX)/2) + 20, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

//MARK:- Color Shift Text
struct HeartBeatView : View {
    @State var trimValue1 : CGFloat = 0
    @State var trimValue2 : CGFloat = 0
    @State var show = false
   // @State private var phase = 0

    //MARK:- Timer
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            HeartShapeHeartBeat()
                .stroke(lineWidth: 6) // changed from 8 to 6
                .foregroundColor(Color.black.opacity(0.1))
            
            HeartShapeHeartBeat()
                .trim(from: trimValue1, to: trimValue2)
                .stroke(lineWidth: 6) // changed from 8 to 6
                .foregroundColor(.red)
            
        }
        .frame(height: 120) // changed from 300 to 120
        //.animation(.spring())
        .animation(.spring(), value: show)
        .onReceive(timer, perform: { _ in
            show.toggle()
            if trimValue2 == 0 {
                trimValue2 = 1
            }
            else if trimValue1 == 0 {
                trimValue1 = 1
            } else {
                trimValue2 = 0
                trimValue1 = 0
            }
        })
    }
}

