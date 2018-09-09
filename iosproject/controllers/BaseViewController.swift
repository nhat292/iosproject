//
//  BaseViewController.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import UIKit
import SVProgressHUD
import Toast_Swift


class BaseViewController: UIViewController {
    
    var dimView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override open var shouldAutorotate: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func backPressed() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //MARK: - ProgressHUD
    func showProgressHUD() {
        addDimView()
        SVProgressHUD.show()
    }
    
    func showProgressHUDStatus(status: String) {
        addDimView()
        SVProgressHUD.show(withStatus: status)
    }
    
    func showProgressHUDProgress(progress: Float) {
        addDimView()
        SVProgressHUD.showProgress(progress)
    }
    
    func showProgressHUDInfo(info: String) {
        addDimView()
        SVProgressHUD.showInfo(withStatus: info)
    }
    
    func showProgressHUDError(status: String) {
        addDimView()
        SVProgressHUD.showError(withStatus: status)
    }
    
    func showProgressHUDSuccess(status: String) {
        addDimView()
        SVProgressHUD.showSuccess(withStatus: status)
    }
    
    func hideProgressHUD() {
        SVProgressHUD.dismiss()
        removeDimView()
    }
    
    func addDimView() {
        let window = UIApplication.shared.keyWindow
        if (dimView == nil) {
            dimView = UIView(frame: window!.bounds)
            dimView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
        if window != nil {
            dimView.alpha = 0
            window!.addSubview(dimView)
            UIView.animate(withDuration: 0.5) {
                self.dimView.alpha = 1
            }
        }
    }
    
    func removeDimView() {
        if (dimView != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.dimView.alpha = 0
            }, completion: { (completed) in
                self.dimView.removeFromSuperview()
            })
        }
    }
    
    //MARK: - Toast
    func showToast(message: String) {
        if let window = UIApplication.shared.keyWindow {
            window.makeToast(message)
        } else {
            self.view.makeToast(message)
        }
    }
    
    // Open ViewController
    func openViewController(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    // Push ViewController
    func pushViewController(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    
}
