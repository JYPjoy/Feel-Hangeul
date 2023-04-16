//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/17.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var coordinator = Coordinator()

    
    var body: some View {
        VStack{
            coordinator.navigationLinkSection()
            
            Button{
                coordinator.push(destination: .main)
            } label: {
                Text("다음으로")
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
