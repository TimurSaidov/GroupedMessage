//
//  DateHeaderLabel.swift
//  GroupedMessage
//
//  Created by Timur Saidov on 30/12/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {

    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let width = originalContentSize.width + 16
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        
        return CGSize(width: width, height: height)
    }

}
