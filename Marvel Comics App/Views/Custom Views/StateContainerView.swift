//
//  CustomContainerView.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 07/10/2021.
//

import UIKit
import SnapKit

class StateContainerView: UIView {
    
    //MARK: - UI Elements
    var stateImageView = UIImageView()
    var stateLabel = CustomLabel(fontSize: K.Fonts.fontSize, textAlignment: .center)
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String, icon: String){
        super.init(frame: .zero)
        self.stateLabel.text = text
        self.stateImageView.image = UIImage(systemName: icon)
        configure()
    }
    
    
    //MARK: - Methods
    private func configure(){
        self.addSubview(stateImageView)
        self.addSubview(stateLabel)
        
        stateImageView.tintColor = .systemGray3
        
        stateImageView.snp.makeConstraints { make in
            make.topMargin.equalTo(K.StateContainer.imageTopMargin)
            make.centerX.equalToSuperview()
            make.height.equalTo(K.StateContainer.imageHeight)
            make.width.equalTo(K.StateContainer.imageWidth)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(stateImageView.snp.bottom).offset(K.StateContainer.labelOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(K.StateContainer.labelHeight)
        }
    }
}
