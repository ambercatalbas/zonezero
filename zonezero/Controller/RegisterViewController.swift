//
//  RegisterViewController.swift
//  zonezero
//
//  Created by AMBER ÇATALBAŞ on 14.09.2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var reTypePasswordTextField: UITextField!
  
  var name = ""
  var email = ""
  var password = ""
  var reTypePassword = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

      
      
    }
    
  @IBAction func registerTapped(_ sender: Any) {
    
    passwordTextField.resignFirstResponder()
    nameTextField.resignFirstResponder()
    
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
    //create user
    Auth.auth().createUser(withEmail: email, password: email) { authdata, error in
      if error != nil {
        AlertUtility.present(title: "Error", message: error?.localizedDescription ?? "User could not be created", delegate: self)
      } else {
        self.performSegue(withIdentifier: "fromRegisterVCtoLoginVC", sender: nil)
      }
    }
    

//    name = nameTextField.text ?? ""
//    email = emailTextField.text ?? ""
//    password = passwordTextField.text ?? ""
//    reTypePassword = reTypePasswordTextField.text ?? ""
//
//    let nameCaracterCount = name.count
//    let emailCaracterCount = emailTextField.text?.count
//    let passwordCaracterCount = passwordTextField.text?.count
//    let reTypePasswordCaracterCount = reTypePasswordTextField.text?.count
//
//    if name != "" && email != "" && password != "" && reTypePassword != "" {
//
//      if name.count > 2 && email.count > 2 && password.count > 2 && reTypePassword.count > 2 {
//        if password == reTypePassword {
//          //segue
//          print("segue")
//        } else {
//          AlertUtility.present(title: "Error!", message: "password not equaly reType", buttonTitle: "OK", buttonTitle1: "CANCEL", handler: nil,handler1: { UIAlertAction in
//            self.passwordTextField.text = ""
//            self.reTypePasswordTextField.text = ""
//          }, delegate: self)
//          print("password not equaly reType")
//        }
//
//
//      } else {
//        // count alert
////        AlertUtility.present(title: <#T##String#>, message: <#T##String#>, buttonTitle: <#T##String#>, buttonTitle1: <#T##String#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>, handler1: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>, delegate: <#T##UIViewController#>)
////        print("count alert")
//      }
//
//    } else {
//      //alert
//      print("alert empty")
//
//    }
  }
  
}
