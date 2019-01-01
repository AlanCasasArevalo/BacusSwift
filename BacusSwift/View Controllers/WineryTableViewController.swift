//
//  WineryTableViewController.swift
//  BacusSwift
//
//  Created by Alan Casas on 01/01/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class WineryTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CONSTANTS.WINERY_TABLE_VIEW_CONSTANTS.WINERY_REUSE_CELL_IDENTIFIER)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.5, green: 0, blue: 0.13, alpha: 1)
    }
    
    let wineryModel: WineryModel?
    
    init(wineryModel: WineryModel, aTableStyle: UITableViewStyle) {
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
        
        let wineDetailVC = WineViewController(wineModel: (wineModelToDetail!))
        
        self.navigationController?.pushViewController(wineDetailVC, animated: true)
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
