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
    @IBOutlet private weak var loginView: UIView!
    @IBOutlet private weak var googleLoginLable: UILabel!
    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        loginView.layer.borderWidth = 2.0
        loginView.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 1, alpha: 0.5)
        logoView.layer.borderWidth = 2.0
        logoView.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 1, alpha: 0.4989297945)
        googleLoginLable.text = L10n.Localizable.logInWithGoogle
    }
    @IBAction func googleLogInView(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}
