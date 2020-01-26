//
//  StringExtension.swift
//  WalmartLabsTest
//
//  Created by Bethany Wride on 1/22/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var attributedToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
