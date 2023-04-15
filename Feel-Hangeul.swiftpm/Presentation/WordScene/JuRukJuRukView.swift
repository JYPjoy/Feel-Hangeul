//
//  SwiftUIView.swift
//  
//
//  Created by Joy on 2023/04/15.
//

import SwiftUI

struct JuRukJuRukView: View {

    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            TimelineView(.periodic(from: .now, by: 0.05)) { timeline in
                JuRukJuRukCanvas(date: timeline.date)
            }
            wordView(word: "주룩주룩", meaning: "[Ju-Ruk-Ju-Ruk]", explanation: "주룩주룩 is a Korean mimetic word, which mimcs the sound of rain falling.", example1: "- 애플 아카데미에서의 감정들", example2: "- It has been raining 주룩주룩 all thorugh the night.") //TODO: 해당 단어만 attributed text로 따로 굵기, 색상 다르게 하면 좋을 듯
        }
    }
    
    struct JuRukJuRukCanvas: View {
        @StateObject var core = MatrixCore(columnCount: 0)
        let date: Date

        var body: some View {
            Canvas(renderer: renderer) {
                // Column views tagged as Canvas symbols
                ForEach(core.columns) { column in
                    JuRukJuRukColumn(id: column.id, date: date)
                        .tag(column.id)
                }
            }
            .onChange(of: date) { (date: Date) in
                // Add columns progressively, every `addColumnRate` seconds, up to a maximum of `maxColumns`
                if core.columns.count < MatrixCore.maxColumns
                    && Date().timeIntervalSinceReferenceDate > core.lastAddDate.addingTimeInterval(MatrixCore.addColumnRate).timeIntervalSinceReferenceDate {
                    
                    core.addColumn()
                }
                
                // update columns data (e.g., position, depth, character count, etc)
                for idx in 0..<core.columns.count {
                    core.columns[idx].fallDown(date: date)
                }
            }
            .environmentObject(core)
        }
        
        func renderer(context: inout GraphicsContext, size: CGSize) {
            
            // Draw every column
            for column in core.columns.sorted(by: { $0.z > $1.z }) {
                context.drawLayer { context in
                    
                    if let resolved = context.resolveSymbol(id: column.id) {
                        
                        // Column location
                        let pt = CGPoint(x: column.origin.x * size.width,
                                         y: column.origin.y * size.height + column.offset)
                        
                        // Blur and scale effect, based on column's depth
                        context.addFilter(.blur(radius: column.z * 3))
                        context.scaleBy(x: 1 - column.z * 0.3, y: 1 - column.z * 0.3)
                        
                        // Draw column
                        context.draw(resolved, at: pt, anchor: .top)
                    }
                }
            }
        }
    }
}

struct JuRukJuRukColumn: View {
    @EnvironmentObject var core: MatrixCore
    
    let id: Int
    let date: Date
    
    var column: MatrixColumn { core.columns[id] }
    
    var body: some View {
        VStack(alignment: .center) {
            column.concatenatedTexts
                .font(.system(size: 30, weight: .light, design: .serif))
                .foregroundStyle(.linearGradient(colors: [.clear, .r1, .r2],
                                                 startPoint: .top, endPoint: .bottom))
                .multilineTextAlignment(.center)
        }
    }
}

class MatrixCore: ObservableObject {
    static var maxColumns = 50
    static var addColumnRate: TimeInterval = 0.2
    
    var lastAddDate: Date = Date(timeIntervalSinceReferenceDate: 0)
    
    var columns = [MatrixColumn]()
    
    init(columnCount: Int) {
        for idx in 0..<columnCount {
            columns.append(MatrixColumn(id: idx, origin: Self.randomOrigin, z: CGFloat.random(in: 0...1)))
        }
    }
    
    static var randomOrigin: UnitPoint {
        UnitPoint(x: .random(in: -0.25...1.25), y: .random(in: 0...0.25))
    }
    
    func addColumn() {
        columns.append(MatrixColumn(id: columns.count))
    }
}

struct MatrixColumn: Identifiable {
    static var matrixCharacters = "주룩주룩"
    let id: Int
    var origin: UnitPoint = MatrixCore.randomOrigin
    var z: CGFloat = CGFloat.random(in: 0...1)
    var offset: CGFloat = 0
    
    var texts = [String]()
    var removed = 0
    var phase = 0
    
    var lastUpdate: TimeInterval = Date().timeIntervalSinceReferenceDate
    
    static var randomMatrixCharacter: String {
        let idx = Int.random(in: 0..<matrixCharacters.count)
        let index = matrixCharacters.index(matrixCharacters.startIndex, offsetBy: idx)
        return String(matrixCharacters[index])
    }
    
    var stepSize: CGFloat { max(0, 1 / CGFloat(texts.count)) }
    
    mutating func addCharacter(_ count: Int = 1) {
        for _ in 0..<count {
            texts.append(Self.randomMatrixCharacter)
            //texts.append(Self.matrixCharacters)
        }
    }
    
    var concatenatedTexts: Text {
        var t = ""
        
        for k in 0..<texts.count {
            if k == 0 {
                t = t + texts[k]
            } else {
                t = t + "\n" + texts[k]
            }
        }
        
        return Text(t)
    }
    
    mutating func removeFromTop() {
        if removed < texts.count {
            texts[removed] = ""
            removed += 1
        }
    }
    
    mutating func fallDown(date: Date) {
        offset += 2 + (1 - z) * 5
        
        let ref = date.timeIntervalSinceReferenceDate
        
        if ref > lastUpdate + 0.1 {
            lastUpdate = ref
        } else {
            return
        }
        
        if phase < 11 {
            self.addCharacter()
        } else {
            self.removeFromTop()
        }
        
        phase += 1
        
        if removed >= texts.count { reset() }
    }
    
    mutating func reset() {
        offset = 0
        phase = 0
        removed = 0
        texts = []
        origin = MatrixCore.randomOrigin
        z = CGFloat.random(in: 0...1)
    }
}

struct JuRukJuRukView_Previews: PreviewProvider {
    static var previews: some View {
        JuRukJuRukView()
            .background(.black)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
