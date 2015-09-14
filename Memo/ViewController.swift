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
    var locationManager : CLLocationManager =  CLLocationManager()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = 100
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        for location in locations
        {
            var position = PFObject(className: "Position")
            position["latitude"] = location.coordinate.latitude
            position["longitude"] = location.coordinate.longitude
             position.saveInBackgroundWithBlock({ (success, error) -> Void in
                println("Success")
                println(success)
             })
        }
    }
}

