//
//  LoginScreenViewController.swift
//  Sabq
//
//  Created by EsraaGK on 11/8/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import FittedSheets

enum PasswordTextFieldStatus {
    case letters
    case dots
}
class LoginScreenViewController: UIViewController {
    @IBOutlet private weak var passwordTextField: UITextField!
    var passwordStatus = PasswordTextFieldStatus.dots
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
