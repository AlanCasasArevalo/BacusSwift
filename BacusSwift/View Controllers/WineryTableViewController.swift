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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    let wineryModel: WineryModel?
    
    init(wineryModel: WineryModel, aTableStyle: UITableViewStyle) {
        self.wineryModel = wineryModel
        super.init(style: aTableStyle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
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
