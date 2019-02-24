//
//  GameOfThronesKataViewModel.swift
//  GameOfThronesKata
//
//  Created by Kudzai Mhou on 2019/02/06.
//  Copyright © 2019 Glucode. All rights reserved.
//

import Foundation
import UIKit

class GameOfThronesKataViewModel {
    
    func fileterData(responseData: GRKCharacterDetailResponse?) -> [GRKSiblings] {
        guard let data = responseData else {
            return []
        }
        
        return data.siblings.compactMap{ $0 as? GRKSiblings }
    }

}
