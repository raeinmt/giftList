//
//  LoginViewController.swift
//  giftList
//
//  Created by Raein Teymouri on 10/20/17.
//  Copyright © 2017 Raein Teymouri. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {


    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginUser(_ sender: UIButton) {
        guard let emailText = email.text, let passwordText = password.text else {
            print("Email/password cannot be empty")
            return
        }
        Firebase.Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
           
            if(error != nil){
                print(error!)
                return
            }
            print("Successfull login!")
            self .performSegue(withIdentifier: "LoginSegue", sender: nil)
        }
//        let dbRef = Firebase.Database.database().reference(fromURL: "https://giftlist-7a173.firebaseio.com/")
//        dbRef.updateChildValues(["someValue" : 1234])
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ((Firebase.Auth.auth().currentUser?.email) != nil) {
            self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
