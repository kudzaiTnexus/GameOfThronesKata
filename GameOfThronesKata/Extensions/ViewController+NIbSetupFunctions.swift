//
//  ViewController+NIbSetupFunctions.swift
//  GameOfThronesKata
//
//  Created by Kudzai Mhou on 2019/02/06.
//  Copyright © 2019 Glucode. All rights reserved.
//

import Foundation

extension ViewController
{
    func setUpFirstCell(data: GRKCharacterDetailResponse, cell: BaseTableViewCell) -> BaseTableViewCell
    {
        cell.firstTitleLabel.text = "Title"
        cell.firstTitleName.text = data.title
        cell.secondTitleLabel.text = "Status"
        cell.secondTitleName.text = data.status
        return cell
    }
    
    func setUpSecondCell(cellData: GRKSiblings, cell: BaseTableViewCell) -> BaseTableViewCell
    {
        cell.firstTitleLabel.text = "Name"
        cell.firstTitleName.text = cellData.name
        cell.secondTitleLabel.text = "Date of birth"
        cell.secondTitleName.text = cellData.dateOfBirth
        return cell
    }
}
