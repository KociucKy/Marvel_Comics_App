//
//  DetailsVC.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 09/10/2021.
//

import UIKit

class DetailsVC: UIViewController {

    
    //MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    
    //MARK: - Methods
    private func configureVC(){
        view.backgroundColor = .secondarySystemBackground
        title = K.ViewControllers.detailsVCTitle
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
