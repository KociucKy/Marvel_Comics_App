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
        
        view.addSubview(comicsTableView)
        comicsTableView.register(ComicsCell.self, forCellReuseIdentifier: ComicsCell.reuseID)
        comicsTableView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottomMargin.equalToSuperview()
        }
    }
}


//MARK: - UITableView DataSource and Delegate
extension ComicsVC: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
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
        cell.coverImage.image = UIImage(named: "Cover")
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
