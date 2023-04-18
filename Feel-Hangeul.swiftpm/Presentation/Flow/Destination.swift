//
//  File.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

enum Destination{
    case onboarding
    case main
    case jurukjuruk
    case chulleongchulleong
    case jjaengjjaeng
    case dugeundugeun
    case banjjakbanjjak
    case bangulbangul
    
    @ViewBuilder
    var view: some View{
        switch self{
        case .onboarding:
            OnboardingView()
        case .main:
            MainView()
        case .jurukjuruk:
            JuRukJuRukView()
        case .chulleongchulleong:
            ChulLeongChulLeongView()
        case .jjaengjjaeng:
            JjaengJjaengView()
        case .dugeundugeun:
            DugeunDugeunView()
        case .banjjakbanjjak:
            BanjjakbanjjakView()
        case .bangulbangul:
            BangUlBangUlView()
        }
    }
}

