//
//  WineryTableViewController.swift
//  BacusSwift
//
//  Created by Alan Casas on 01/01/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol WineryTableViewControllerDelegate {
    func wineryTableViewController(wineryTableViewController: WineryTableViewController, didWineSelected: WineModel)
}

class WineryTableViewController: UITableViewController, WineryTableViewControllerDelegate {
    
    let standardDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WINERY_REUSE_CELL_IDENTIFIER)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.5, green: 0, blue: 0.13, alpha: 1)
    }
    
    let wineryModel: WineryModel?
    
    var delegate: WineryTableViewControllerDelegate?
    
    init(wineryModel: WineryModel, aTableStyle: UITableView.Style) {
        self.wineryModel = wineryModel
        super.init(style: aTableStyle)
        self.title = "Baccus"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.RED_WINE_SECTION:
            return self.wineryModel?.redWineCount() ?? 0
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WHITE_WINE_SECTION:
            return self.wineryModel?.whiteWineCount() ?? 0
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.OTHER_WINE_SECTION:
            return self.wineryModel?.otherWineCount() ?? 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let wineModelToCell: WineModel?
        
        var wineryCell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WINERY_REUSE_CELL_IDENTIFIER, for: indexPath)
        
        if wineryCell == nil {
            wineryCell = UITableViewCell(style: .subtitle, reuseIdentifier: CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WINERY_REUSE_CELL_IDENTIFIER)
        }
        
        switch indexPath.section {
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.RED_WINE_SECTION:
            wineModelToCell = wineryModel?.redWineAtIndex(indexPath: indexPath.row)
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WHITE_WINE_SECTION:
            wineModelToCell = wineryModel?.whiteWineAtIndex(indexPath: indexPath.row)
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.OTHER_WINE_SECTION:
            wineModelToCell = wineryModel?.otherWineAtIndex(indexPath: indexPath.row)
        default:
            wineModelToCell = wineryModel?.redWineAtIndex(indexPath: 0)
        }
        
        wineryCell.textLabel?.text = wineModelToCell?.wineName;
        wineryCell.detailTextLabel?.text = wineModelToCell?.wineCompanyName;
        
        return wineryCell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.RED_WINE_SECTION:
            return "Red wines"
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WHITE_WINE_SECTION:
            return "White wines"
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.OTHER_WINE_SECTION:
            return "Other wines"
        default:
            return "Red wines"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wineModelToDetail: WineModel?
        
        switch indexPath.section {
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.RED_WINE_SECTION:
            wineModelToDetail = wineryModel?.redWineAtIndex(indexPath: indexPath.row)
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WHITE_WINE_SECTION:
            wineModelToDetail = wineryModel?.whiteWineAtIndex(indexPath: indexPath.row)
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.OTHER_WINE_SECTION:
            wineModelToDetail = wineryModel?.otherWineAtIndex(indexPath: indexPath.row)
        default:
            wineModelToDetail = wineryModel?.redWineAtIndex(indexPath: 0)
        }

        self.delegate?.wineryTableViewController(wineryTableViewController: self, didWineSelected: wineModelToDetail!)
        
        let wineDictionary = Dictionary<String, WineModel>(dictionaryLiteral: (CONSTANTS.WINERY_NOTIFICATION.WINE_MODEL_KEY, wineModelToDetail!))
        let notification = Notification(name: Notification.Name(rawValue: CONSTANTS.WINERY_NOTIFICATION.DID_SELECT_WINE_NOTIFICATION_NAME), object: self, userInfo: wineDictionary)
        NotificationCenter.default.post(notification)
        
        self.saveLastSelectedWineAtIndexSection(section: UInt(indexPath.section), row: UInt(indexPath.row))
        
    }
    
    func wineryTableViewController(wineryTableViewController: WineryTableViewController, didWineSelected: WineModel) {
        let wineVC = WineViewController(wineModel: didWineSelected)
        self.navigationController?.pushViewController(wineVC, animated: true)
    }
    
    func setUserDefaults() -> Dictionary<String, Int> {
        let defaultsWineCoordinates = [CONSTANTS.WINE_USER_DEFAULTS.SECTION_KEY: CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.RED_WINE_SECTION, CONSTANTS.WINE_USER_DEFAULTS.ROW_KEY: 0]
        
        standardDefaults.set(defaultsWineCoordinates, forKey: CONSTANTS.WINE_USER_DEFAULTS.LAST_WINE_KEY)
        standardDefaults.synchronize()
        
        return defaultsWineCoordinates
    }

    func saveLastSelectedWineAtIndexSection (section: UInt, row: UInt){
        let coords = [CONSTANTS.WINE_USER_DEFAULTS.SECTION_KEY: section, CONSTANTS.WINE_USER_DEFAULTS.ROW_KEY: row]
        standardDefaults.set(coords, forKey: CONSTANTS.WINE_USER_DEFAULTS.LAST_WINE_KEY)
        standardDefaults.synchronize()
    }
    
    func lastSelectedWine() -> WineModel {
        var indexPath = IndexPath(row: 0, section: 0)
        
        var coords = standardDefaults.object(forKey: CONSTANTS.WINE_USER_DEFAULTS.LAST_WINE_KEY) as! Dictionary<String, Int>
        
        if coords == nil {
            coords = self.setUserDefaults()
        }else {
            let indexPathRow = coords[CONSTANTS.WINE_USER_DEFAULTS.ROW_KEY]
            let indexPathSection = coords[CONSTANTS.WINE_USER_DEFAULTS.SECTION_KEY]

            indexPath = IndexPath(row: indexPathRow!, section: indexPathSection!)
        }
        return self.wineForIndexPath(indexPath: indexPath)
    }
    
    func wineForIndexPath(indexPath: IndexPath) -> WineModel {
        
        let indexWineSelected: WineModel
        
        switch indexPath.section {
        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.RED_WINE_SECTION:
            indexWineSelected = (wineryModel?.redWineAtIndex(indexPath: indexPath.row))!

        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WHITE_WINE_SECTION:
            indexWineSelected = (wineryModel?.whiteWineAtIndex(indexPath: indexPath.row))!

        case CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.OTHER_WINE_SECTION:
            indexWineSelected = (wineryModel?.otherWineAtIndex(indexPath: indexPath.row))!

        default:
            indexWineSelected = (wineryModel?.redWineAtIndex(indexPath: indexPath.row))!
        }
        
        return indexWineSelected
    }
    
}
