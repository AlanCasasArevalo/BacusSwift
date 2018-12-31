//
//  WineViewController.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

class WineViewController: UIViewController {

    var wineModel: WineModel?
    
    override func viewDidLoad() { super.viewDidLoad() }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    init(wineModel: WineModel) {
        self.wineModel = wineModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.blue
    }
    
    
}
