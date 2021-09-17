//
//  LoginViewController.swift
//  zonezero
//
//  Created by AMBER ÇATALBAŞ on 14.09.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var checkBox1: UIButton!
  @IBOutlet weak var checkBox2: UIButton!
  @IBOutlet weak var promotionalLabel: UILabel!
  @IBOutlet weak var remindLabal: UILabel!
  
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var loginBC: NSLayoutConstraint!
  
  var flag1 = false
  var flag2 = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkBox1.setBackgroundImage(UIImage(named: "blank-check-box"), for: .normal)
    checkBox2.setBackgroundImage(UIImage(named: "blank-check-box"), for: .normal)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                           name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
    checkBox2.isHidden = true
    promotionalLabel.isHidden = true
  }
  override func viewDidLayoutSubviews() {
    loginButton.layer.cornerRadius = 15
    loginButton.layer.masksToBounds = true
  }
  //MARK: - Login button appearance
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  @objc func keyboardWillShow(notification:Notification) {
    if let userInfo = notification.userInfo as? Dictionary <String, AnyObject> {
      let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
      let keyboardRect = frame?.cgRectValue
      if let keyboardHeight = keyboardRect?.height {
        self.loginBC.constant
          = keyboardHeight
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()
          
        })
      }
    }
    
  }
  @objc func keyboardWillHide(notification: Notification) {
    self.loginBC.constant = 60.0
    UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()
      
    })
  }
  
  @IBAction func checkButton1Tapped(_ sender: UIButton) {
    if flag1 == false {
      
      sender.setBackgroundImage(UIImage(named: "check-box"), for: .normal)
      flag1 = true
      checkBox2.isHidden = false
      promotionalLabel.isHidden = false
    } else {
      sender.setBackgroundImage(UIImage(named: "blank-check-box"), for: .normal)
      flag1 = false
    }
    
  }
  @IBAction func checkButton2Tapped(_ sender: UIButton) {
    if flag2 == false {
      
      sender.setBackgroundImage(UIImage(named: "check-box"), for: .normal)
      flag2 = true
    } else {
      sender.setBackgroundImage(UIImage(named: "blank-check-box"), for: .normal)
      flag2 = false
    }
    
  }
  
  @IBAction func loginButtonTapped(_ sender: Any) {
    
    guard let email = emailTextField.text, !email.isEmpty,
          let password = passwordTextField.text, !password.isEmpty else {
      AlertUtility.present(title: "ERROR", message: "Fill in the blanks!", buttonTitle: "OK", handler: nil, delegate: self)
      
      return
    }
    //MARK: - SignIn, Handlings Error
    
    Auth.auth().signIn(withEmail: email,
                       password: password) { (authdata, error) in
      if error != nil {
        
        if let errCode = AuthErrorCode(rawValue: error!._code) {
          
          switch errCode {
          case .wrongPassword:
            print("wrong password")
            AlertUtility.multiButton(title: "ERROR!", message: error?.localizedDescription ?? "wrong password/email", buttonTitle: "Cancel", buttonTitle1: "Retry", handler: nil, handler1: { UIAlertAction in
              
              self.passwordTextField.text = ""
            }, delegate: self)
          case .userNotFound:
            AlertUtility.multiButton(title: "ERROR!", message: error?.localizedDescription ?? "wrong password/email", buttonTitle: "Cancel", buttonTitle1: "Retry", handler: nil, handler1: { UIAlertAction in
              self.emailTextField.text = ""
            }, delegate: self)
            print(" user")
          case .invalidEmail:
            AlertUtility.multiButton(title: "ERROR!", message: error?.localizedDescription ?? "wrong password/email", buttonTitle: "Cancel", buttonTitle1: "Retry", handler: nil, handler1: { UIAlertAction in
              self.emailTextField.text = ""
            }, delegate: self)
            print("invalid email")
          default:
            print("other error")
          }
        }
        
      } else {
        // other method self.performSegue(withIdentifier: "toMovieListViewController", sender: nil)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        UIApplication.shared.windows.first?.rootViewController = vc
      }
    }
  }
}




