//
//  CustomTextField.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import UIKit

class CustomTextField: UITextField {

    
    //MARK: - Initializers
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    func configure(){
        layer.cornerRadius = 10
        
        textColor = .systemGray
        tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 17
        
        backgroundColor = .quaternarySystemFill
        autocorrectionType = .no
        returnKeyType = .go
        placeholder = "Search for a comic book"
        
        leftImage(UIImage(systemName: "magnifyingglass"), imageWidth: 20, padding: 8)
        
        clearButtonMode = .whileEditing
    }
}
