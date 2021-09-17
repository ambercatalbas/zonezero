# ZoneZero
--------
## RegisterViewController
----------
Data could be sent with prepare. But I wanted to use Firebase. I wanted to add some color.
```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLoginVC" {
            let destinationVC = segue.destination as! LoginViewController
            destinationVC.name = userName
            destinationVC.email = email
            destinationVC.password = password
        }
    }
```
 And I used firebase auth. I created a user with email and password.
 
```swift
 Auth.auth().createUser(withEmail: email, password: password) { authdata, error in
```
### I created alertclass for alerts.

### Since the button is not visible, I changed the button constraint using notification center.

## LoginViewController
---------
## I made firebase signIn,

### Firebase checks password and user information and returns an error. We take action based on these errors.
```swift
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
```
## Both can be used to switch between controllers.
```swift
// other method self.performSegue(withIdentifier: "toMovieListViewController", sender: nil)
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(controller!, animated: true)
        
 ```
## MovielistViewController
---------

### I made TableViewCell with xib, but we can do it with storyboard custom cell or programatically.
