//
//  Created by Joy on 2023/04/17.
//

import Foundation
import SwiftUI

struct wordCardView: Identifiable {
    var id = UUID()
    var word: String
    var pronunciation: String
    var color: Color
    var destination: Destination
}

var wordCard = [
    wordCardView(word: "두근두근", pronunciation: "[Du-Geun-Du-Geun]", color: .red, destination: .dugeundugeun),
    wordCardView(word: "쨍쨍", pronunciation: "[Jjaeng-Jjaeng]", color: .orange, destination: .jjaengjjaeng),
    wordCardView(word: "반짝반짝",pronunciation: "[Ban-jjak-Ban-jjak]", color: .yellow, destination: .banjjakbanjjak),
    wordCardView(word: "주룩주룩", pronunciation: "[Ju-Ruk-Ju-Ruk]",color: .green, destination: .jurukjuruk),
    wordCardView(word: "출렁출렁", pronunciation: "[Chul-Leong-Chul-Leong]", color: .blue, destination: .chulleongchulleong),
   wordCardView(word: "방울방울", pronunciation: "[Bang-Ul-Bang-Ul]", color: .purple, destination: .bangulbangul) //MARK: 빙글빙글/생글생글로 바뀔 수도 있다는 거 염두해 두기
]
