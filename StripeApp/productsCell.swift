//
//  productsCell.swift
//  StripeApp
//
//  Created by Randy on 12/16/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

import UIKit

class productsCell: UITableViewCell {

    @IBOutlet weak var foodTypeLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buyBtnTapped(sender: AnyObject) {
        print(foodTypeLbl.text!)
        
        theType = foodTypeLbl.text!
        thePrice = priceLbl.text!
        
        NSNotificationCenter.defaultCenter().postNotificationName("callSegue", object: self)
    }
}
