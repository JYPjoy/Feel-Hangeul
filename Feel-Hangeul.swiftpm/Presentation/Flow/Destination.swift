//
//  File.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

enum Destination{
    case content
    case content2
    case jurukjuruk
    case chulleongchulleong
    case jjaengjjaeng
    case dugeundugeun
    
    @ViewBuilder
    var view: some View{
        switch self{
        case .content:
            ContentView()
        case .content2:
            ContentView2()
        case .jurukjuruk:
            JuRukJuRukView()
        case .chulleongchulleong:
            ChulLeongChulLeongView()
        case .jjaengjjaeng:
            JjaengJjaengView()
        case .dugeundugeun:
            DugeunDugeunView()
        }
    }
}

