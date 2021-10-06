//
//  ComicsVC.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import UIKit

class ComicsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        title = "Marvel Comics"
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.tabBarItem.title = ""
    }
}
