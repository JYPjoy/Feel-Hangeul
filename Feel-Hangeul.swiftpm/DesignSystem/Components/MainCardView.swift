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

// TODO: destination 바꾸어 주어야 함
var wordCard = [
    wordCardView(word: "주룩주룩", pronunciation: "[Ju-Ruk-Ju-Ruk]",color: .red, destination: .jurukjuruk),
    wordCardView(word: "쨍쨍", pronunciation: "[Jjaeng-Jjaeng]", color: .orange, destination: .jjaengjjaeng),
    wordCardView(word: "출렁출렁", pronunciation: "[Chul-Leong-Chul-Leong]", color: .yellow, destination: .chulleongchulleong),
    wordCardView(word: "두근두근", pronunciation: "[Du-Geun-Du-Geun]", color: .blue, destination: .dugeundugeun),
    wordCardView(word: "반짝반짝",pronunciation: "[Ju-Ruk-Ju-Ruk]", color: .green, destination: .jurukjuruk),
    wordCardView(word: "생글생글", pronunciation: "[Ju-Ruk-Ju-Ruk]", color: .gray, destination: .jurukjuruk)
]
