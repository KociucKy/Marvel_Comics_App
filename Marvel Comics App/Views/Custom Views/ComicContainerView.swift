//
//  ComicContainerView.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 07/10/2021.
//

import UIKit

class ComicContainerView: UIView {
    
    //MARK: - UI Elements
    let titleLabel = CustomLabel(fontSize: K.Fonts.fontSize, textAlignment: .left)
    let authorLabel = CustomBodyLabel(textAlignment: .left)
    let descriptionLabel = UILabel()
    

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    func configure(){
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(descriptionLabel)
        
        titleLabel.font = UIFont.systemFont(ofSize: K.Fonts.fontSize, weight: .bold)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        descriptionLabel.numberOfLines = K.ComicContainer.descriptionNumberOfLines

        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(K.ComicContainer.padding)
            make.right.equalTo(-K.ComicContainer.padding)
            make.height.equalTo(K.ComicContainer.height)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(K.ComicContainer.authorLabelOffset)
            make.left.equalTo(K.ComicContainer.padding)
            make.right.equalTo(-K.ComicContainer.padding)
            make.height.equalTo(K.ComicContainer.height)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(authorLabel.snp.bottom).offset(K.ComicContainer.padding)
            make.left.equalTo(K.ComicContainer.padding)
            make.right.equalTo(-K.ComicContainer.padding)
            make.bottom.equalToSuperview()
        }
    }

}
