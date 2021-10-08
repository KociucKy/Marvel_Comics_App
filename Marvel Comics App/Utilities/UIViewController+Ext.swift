//
//  UIViewController+Ext.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 08/10/2021.
//

import UIKit
import SafariServices
import SnapKit

fileprivate var activityView: UIView?

extension UIViewController{    
    func displayAnAlert(title: String, message: String, action: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: action, style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {self.present(alert, animated: true, completion: nil)}
    }
    
    func presentSafariVC(with url: URL){
        let safariVC                        = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor  = .systemRed
        present(safariVC, animated: true)
    }
    
    func showSpinner(){
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = UIColor.systemGray6
        
        let ai = UIActivityIndicatorView(style: .large)
        activityView?.addSubview(ai)
        
        ai.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        ai.startAnimating()
        self.view.addSubview(activityView!)
        
        Timer.scheduledTimer(withTimeInterval: 20.0, repeats: false) { t in
            self.removeSpinner()
        }
    }
    
    func removeSpinner(){
        DispatchQueue.main.async {
            activityView?.removeFromSuperview()
            activityView = nil
        }
    }
}
