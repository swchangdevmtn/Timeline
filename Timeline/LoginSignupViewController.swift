//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var actionButtonLabel: UIButton!
    @IBAction func actionButtonTapped(sender: AnyObject) {
        
        if fieldAreValid {
            switch mode {
            case .Signup:
                UserController.createUser(emailField.text!, username: usernameField.text!, password: passwordField.text!, bio: bioField.text, url: urlField.text, completion: { (success, user) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Could not create user.", text: "Do something else and try again.")
                    }
                })
            case .Login:
                UserController.authenticateUser(emailField.text!, password: passwordField.text!, completion: { (success) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Couldn't log you in.", text: "Check your spelling.")
                    }
                })
            case .Edit:
                UserController.updateUser(user!, bio: bioField.text, url: urlField.text, completion: { (success, user) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Could not edit user.", text: "Sorry, try again.")
                    }
                })
                
            }
        }
    }
    
    var user: User?
    
    func presentValidationAlertWithTitle(title: String, text: String) {
        let validationAlert = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        validationAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(validationAlert, animated: true, completion: nil)
    }
    
    enum ViewMode {
        case Login
        case Signup
        case Edit
    }
    
    var mode: ViewMode = .Signup
    
    var fieldAreValid: Bool {
        switch mode {
        case .Signup:
            return !(emailField.text!.isEmpty || passwordField.text!.isEmpty)
        case .Login:
            return !(usernameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty)
        case .Edit:
            return !(usernameField.text!.isEmpty)
        }
    }
    
    func updateViewForMode(mode: ViewMode){
        switch mode {
        case .Signup:
            actionButtonLabel.setTitle("Sign up", forState: .Normal)
        case .Login:
            actionButtonLabel.setTitle("Login", forState: .Normal)
            usernameField.removeFromSuperview()
            bioField.removeFromSuperview()
            urlField.removeFromSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
