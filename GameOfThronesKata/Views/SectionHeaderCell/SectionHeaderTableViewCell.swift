//
//  SectionHeaderTableViewCell.swift
//  GameOfThronesKata
//
//  Created by Kudzai Mhou on 2019/02/06.
//  Copyright © 2019 Glucode. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionHeaderTitle: UILabel!
    
    static let reuseIdentifier = String(describing: SectionHeaderTableViewCell.self)
    static let nibName = String(describing: SectionHeaderTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setUpView(){
        sectionHeaderTitle.textColor  = UIColor.discoveryThemeGrey()
    }
    
}
