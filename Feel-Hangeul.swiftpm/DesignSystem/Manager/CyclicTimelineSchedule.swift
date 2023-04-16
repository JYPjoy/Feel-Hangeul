//
//  File.swift
//  
//
//  Created by Joy on 2023/04/16.
//

import Foundation
import SwiftUI

struct CyclicTimelineSchedule: TimelineSchedule {
    let timeOffsets: [TimeInterval]
    
    func entries(from startDate: Date, mode: TimelineScheduleMode) -> Entries {
        Entries(last: startDate, offsets: timeOffsets)
    }
    
    struct Entries: Sequence, IteratorProtocol {
        var last: Date
        let offsets: [TimeInterval]
        
        var idx: Int = -1
        
        mutating func next() -> Date? {
            idx = (idx + 1) % offsets.count
            
            last = last.addingTimeInterval(offsets[idx])
            
            return last
        }
    }
}

extension TimelineSchedule where Self == CyclicTimelineSchedule {
    static func cyclic(timeOffsets: [TimeInterval]) -> CyclicTimelineSchedule {
            .init(timeOffsets: timeOffsets)
    }
}
