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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toLogin" {
            let destinationViewController = segue.destinationViewController as? LoginSignupViewController
            destinationViewController?.mode = LoginSignupViewController.ViewMode.Login
        } else if segue.identifier == "toSignup" {
            let destinationViewController = segue.destinationViewController as? LoginSignupViewController
            destinationViewController?.mode = LoginSignupViewController.ViewMode.Signup
            
        } else if segue.identifier == "toEditProfile" {
            let destinationViewController = segue.destinationViewController as? LoginSignupViewController
            destinationViewController?.mode = LoginSignupViewController.ViewMode.Edit
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
