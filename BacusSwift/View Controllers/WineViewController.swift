//
//  WineViewController.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

class WineViewController: UIViewController, UISplitViewControllerDelegate, WineryTableViewControllerDelegate {

    @IBOutlet weak var winePhotoImageView: UIImageView!
    @IBOutlet var ratingViews: [UIImageView]!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wineCompanyNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var grapesLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var wineModel: WineModel?
    var functionUtils = FunctionUtils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ((splitViewController?.displayMode) != nil) {
            self.showHideSplitSBarButton(displayMode: (self.splitViewController?.displayMode)!)
        }
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let wineName = wineModel?.wineName {
            self.title = wineName
        }else {
            self.title = "Bacus"
        }

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.5, green: 0, blue: 0.13, alpha: 1)
        
        syncronizeViewWithModel()
    }

    init(wineModel: WineModel) {
        self.wineModel = wineModel
        super.init(nibName: nil, bundle: nil)
    }
    
    fileprivate func syncronizeViewWithModel (){
     
        nameLabel.text = wineModel?.wineName
        wineCompanyNameLabel.text = wineModel?.wineCompanyName
        typeLabel.text = wineModel?.wineType
        originLabel.text = wineModel?.wineOrigin
        
        if let grapesToShow = wineModel?.wineGrapes {
            grapesLabel.text = functionUtils.arrayToString(arrayToConvert: grapesToShow)
        }else {
            grapesLabel.text = CONSTANTS.ERROR_DEFAULT_MESSAGE.DEFAULT_GRAPES_TEXT
        }

        if let notesToShow = wineModel?.wineNotes {
            notesLabel.text = notesToShow
        }else {
            notesLabel.text = CONSTANTS.ERROR_DEFAULT_MESSAGE.DEFAULT_NOTES_TEXT
        }
        
        if let imageToShow = wineModel?.winePhoto {
            winePhotoImageView.image = imageToShow
        }else{
            let dafaultImage = UIImage(named: CONSTANTS.ERROR_DEFAULT_MESSAGE.DEFAULT_IMAGE_NAME)
            winePhotoImageView.image = dafaultImage
        }
        displayRating(rating: (wineModel?.wineRating)!)
    }

    fileprivate func displayRating (rating: Int) {
        let glassRating = UIImage(named: CONSTANTS.IMAGE_NAMES.GLASS_RATING_IMAGE_NAME)
        clearAllRatingViews()

        if rating <= 0 {
            clearAllRatingViews()
        }else{
            for index in 0...rating-1 {
                self.ratingViews[index].image = glassRating
            }
        }
    }
    
    fileprivate func clearAllRatingViews (){
        for imageView: UIImageView in self.ratingViews {
            imageView.image = nil
        }
    }
    
    @IBAction func displayWineCompanyWeb(_ sender: UIButton) {
        let webVC = WebWineViewController(wineModel: wineModel!)
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
        showHideSplitSBarButton(displayMode: displayMode)
    }

    fileprivate func showHideSplitSBarButton(displayMode: UISplitViewController.DisplayMode) {
        if displayMode == UISplitViewController.DisplayMode.primaryHidden {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Baccus", style: .plain, target: self.splitViewController?.displayModeButtonItem.target, action: self.splitViewController?.displayModeButtonItem.action)
        } else if displayMode == UISplitViewController.DisplayMode.allVisible {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    func wineryTableViewController(wineryTableViewController: WineryTableViewController, didWineSelected: WineModel) {
        self.wineModel = didWineSelected
        self.title = didWineSelected.wineName
        self.syncronizeViewWithModel()
    }
    
}
































