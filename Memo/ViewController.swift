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
            println("--------------")
            println("Longitude")
            println(location.coordinate.longitude)
            println("Latitude")
            println(location.coordinate.latitude)
        }
        
//        PFObject *gameScore = [PFObject objectWithClassName:@"Position"];
//        gameScore[@"score"] = @1337;
//        gameScore[@"playerName"] = @"Sean Plott";
//        gameScore[@"cheatMode"] = @NO;
//        [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//        // The object has been saved.
//        } else {
//        // There was a problem, check error.description
//        }
//        }];
    }
}

