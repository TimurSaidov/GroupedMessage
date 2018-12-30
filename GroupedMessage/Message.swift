//
//  Message.swift
//  GroupedMessage
//
//  Created by Timur Saidov on 30/12/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import Foundation

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
