//
//  Extensions+UIViewController.swift
//  zonezero
//
//  Created by AMBER ÇATALBAŞ on 17.09.2021.
//

import UIKit

extension UIViewController {
    func hideKeyboard(){
        let gestureRecegnizer = UITapGestureRecognizer(target: self, action: #selector(hideKey))
        view.addGestureRecognizer(gestureRecegnizer)
       
    }
    @objc func hideKey() {
               view.endEditing(true)
           }
    
}
