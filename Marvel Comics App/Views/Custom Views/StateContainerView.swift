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
    var stateLabel = CustomLabel(fontSize: 20, textAlignment: .center)
    
    
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
    
    
    func configure(){
        self.addSubview(stateImageView)
        self.addSubview(stateLabel)
        
        stateImageView.tintColor = .systemGray3
        
        stateImageView.snp.makeConstraints { make in
            make.topMargin.equalTo(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(110)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(stateImageView.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}
