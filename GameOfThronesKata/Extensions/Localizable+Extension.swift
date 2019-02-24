//
//  Localizable+Extension.swift
//  GameOfThronesKata
//
//  Created by Kudzai Mhou on 2019/02/06.
//  Copyright © 2019 Glucode. All rights reserved.
//

import Foundation

enum StringsFile: String {
    case gameOfThrownsKata = "gameOfThronesKataStrings"
}

extension Localizable {
    
    func localized(in file: StringsFile) -> String {
        return localized(in: file.rawValue,
                         bundle: Self.defaultBundle)
    }
    
}
