//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

//import SwiftUI
//
//struct BeatingHeart: View {
//    var body: some View {
//        TimelineView(.cyclic(timeOffsets: [0.2, 0.2, 0.4])) { timeline in
//            Heart(date: timeline.date)
//        }
//    }
//}
//
//struct DugeundugeunView: View {
//    @State private var phase = 0
//    @State var scale : CGFloat = 0.5
//    let scales: [CGFloat] = [1.0, 1.6, 2.0]
//    
//    let date: Date
//    
//    var body: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            ForEach (1...100, id:\.self) { _ in
//               // Circle ()
//                Image(systemName: "heart.fill")
//                    .foregroundColor(Color (red: .random(in: 0.3...1), green: .random(in: 0.3...1), blue: .random(in: 0.3...1)))
//                    .opacity(0.3)
//                    .scaleEffect(self.scale * .random(in: 1...3))
//                    .frame(width: .random(in: 50...100),
//                           height: CGFloat.random (in:50...100),
//                           alignment: .center)
//                    .position(CGPoint(x: .random(in: 0...Const.width),y: .random (in:0...Const.height)))
//                
//                HStack {
//                    Text("두근")
//                        .font(.largeTitle)
//                        .foregroundColor(.red)
//                        .scaleEffect(scales[phase])
//                        .animation(.spring(response: 0.10,
//                                           dampingFraction: 0.24,
//                                           blendDuration: 0.2),
//                                   value: phase)
//                        .onChange(of: date) { _ in
//                            advanceAnimationPhase()
//                        }
//                        .onAppear {
//                            advanceAnimationPhase()
//                        }
//
//                }
//
//            }
//        }
//
//    }
//    func advanceAnimationPhase() {
//        phase = (phase + 1) % scales.count
//    }
//}

//struct DugeundugeunView_Previews: PreviewProvider {
//    static var previews: some View {
//        DugeundugeunView(, date: <#Date#>)
//    }
//}
