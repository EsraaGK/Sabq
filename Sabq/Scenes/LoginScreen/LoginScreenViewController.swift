//
//  LoginScreenViewController.swift
//  Sabq
//
//  Created by EsraaGK on 11/8/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import FittedSheets
import AuthenticationServices

enum PasswordTextFieldStatus {
    case letters
    case dots
}
class LoginScreenViewController: UIViewController {
    @IBOutlet private weak var passwordTextField: UITextField!
    var passwordStatus = PasswordTextFieldStatus.dots
    @IBOutlet private weak var appleView: UIView!
    @IBAction func hideOrShowPassword(_ sender: UIButton) {
        switch passwordStatus {
        case .dots:
            passwordTextField.isSecureTextEntry = false
            passwordStatus = .letters
        default:
            passwordTextField.isSecureTextEntry = true
            passwordStatus = .dots
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
        setUpSignInAppleButton()
    }
    func setUpSignInAppleButton() {
        if #available(iOS 13.0, *) {
            let authorizationButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default,
                                                                   authorizationButtonStyle: .whiteOutline)
            
            authorizationButton.addTarget(self, action: #selector(handleAppleIdRequest), for: .touchUpInside)
            
            authorizationButton.translatesAutoresizingMaskIntoConstraints = false
            appleView.addSubview(authorizationButton)
    NSLayoutConstraint.activate(
        [authorizationButton.centerYAnchor.constraint(equalTo: appleView.centerYAnchor),
         authorizationButton.heightAnchor.constraint(equalToConstant: 55),
    authorizationButton.leadingAnchor.constraint(equalTo: appleView.leadingAnchor),
    authorizationButton.trailingAnchor.constraint(equalTo: appleView.trailingAnchor)
    ])
        } else {
            // Fallback on earlier versions
        }
        
    }
    @objc
    func handleAppleIdRequest() {
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
                //as? ASAuthorizationControllerDelegate
            authorizationController.performRequests()
        } else {
            // Fallback on earlier versions
        }
        
    }
    @IBAction func socialLogin(_ sender: UIButton) {
        let controller = SocialLoginViewController()
        
        let sheetController = SheetViewController(controller: controller,
                                                  sizes: [.fixed(200),
                                                          .fixed(200),
                                                          .halfScreen,
                                                          .fullScreen])
        
        // Adjust how the bottom safe area is handled on iPhone X screens
        sheetController.blurBottomSafeArea = false
        sheetController.adjustForBottomSafeArea = true
        
        // Turn off rounded corners
        sheetController.topCornersRadius = 0
        
        // Make corners more round
        sheetController.topCornersRadius = 15
        
        // Disable the dismiss on background tap functionality
        sheetController.dismissOnBackgroundTap = true
        
        // Extend the background behind the pull bar instead of having it transparent
        sheetController.extendBackgroundBehindHandle = true
        
        // Change the overlay color
        //sheetController.overlayColor = UIColor.red
        
        // Change the handle color
        sheetController.handleColor = UIColor.blue
        
        self.present(sheetController, animated: true, completion: nil)
    }
}

extension LoginScreenViewController: ASAuthorizationControllerDelegate {
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            self.navigationController?.pushViewController(Router.getTabBar(), animated: false )
            print("User id is \(userIdentifier) ")
            print("Full Name is \(String(describing: fullName)) ")
            print("Email id is \(String(describing: email))") }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("error log in with apple id")
    }
}
