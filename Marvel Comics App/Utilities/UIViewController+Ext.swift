//
//  UIViewController+Ext.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 08/10/2021.
//

import UIKit
import SafariServices
import SnapKit

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
}
