//
//  CustomBodyLabel.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 07/10/2021.
//

import UIKit

class CustomBodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure(){
        textColor                   = .secondaryLabel
        font                        = UIFont.preferredFont(forTextStyle: .caption1)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = K.Fonts.minimumScaleFactorSmall
        lineBreakMode               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
