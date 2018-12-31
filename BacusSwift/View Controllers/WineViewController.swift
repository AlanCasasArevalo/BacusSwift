//
//  WineViewController.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

class WineViewController: UIViewController {

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
    
    override func viewDidLoad() { super.viewDidLoad() }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        let glassRating = UIImage(named: CONSTANTS.WINE_MODEL_CONSTANTS.GLASS_RATING_IMAGE_NAME)
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
        print("Company Web \(self.wineModel?.wineCompanyWeb)")
        
        
        
    }
    
}
































