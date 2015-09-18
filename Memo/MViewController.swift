//
//  ViewController.swift
//  Memo
//
//  Created by eric_360 on 12/09/15.
//  Copyright (c) 2015 Eric Hong tuan ha. All rights reserved.
//

import UIKit

class MViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource
{
    var locationManager : CLLocationManager =  CLLocationManager()
    var tableView : UITableView = UITableView()
    var results : [PFObject] = [PFObject]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // CLLocationManager
        locationManager.delegate = self
        locationManager.desiredAccuracy = 100
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        locationManager.activityType = CLActivityType.Fitness
        // locationManager.pausesLocationUpdatesAutomatically = true
        // UITableView
        tableView.frame = self.view.frame
        self.view.addSubview(tableView)
        tableView.dataSource = self
//        tableView.registerClass(MTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.registerNib(UINib(nibName: "MTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 4
        self.query { (results) -> Void in
            self.results = results
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    private func query(completion:((results:[PFObject]!	) -> Void)){
        var query = PFQuery(className: "Position")
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            if let results = results as? [PFObject]{
                completion(results: results)
            }
        }
    }
    //CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        for location in locations
        {
            var position = PFObject(className: "Position")
            position["latitude"] = location.coordinate.latitude
            position["longitude"] = location.coordinate.longitude
            position.saveInBackgroundWithBlock({ (success, error) -> Void in
            })
        }
    }
    // UITableViewDatasource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MTableViewCell
        var object = results[indexPath.row]
        let test = object["latitude"] as! Double
        cell.latitude.text = String(format: "%f", test)
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
}

