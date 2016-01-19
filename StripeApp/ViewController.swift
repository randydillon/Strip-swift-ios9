//
//  ViewController.swift
//  StripeApp
//
//  Created by Randy on 12/4/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var productsTable: UITableView!
    
    var productsNameArray = ["Pizza","Spagetti","Burger"]
    var productsPriceArray = ["10","9.5","8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("callSegueFunc"), name: "callSegue", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callSegueFunc() {
        self.performSegueWithIdentifier("goToPayVC_FromViewController", sender: self)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productsNameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: productsCell = tableView.dequeueReusableCellWithIdentifier("prodCell") as! productsCell
        
        cell.foodTypeLbl.text = productsNameArray[indexPath.row]
        cell.priceLbl.text = productsPriceArray[indexPath.row]
        
        return cell
    }
}

