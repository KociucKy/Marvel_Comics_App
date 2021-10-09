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
    let coverImage = CustomCoverImage(frame: .zero)
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
        
        coverImage.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(K.ComicsCell.coverImageWidth)
        }
        
        comicContainer.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.leftMargin.equalTo(coverImage.snp.right).offset(10)
        }
    }
    
    
    func set(list: [Results], index: Int){
        comicContainer.titleLabel.text = list[index].title
        comicContainer.descriptionLabel.text = list[index].description ?? K.ComicsCell.noDescription
        
        if list[index].creators.returned == 0{
            comicContainer.authorLabel.text = "Author(s) not available"
        }else if list[index].creators.returned == 1{
            comicContainer.authorLabel.text = "Written by \(list[index].creators.items[0].name)"
        }else if list[index].creators.returned == 2{
            comicContainer.authorLabel.text = "Written by \(list[index].creators.items[0].name) and \(list[index].creators.items[1].name)"
        }
        
        coverImage.downloadImage(from: list[index].thumbnail.path + "/portrait_xlarge.jpg")
    }
}
