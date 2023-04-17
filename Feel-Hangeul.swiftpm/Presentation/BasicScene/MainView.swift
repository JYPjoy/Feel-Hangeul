//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import SwiftUI

struct MainView: View {
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
//        VStack {
//            coordinator.navigationLinkSection()
//
//            Button {
//                coordinator.push(destination: .jurukjuruk)
//            } label: {
//                Text("주룩주룩")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(.black)
//            }
//
//
//            Button {
//                coordinator.push(destination: .chulleongchulleong)
//            } label: {
//                Text("출렁출렁")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(.blue)
//            }
//
//            Button {
//                coordinator.push(destination: .jjaengjjaeng)
//            } label: {
//                Text("쨍쨍")
//                    .foregroundColor(.green)
//                    .padding()
//                    .background(.red)
//            }
//
//
//            Button {
//                coordinator.push(destination: .dugeundugeun)
//            } label: {
//                Text("두근두근")
//                    .foregroundColor(.green)
//                    .padding()
//                    .background(.red)
//            }
//
//
//        }
        
        
        ScrollView(.horizontal, showsIndicators : false){
            HStack{
                ForEach(WordCard.indices, id: \.self){ index in
                    GeometryReader { geomitry in
                        Rectangle()
                            .fill(WordCardColor[WordCard[index]]!)
                            .cornerRadius(22)
                            .overlay(
                                Button(action: {
                                    //self.isNavigationActive = true
                                    //openViewName = FeelingCard[index]
                                    TTSManager.shared.speak(TTSManager.getAVSpeechUtterance(string:WordCard[index]))
                                }){
                                    VStack(){
                                        Spacer().frame(height:50)
                                        HStack {
                                            Spacer().frame(width:50)
                                            Text(WordCard[index])
                                                .font(.system(size:100))
                                                .modifier(FittingFontSizeModifier())
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .frame(width: (Const.width/3)*1.5, height: (Const.width/3))
                                    .foregroundColor(.white)
                                }
                            )
                            .offset(x: 20, y: geomitry.size.height / 3)
                            .rotation3DEffect(.degrees(Double(geomitry.frame(in: .global).minX / -8)), axis: (x: 0.0, y: 0.0, z: 3.0))
//
                            .frame(width: (Const.width/3)*1.5, height: (Const.width/3))
                            .shadow(color:
                                        WordCardColor[WordCard[index]]!.opacity(0.7), radius: 20,x: 15,y:15)
                    }
                    .frame(width: 250.0, height: UIScreen.main.bounds.height)
                }
            }
            .padding(.leading, 120)
            .padding(.trailing, 550)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
            //.previewDevice("iPad12.9")
    }
}
