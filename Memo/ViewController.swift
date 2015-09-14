//
//  ViewController.swift
//  Memo
//
//  Created by eric_360 on 12/09/15.
//  Copyright (c) 2015 Eric Hong tuan ha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var locationManager : CLLocationManager =  CLLocationManager()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = 100
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations)
    }
}

