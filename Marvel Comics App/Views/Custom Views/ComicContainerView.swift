//
//  ComicContainerView.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 07/10/2021.
//

import UIKit

class ComicContainerView: UIView {
    
    //MARK: - UI Elements
    let titleLabel = CustomLabel(fontSize: 20, textAlignment: .left)
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
        
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        titleLabel.text = "Star Wars #39"
        authorLabel.text = "written by Mariko Tamaki"
        descriptionLabel.text = "Jen Walters used to fight for justice in the courtroom as a lawyer and outside of it as the super hero known as She-Hulk. But after the events of Civil War, Jen's Hulk persona has changed."
        descriptionLabel.numberOfLines = 0
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(20)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(authorLabel.snp.bottom).offset(12)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalToSuperview()
        }
    }

}
