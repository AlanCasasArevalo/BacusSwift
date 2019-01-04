//
//  WebWineViewController.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit
import WebKit

class WebWineViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var wineWebView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var wineModel: WineModel?

    override func viewDidLoad() { super.viewDidLoad() }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Web"
        
        if let urlWineWeb = wineModel?.wineCompanyWeb {
            displayWineWeb(urlToDisplay: urlWineWeb)
        }else{
            displayWineWeb(urlToDisplay: CONSTANTS.ERROR_DEFAULT_MESSAGE.DEFAULT_WEB_TO_SHOW)
        }
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(wineDidChanged), name: Notification.Name(rawValue: CONSTANTS.WINERY_NOTIFICATION.WINE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    @objc fileprivate func wineDidChanged (notification: Notification){
        let dictionary = notification.userInfo
        let wineUpdated = dictionary?[CONSTANTS.WINERY_NOTIFICATION.WINE_MODEL_KEY]
        
        self.wineModel = wineUpdated as? WineModel
        
        self.displayWineWeb(urlToDisplay: (wineModel?.wineCompanyWeb)!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    init(wineModel: WineModel) {
        self.wineModel = wineModel
        super.init(nibName: nil, bundle: nil)
    }
    
    fileprivate func displayWineWeb(urlToDisplay: URL) {
        self.wineWebView.navigationDelegate = self
        self.startActivityIndicator()
        let urlRequest = URLRequest(url: urlToDisplay)
        wineWebView.load(urlRequest)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.stopActivityIndicator()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
}


















