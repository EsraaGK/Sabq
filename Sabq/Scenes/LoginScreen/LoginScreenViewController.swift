//
//  LoginScreenViewController.swift
//  Sabq
//
//  Created by EsraaGK on 11/8/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginScreenViewController: UIViewController {
    
    @IBOutlet private weak var signInButton: GIDSignInButton!
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)

          // Hide the navigation bar on the this view controller
       self.navigationController?.setNavigationBarHidden(true, animated: false)
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    
    }
}
