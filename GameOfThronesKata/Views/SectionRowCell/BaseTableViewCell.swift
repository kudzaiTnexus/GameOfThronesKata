//
//  BaseTableViewCell.swift
//  GameOfThronesKata
//
//  Created by Kudzai Mhou on 2019/02/06.
//  Copyright © 2019 Glucode. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstTitleName: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondTitleName: UILabel!
    
    static let reuseIdentifier = String(describing: BaseTableViewCell.self)
    static let nibName = String(describing: BaseTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView(){
        firstTitleLabel.textColor  = UIColor.discoveryThemeGrey()
        secondTitleLabel.textColor = UIColor.discoveryThemeGrey()
        
        firstTitleName.textColor = UIColor.discoveryThemeBlack()
        secondTitleName.textColor = UIColor.discoveryThemeBlack()
    }
    
}
