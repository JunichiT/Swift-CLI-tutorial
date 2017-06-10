//
//  String+Extension.swift
//  Panagram
//
//  Created by junichi-tsurukawa on 2017/06/10.
//  Copyright © 2017年 junichit. All rights reserved.
//

extension String {
    func isAnagram(of comparisonString: String) -> Bool {
        let lowerForSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerForComparison = comparisonString.lowercased().replacingOccurrences(of: " ", with: "")
        return lowerForSelf.characters.sorted() == lowerForComparison.characters.sorted()
    }

    func isPalindrome() -> Bool {
        let originalString = self.lowercased().replacingOccurrences(of: " ", with: "")
        let reversedString = String(originalString.characters.reversed())
        return originalString == reversedString
    }
}
