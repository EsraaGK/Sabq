//
//  SocialLoginViewController.swift
//  Sabq
//
//  Created by EsraaGK on 11/11/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import GoogleSignIn
class SocialLoginViewController: UIViewController {
@IBOutlet private weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}
