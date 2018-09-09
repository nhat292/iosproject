//
//  UIViewController+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/10/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showOrHideNavigationBar(hidden: Bool, animated: Bool) {
        self.navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }
    
    func changeNavigationBarColor(textColor: UIColor, backgroundColor: UIColor) {
        //Title color
        navigationController?.navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName: textColor] as [NSAttributedStringKey : Any]
        //Back color
        navigationController?.navigationBar.tintColor = textColor
        //Background color
        navigationController?.navigationBar.barTintColor = backgroundColor
    }
    
    func setNavigationBarTitle(title: String) {
        navigationItem.title = title
    }
    
    func setBackText(backText: String) {
        navigationController?.navigationBar.backItem?.title = backText
    }
}
