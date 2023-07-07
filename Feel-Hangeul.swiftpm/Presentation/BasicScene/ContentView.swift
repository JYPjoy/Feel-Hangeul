//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/19.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  var body: some View {
      if #available(iOS 16.0, *) {
          NavigationStack {
              MainView()
          }
      } else {
          NavigationView {
              MainView()
          }
          .navigationViewStyle(.stack)
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
          .previewInterfaceOrientation(.landscapeLeft)
        
  }
}
