//
//  DonateViewController.swift
//  CoinTrak
//
//  Created by John Chiaramonte on 8/30/16.
//  Copyright © 2016 John Chiaramonte. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DonateViewController: UIViewController {

    let data = Data.sharedInstance
    
    //banner ad view
    @IBOutlet var bannerView: GADBannerView!
    
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBAction func emailButton(sender: AnyObject) {
        data.openURL("mailto:cointrak@gmail.com")
    }
    
    @IBAction func websiteButton(sender: AnyObject) {
        data.openURL("http://cointrak.me")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Donate View Controller Loaded")
        
        bannerView.adUnitID = "ca-app-pub-7526118464921133/2149088802"
        bannerView.rootViewController = self
        let request = GADRequest()
        request.testDevices = data.testDevices
        bannerView.loadRequest(request)
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        //gesture recognizer to open reveal view controller
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }


}
