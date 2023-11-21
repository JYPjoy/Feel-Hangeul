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
    case jjaengjjaeng
    case banjjakbanjjak
    case dugeundugeun
    case chulleongchulleong
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
        case .jjaengjjaeng:
            JjaengJjaengView()
        case .banjjakbanjjak:
            BanjjakbanjjakView()
        case .dugeundugeun:
            DugeunDugeunView()
        case .chulleongchulleong:
            ChulLeongChulLeongView()
        case .bangulbangul:
            BangUlBangUlView()
        }
    }
}


