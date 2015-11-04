//
//  LoginSignupPickerViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class LoginSignupPickerViewController: UIViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViewForMode(mode)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? LoginSignupViewController {
            if segue.identifier = "toLogin" {
                destinationViewController.mode = .Login
            }
            if segue.identifier = "toSignup" {
                destinationViewController.mode = .Signup
            }
            
            else {
                destinationViewController.mode = .Signup
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
