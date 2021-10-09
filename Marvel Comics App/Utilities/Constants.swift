//
//  Constants.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 09/10/2021.
//

import UIKit

enum K{
    enum ViewControllers{
        static let comicsVCTitle = "Marvel Comics"
        static let detailsVCTitle = "Details"
        static let containerHeight: CGFloat = 150.0
    }

    enum SearchTextField{
        static let searchFieldTopMargin: CGFloat = 10.0
        static let searchFieldLeftRightMargin: CGFloat = 20.0
        static let searchFieldHeight: CGFloat = 50.0
        static let containerHeight: CGFloat = 150.0
        static let cornerRadius: CGFloat = 10.0
        static let minimumFontSize: CGFloat = 17
        static let placeholder = "Search for a comic book"
        static let imageSize: CGFloat = 20.0
        static let imagePadding: CGFloat = 8.0
    }

    enum CustomCoverImage{
        static let cornerRadius: CGFloat = 8.0
    }
    
    enum TableView{
        static let tableViewPadding: CGFloat = 15
        static let cellCornerRadius: CGFloat = 8.0
        static let cellHeight: CGFloat = 200.0
        static let cellPadding: CGFloat = 1.0
        static let numberOfRows = 1
        static let resultTableOffset: CGFloat = 12.0
    }
    
    enum Fonts{
        static let fontSize: CGFloat = 20.0
        static let minimumScaleFactorSmall: CGFloat = 0.75
        static let minimumScaleFactorBig: CGFloat = 0.9
    }
    
    enum SFSymbols{
        static let searching = "magnifyingglass"
        static let home = "house.fill"
    }
    
    enum ComicsCell{
        static let coverImageWidth: CGFloat = 150.0
        static let noDescription = "Description not available."
        static let noAuthors = "Author(s) not available"
        static let thumbnailSize = "/portrait_xlarge.jpg"
    }
    
    enum StateContainer{
        static let imageTopMargin: CGFloat = 10.0
        static let imageHeight: CGFloat = 70.0
        static let imageWidth: CGFloat = 110.0
        static let labelOffset: CGFloat = 25.0
        static let labelHeight: CGFloat = 20.0
    }
    
    enum ComicContainer{
        static let descriptionNumberOfLines = 0
        static let padding: CGFloat = 12.0
        static let height: CGFloat = 20.0
        static let authorLabelOffset: CGFloat = 8.0
    }
    
    enum Networking{
        static let responseCode = 200
    }
}
