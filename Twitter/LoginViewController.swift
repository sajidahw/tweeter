//
//  LoginViewController.swift
//  Twitter
//
//  Created by Sajidah Wahdy on 2/22/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //once pages shows up, check the user default set for key in userlogin
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn")==true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    //when login button is clicked on, following code occurs:
    @IBAction func onLoginButton(_ sender: Any) {
        //print("Hello World!")
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        //API call to log in to Twitter
        TwitterAPICaller.client?.login(url: myUrl, success: {
            //keep login without reasking for credentials
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            //perform segue when successful, go to loginToHome
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in!")
        })
    }//once button is touched, the code will run; login closure; success is what we will do when login works; failure will do if it doesn't work
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
