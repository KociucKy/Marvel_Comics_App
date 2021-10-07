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
        
        view.addSubview(comicsTableView)
        comicsTableView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}


//MARK: - UITableView DataSource and Delegate
extension ComicsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
