//
//  ViewController.swift
//  GameOfThronesKata
//
//  Created by Wilmar van Heerden on 2017/08/18.
//  Copyright © 2017 Glucode. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UITableViewController {
    
    private let viewModel = GameOfThronesKataViewModel()
    var characterDetail: GRKCharacterDetailResponse?
    private let numberOfSections: Int = 2
    private let estimatedCustomCellHeight: CGFloat = 142
    private let heightForSectionHeader: CGFloat = 78
    
    let sectionTitles: [String] = ["firstSection.title".localized(in: .gameOfThrownsKata),
                                   "secondSection.title".localized(in: .gameOfThrownsKata)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleColorAttribute = [NSForegroundColorAttributeName: UIColor.discoveryThemeBlack()]
        self.navigationController?.navigationBar.titleTextAttributes = titleColorAttribute
        self.title = characterDetail?.name
        setUpTable()
    }
    
    
    // MARK: - Setup table and custom cells
    
    
    func setUpTable(){
        tableView.sectionHeaderHeight = 62
        tableView.tableFooterView = UIView()
        registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        let customCell = UINib(nibName: BaseTableViewCell.nibName, bundle: nil)
        let sectionHeaderCell =  UINib(nibName: SectionHeaderTableViewCell.nibName, bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: BaseTableViewCell.reuseIdentifier)
        self.tableView.register(sectionHeaderCell, forCellReuseIdentifier: SectionHeaderTableViewCell.reuseIdentifier)
    }
    
    
    // MARK: - Configure table section info
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return heightForSectionHeader
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionHeaderTableViewCell.reuseIdentifier) as? SectionHeaderTableViewCell else {
            return nil
        }
        
        if ( sectionTitles.isEmpty ) { return nil }
        
        cell.sectionHeaderTitle.text = sectionTitles[section]
        cell.sectionHeaderTitle.textColor  = UIColor.discoveryThemeGrey()
        cell.backgroundColor = UIColor.discoveryOffWhite()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = UIColor.discoveryOffWhite()
            headerView.textLabel?.textColor = UIColor.discoveryThemeGrey()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ( section == 0 ){ return 1 }
        
        guard let characterData = characterDetail,
            let siblings = characterData.siblings as? [GRKSiblings] else {
                return 0
        }
        
        return siblings.count
    }
    
    
    // MARK: - Configure table custom cell info
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimatedCustomCellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseIdentifier) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        
        if  ( indexPath.section == 0 ) {
            if let characterInfo = characterDetail {
                return setUpFirstCell(data: characterInfo, cell: cell)
            }
        }
        
        let siblingData = viewModel.fileterData(responseData: characterDetail)
        
        return setUpSecondCell(cellData: siblingData[indexPath.row], cell: cell)
    }
    
}


