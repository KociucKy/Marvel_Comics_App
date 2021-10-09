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
        layer.cornerRadius = K.SearchTextField.cornerRadius
        
        textColor = .systemGray
        tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = K.SearchTextField.minimumFontSize
        
        backgroundColor = .quaternarySystemFill
        autocorrectionType = .no
        returnKeyType = .go
        placeholder = K.SearchTextField.placeholder
        
        leftImage(UIImage(systemName: K.SFSymbols.searching), imageWidth: K.SearchTextField.imageSize, padding: K.SearchTextField.imagePadding)
        
        clearButtonMode = .whileEditing
    }
}
