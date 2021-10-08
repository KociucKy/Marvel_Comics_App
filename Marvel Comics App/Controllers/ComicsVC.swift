//
//  ComicsVC.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import UIKit
import SnapKit

class ComicsVC: UIViewController {
    
    //MARK: - UI Elements
    var comicsTableView: UITableView!
    
    
    //MARK: - Properties
    var comicsResults: [Results] = []
    var limit = 10

    
    //MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        title = "Marvel Comics"
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.tabBarItem.title = ""
        
    }
    
    
    func configureTableView(){
        comicsTableView = UITableView()
        comicsTableView.dataSource = self
        comicsTableView.delegate = self
        comicsTableView.backgroundColor  = .secondarySystemBackground
        comicsTableView.separatorStyle = .none
        getComics(limit: limit)
        
        view.addSubview(comicsTableView)
        comicsTableView.register(ComicsCell.self, forCellReuseIdentifier: ComicsCell.reuseID)
        comicsTableView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottomMargin.equalToSuperview()
        }
    }
    
    
     //MARK: - Network Call
    func getComics(limit: Int){
        NetworkManager.shared.getComics(limit: limit) { [weak self] result in
            guard let self = self else{ return }
            
            switch result{
            case .success(let comics):
                let list = comics.data.results
                self.comicsResults.append(contentsOf: list)
                DispatchQueue.main.async { self.comicsTableView.reloadData() }
            case .failure(let error): print(error)
            }
        }
    }
}


//MARK: - UITableView DataSource and Delegate
extension ComicsVC: UITableViewDataSource, UITableViewDelegate{
    
    //Using Sections with 1 row inside, to give cells a padding between them
    func numberOfSections(in tableView: UITableView) -> Int {
        return comicsResults.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicsTableView.dequeueReusableCell(withIdentifier: ComicsCell.reuseID, for: indexPath) as! ComicsCell
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        cell.set(list: comicsResults, index: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !comicsResults[indexPath.section].urls.isEmpty{
            if let url = URL(string: comicsResults[indexPath.section].urls[0].url){
                presentSafariVC(with: url)
            }
        }
    }
}
