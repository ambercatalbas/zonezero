////
////  ViewController.swift
////  zonezero
////
////  Created by AMBER ÇATALBAŞ on 16.09.2021.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//Firebase
//Products
//Use Cases
//Pricing
//Docs
//Community
//Support
//ErrorCodeInvalidEmail
//English
//Go to console
//
//Documentation
//Overview
//Fundamentals
//Build
//Release & Monitor
//Engage
//Reference
//Samples
//
//Firebase
//Docs
//Build
//Was this helpful?
//
//Send feedbackHandle Firebase iOS Auth Errors
//If the completion callback on Authentication methods receives an NSError argument that is not nil, an error has occurred. To dispatch to appropriate error-handling logic in your production code, check the error code against common errors and method specific errors listed below.
//
//Some errors can be resolved by particular user actions, for example, FIRAuthErrorCodeUserTokenExpired can be resolved by signing the user in again, and FIRAuthErrorCodeWrongPassword by asking the user to provide the right password.
//
//Except in the case of FIRAuthErrorCodeNetworkError or FIRAuthErrorCodeTooManyRequests, retrying a failing operation with the same arguments will never succeed. Make no assumption on whether or not the operation has taken effect on the server side.
//
//When investigating or logging errors, review the userInfo dictionary. FIRAuthErrorNameKey contains a cross-platform error name string that can be used for identifying the error. NSLocalizedDescriptionKey contains a description of the error. This description is meant for the developer, not the user. NSUnderlyingErrorKey contains the underlying error that caused the error in question, if an underlying error is present.
//
//In addition to the main fields listed above, there can be other fields in the userInfo dictionary that you may find useful when diagnosing errors.
//
//Error codes common to all API methods
//Code  Meaning
//FIRAuthErrorCodeNetworkError  Indicates a network error occurred during the operation.
//FIRAuthErrorCodeUserNotFound  Indicates the user account was not found. This could happen if the user account has been deleted.
//FIRAuthErrorCodeUserTokenExpired  Indicates the current user’s token has expired, for example, the user may have changed account password on another device. You must prompt the user to sign in again on this device.
//FIRAuthErrorCodeTooManyRequests  Indicates that the request has been blocked after an abnormal number of requests have been made from the caller device to the Firebase Authentication servers. Retry again after some time.
//FIRAuthErrorCodeInvalidAPIKey  Indicates the application has been configured with an invalid API key.
//FIRAuthErrorCodeAppNotAuthorized  Indicates the App is not authorized to use Firebase Authentication with the provided API Key. go to the Google API Console and check under the credentials tab that the API key you are using has your application’s bundle ID whitelisted.
//FIRAuthErrorCodeKeychainError  Indicates an error occurred when accessing the keychain. The NSLocalizedFailureReasonErrorKey and NSUnderlyingErrorKey fields in the NSError.userInfo dictionary will contain more information about the error encountered.
//FIRAuthErrorCodeInternalError  Indicates an internal error occurred. Please report the error with the entire NSError object.
//Method specific error codes
//FIRAuth
//fetchProvidersForEmail:completion:
//Code  Meaning
//FIRAuthErrorCodeInvalidEmail  Indicates the email address is malformed.
//signInWithEmail:password:completion:
//Code  Meaning
//FIRAuthErrorCodeOperationNotAllowed  Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
//FIRAuthErrorCodeInvalidEmail  Indicates the email address is malformed.
//FIRAuthErrorCodeUserDisabled  Indicates the user's account is disabled.
//FIRAuthErrorCodeWrongPassword  Indicates the user attempted sign in with a wrong password.
//signInWithCredential:completion:
//Code  Meaning
//FIRAuthErrorCodeInvalidCredential  Indicates the supplied credential is invalid. This could happen if it has expired or it is malformed.
//FIRAuthErrorCodeInvalidEmail  Indicates the email address is malformed, if credential is of the type EmailPasswordAuthCredential.
//FIRAuthErrorCodeOperationNotAllowed  Indicates that accounts with the identity provider represented by the credential are not enabled. Enable them in the Auth section of the Firebase console.
//FIRAuthErrorCodeEmailAlreadyInUse  Indicates the email asserted by the credential (e.g. the email in a Facebook access token) is already in use by an existing account, that cannot be authenticated with this sign-in method. Call fetchProvidersForEmail for this user’s email and then prompt them to sign in with any of the sign-in providers returned. This error will only be thrown if the "One account per email address" setting is enabled in the Firebase console, under Authentication settings.
//FIRAuthErrorCodeUserDisabled  Indicates the user's account is disabled.
//FIRAuthErrorCodeWrongPassword  Indicates the user attempted sign in with a wrong password, if credential is of the type EmailPasswordAuthCredential.
//signInAnonymouslyWithCompletion:
//Code  Meaning
//FIRAuthErrorCodeOperationNotAllowed  Indicates that anonymous accounts are not enabled. Enable them in the Auth section of the Firebase console.
//signInWithCustomToken:completion:
//Code  Meaning
//FIRAuthErrorCodeInvalidCustomToken  Indicates a validation error with the custom token.
//FIRAuthErrorCodeCustomTokenMismatch  Indicates the service account and the API key belong to different projects.
//createUserWithEmail:password:completion:
//Code  Meaning
//FIRAuthErrorCodeInvalidEmail  Indicates the email address is malformed.
//FIRAuthErrorCodeEmailAlreadyInUse  Indicates the email used to attempt sign up already exists. Call fetchProvidersForEmail to check which sign-in mechanisms such user used, and prompt the user to sign in with one of those.
//FIRAuthErrorCodeOperationNotAllowed  Indicates that email and password accounts are not enabled. Enable them in the Authentication section of the Firebase console.
//FIRAuthErrorCodeWeakPassword  Indicates an attempt to set a password that is considered too weak. The NSLocalizedFailureReasonErrorKey field in the NSError.userInfo dictionary object will contain more detailed explanation that can be shown to the user.
//signOut:
//Code  Meaning
//FIRAuthErrorCodeKeychainError  Indicated an error occurred when accessing the keychain. The NSLocalizedFailureReasonErrorKey and NSUnderlyingErrorKey fields in the NSError.userInfo dictionary will contain more information about the error encountered.
//FIRUser
//Common errors for FIRUser operations
//Code  Meaning
//FIRAuthErrorCodeInvalidUserToken  Indicates that the signed-in user's refresh token, that holds session information, is invalid. You must prompt the user to sign in again on this device.
//FIRAuthErrorCodeUserDisabled  Indicates the user's account is disabled and can no longer be used until enabled again from within the Users panel in the Firebase console.
//reauthenticateWithCredential:completion:
//Code  Meaning
//FIRAuthErrorCodeInvalidCredential  Indicates the supplied credential is invalid. This could happen if it has expired or it is malformed.
//FIRAuthErrorCodeInvalidEmail  Indicates the email address is malformed, if credential is of the type EmailPasswordAuthCredential.
//FIRAuthErrorCodeWrongPassword  Indicates the user attempted reauthentication with an incorrect password, if credential is of the type EmailPasswordAuthCredential.
//FIRAuthErrorCodeUserMismatch  Indicates that an attempt was made to reauthenticate with a user which is not the current user.
//FIRAuthErrorCodeOperationNotAllowed  Indicates that accounts with the identity provider represented by the credential are not enabled. Enable them in the Auth section of the Firebase console.
//FIRAuthErrorCodeEmailAlreadyInUse  Indicates the email asserted by the credential (e.g. the email in a Facebook access token) is already in use by an existing account, that cannot be reauthenticated with this sign-in method. Call fetchProvidersForEmail for this user’s email and then prompt them to sign in with any of the sign-in providers returned. This error will only be thrown if the "One account per email address" setting is enabled in the Firebase console, under Authentication settings.
//FIRAuthErrorCodeUserDisabled  Indicates the user's account is disabled.
//updateEmail:completion:
//Code  Meaning
//FIRAuthErrorCodeEmailAlreadyInUse  Indicates the email is already in use by another account.
//FIRAuthErrorCodeInvalidEmail  Indicates the email address is malformed.
//FIRAuthErrorCodeRequiresRecentLogin  Updating a user’s email is a security sensitive operation that requires a recent login from the user. This error indicates the user has not signed in recently enough. To resolve, reauthenticate the user by invoking reauthenticateWithCredential:completion: on FIRUser.
//updatePassword:completion:
//Code  Meaning
//FIRAuthErrorCodeOperationNotAllowed  Indicates the administrator disabled sign in with the specified identity provider.
//FIRAuthErrorCodeRequiresRecentLogin  Updating a user’s password is a security sensitive operation that requires a recent login from the user. This error indicates the user has not signed in recently enough. To resolve, reauthenticate the user by invoking reauthenticateWithCredential:completion: on FIRUser.
//FIRAuthErrorCodeWeakPassword  Indicates an attempt to set a password that is considered too weak. The NSLocalizedFailureReasonErrorKey field in the NSError.userInfo dictionary object will contain more detailed explanation that can be shown to the user.
//linkWithCredential:completion:
//Code  Meaning
//FIRAuthErrorCodeProviderAlreadyLinked  Indicates an attempt to link a provider of a type already linked to this account.
//FIRAuthErrorCodeCredentialAlreadyInUse  Indicates an attempt to link with a credential that has already been linked with a different Firebase account.
//FIRAuthErrorCodeOperationNotAllowed  Indicates that accounts with the identity provider represented by the credential are not enabled. Enable them in the Auth section of the Firebase console.
//This method may also return error codes associated with updateEmail:completion: and updatePassword:completion: on FIRUser.
//
//unlinkFromProvider:completion:
//Code  Meaning
//FIRAuthErrorCodeNoSuchProvider  Indicates an attempt to unlink a provider that is not linked to the account.
//FIRAuthErrorCodeRequiresRecentLogin  Updating email is a security sensitive operation that requires a recent login from the user. This error indicates the user has not signed in recently enough. To resolve, reauthenticate the user by invoking reauthenticateWithCredential:completion: on FIRUser.
//sendEmailVerificationWithCompletion:
//Code  Meaning
//FIRAuthErrorCodeUserNotFound  Indicates the user account was not found.
//deleteWithCompletion:
//Code  Meaning
//FIRAuthErrorCodeRequiresRecentLogin  Deleting a user account is a security sensitive operation that requires a recent login from the user. This error indicates the user has not signed in recently enough. To resolve, reauthenticate the user by invoking reauthenticateWithCredential:completion: on FIRUser.
//Was this helpful?
//
//Send feedback
//Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License, and code samples are licensed under the Apache 2.0 License. For details, see the Google Developers Site Policies. Java is a registered trademark of Oracle and/or its affiliates.
//
//Last updated 2021-09-08 UTC.
//
//Learn
//Guides
//Reference
//Samples
//Libraries
//GitHub
//Stay connected
//Blog
//Firebase Summit
//Facebook
//Twitter
//YouTube
//Support
//Contact support
//Stack Overflow
//Slack community
//Google group
//Release notes
//FAQs
//Google Developers
//Android
//Chrome
//Firebase
//Google Cloud Platform
//All products
//Terms
//Privacy
//English
//The new page has loaded.
