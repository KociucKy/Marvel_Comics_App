//
//  CustomCoverImage.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 08/10/2021.
//

import UIKit

class CustomCoverImage: UIImageView {

    //MARK: - Properties
    let cache = NetworkManager.shared.cache

    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    private func configure(){
        layer.cornerRadius = K.CustomCoverImage.cornerRadius
        clipsToBounds = true
    }
    
    
    func downloadImage(from urlString: String){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            self.image = image
            return
        }
            
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil{ return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }

}
