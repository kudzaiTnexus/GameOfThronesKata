//
//  Localizable.swift
//  GameOfThronesKata
//
//  Created by Kudzai Mhou on 2019/02/06.
//  Copyright © 2019 Glucode. All rights reserved.
//

import Foundation
public protocol Localizable {
    static var defaultBundle: Bundle { get}
    func localized(in table: String, bundle : Bundle) -> String
}

extension String: Localizable {
    
    public static var defaultBundle: Bundle {
        get {
            return  Bundle.main
        }
    }
    
    public func localized(in table: String, bundle : Bundle = defaultBundle) -> String {
        return NSLocalizedString(self,
                                 tableName: table,
                                 bundle: bundle,
                                 value: "",
                                 comment: "")
    }
}
