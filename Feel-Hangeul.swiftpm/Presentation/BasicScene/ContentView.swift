//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/19.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
      if #available(iOS 16.0, *) {
          NavigationStack {
              OnboardingView()
          }
      } else {
          NavigationView {
              OnboardingView()
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
