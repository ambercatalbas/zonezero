//
//  RegisterViewController.swift
//  zonezero
//
//  Created by AMBER ÇATALBAŞ on 14.09.2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var reTypePasswordTextField: UITextField!
  @IBOutlet weak var registerButton: UIButton!
  
  @IBOutlet weak var bttnBC: NSLayoutConstraint!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      delegates()
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                                     name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                             name: UIResponder.keyboardWillHideNotification, object: nil)
    }
  override func viewDidLayoutSubviews() {
    registerButton.layer.cornerRadius = 15
    registerButton.layer.masksToBounds = true
  }
  func delegates() {
    nameTextField.delegate = self
    emailTextField.delegate = self
    passwordTextField.delegate = self
    reTypePasswordTextField.delegate = self
  }
  //MARK: - Register button appearance
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  @objc func keyboardWillShow(notification:Notification) {
    if let userInfo = notification.userInfo as? Dictionary <String, AnyObject> {
      let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
      let keyboardRect = frame?.cgRectValue
      if let keyboardHeight = keyboardRect?.height {
        self.bttnBC.constant
          = keyboardHeight
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()
          
        })
      }
     
      
    }
    
  }
  @objc func keyboardWillHide(notification: Notification) {
    self.bttnBC.constant = 60.0
    UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()
      
    })
  }
 
    
  @IBAction func registerTapped(_ sender: Any) {
    
    passwordTextField.resignFirstResponder()
    nameTextField.resignFirstResponder()
    //MARK: - Text Controls
    guard let name = nameTextField.text, !name.isEmpty,
          let email = emailTextField.text, !email.isEmpty,
          let password = passwordTextField.text, !password.isEmpty,
          let reTypePassword = reTypePasswordTextField.text, !reTypePassword.isEmpty else {
      AlertUtility.present(title: "ERROR", message: "Fill in the blanks!", buttonTitle: "OK", handler: nil, delegate: self)
               
        return
    }
    guard name.count >= 3, email.count >= 3, password.count >= 3, reTypePassword.count >= 3 else {
      AlertUtility.present(title: "ERROR!", message: "Must be at least 3 characters", buttonTitle: "OK", handler: nil, delegate: self)
      print(name.count)
      return
    }
    guard password == reTypePassword else {
      AlertUtility.present(title: "ERROR!", message: "The Password is not the same as the ReType Password!", buttonTitle: "OK", handler: nil, delegate: self)
      return
    }
    //MARK: - Create user
    Auth.auth().createUser(withEmail: email, password: password) { authdata, error in
      if error != nil {
        AlertUtility.present(title: "Error", message: error?.localizedDescription ?? "User could not be created", delegate: self)
      } else {
        self.performSegue(withIdentifier: "fromRegisterVCtoLoginVC", sender: nil)
      }
    }
    


  }
  
}
