//
//  SearchVC.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    //MARK: - UI Elements
    let searchTextField = CustomTextField(frame: .zero)
    let stateContainer = StateContainerView(text: "Start typing to find a particular comics.", icon: "book.fill")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        view.backgroundColor = .systemBackground
    }
    
    func layoutUI(){
        view.addSubview(searchTextField)
        view.addSubview(stateContainer)
        
//        searchTextField.backgroundColor = .systemPink
        
        searchTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
        stateContainer.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.equalTo(150)
            make.width.equalToSuperview()
        }
    }
}
