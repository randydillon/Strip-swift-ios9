//
//  payVC.swift
//  StripeApp
//
//  Created by Randy on 12/17/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

import UIKit

var theType = ""
var thePrice:String = ""


class payVC: UIViewController {

    @IBOutlet weak var cardTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var cvvTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = theType
    }
    
    @IBAction func payBtnTapped(sender: AnyObject) {
        let creditCard = STPCardParams()
        creditCard.number = cardTxt.text
        creditCard.cvc = cvvTxt.text
        
        if (!dateTxt.text!.isEmpty) {
            let exrArr = dateTxt.text?.componentsSeparatedByString("/")
            if exrArr?.count > 1 {
                let expMonth:NSNumber = Int(exrArr![0])!
                let expYear:NSNumber = Int(exrArr![1])!
                
                creditCard.expMonth = expMonth.unsignedLongValue
                creditCard.expYear = expYear.unsignedLongValue
            }
        }
        do { // try STPCardValidator.val
            try creditCard.validateCardReturningError()
            print("Validated")
            
            STPAPIClient.sharedClient().createTokenWithCard(creditCard, completion: {
                (token, stripeError) -> Void in
                
                if stripeError == nil {
                    print(token!.tokenID)
                } else {
                    print("token error")
                }
            },
        } catch {
            let alert = UIAlertController(title: "Not Valid", message: "Please enter a valid card", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
}
