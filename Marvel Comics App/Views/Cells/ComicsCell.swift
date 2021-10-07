//
//  ComicsCell.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import UIKit

class ComicsCell: UITableViewCell {
    
    //MARK: - UI Elements
    static let reuseID = "ComicsCell"
    let coverImage = UIImageView()
    let comicContainer = ComicContainerView(frame: .zero)
    
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    func configure(){
        addSubview(coverImage)
        addSubview(comicContainer)
        
        coverImage.layer.cornerRadius = 8
        coverImage.clipsToBounds = true
        
        coverImage.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(150)
        }
        
        comicContainer.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.leftMargin.equalTo(coverImage.snp.right).offset(10)
        }
    }
}
