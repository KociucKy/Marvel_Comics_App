//
//  SearchVC.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    //MARK: - UI Elements
    let searchTextField = CustomTextField(frame: .zero)
    let stateContainer = StateContainerView(text: "Start typing to find a particular comics.", icon: "book.fill")
    var resultTableView: UITableView!
    var isSearchingFirstTime = true
    
    
    //MARK: - Properties
    var comicsResults: [Results] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
        configureResultTableView()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        view.backgroundColor = .secondarySystemBackground
        searchTextField.delegate = self
    }
    
    func layoutUI(){
        view.addSubview(searchTextField)
        view.addSubview(stateContainer)
        
        searchTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
        stateContainer.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.equalTo(150)
            make.width.equalToSuperview()
        }
    }
    
    func configureResultTableView(){
        resultTableView = UITableView()
        resultTableView.backgroundColor  = .secondarySystemBackground
        resultTableView.separatorStyle = .none
        resultTableView.dataSource = self
        resultTableView.delegate = self
    }
    
    func displayResultTableView(){
        view.addSubview(resultTableView)
        resultTableView.register(ComicsCell.self, forCellReuseIdentifier: ComicsCell.reuseID)
        resultTableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(12)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottomMargin.equalToSuperview()
        }
    }
}


//MARK: - UITextField Delegate Methods
extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if searchTextField.text != ""{
            //making sure that names like "Star Wars" do not return an error
            if let title = searchTextField.text?.replacingOccurrences(of: " ", with: "%20"){
                NetworkManager.shared.getComicsByTitle(title: title) { [weak self] result in
                    guard let self = self else{ return }
                    self.comicsResults = []
                    
                    switch result{
                    case .success(let comics):
                        let list = comics.data.results
                        self.comicsResults.append(contentsOf: list)
                        
                        if self.comicsResults.isEmpty{
                            self.displayAnAlert(title: "No results", message: "There are no comics with title: \(title).", action: "Ok")
                        }else{
                            if self.isSearchingFirstTime{
                                DispatchQueue.main.async {
                                    self.stateContainer.removeFromSuperview()
                                    self.displayResultTableView()
                                    self.isSearchingFirstTime = false
                                }
                            }else{
                                DispatchQueue.main.async {
                                    self.resultTableView.reloadData()
                                }
                            }
                            
                        }
                    case .failure(let error): print(error)
                    }
                }
            }
            searchTextField.text = ""
        }
    }
}


//MARK: - UITableView Data Source and Delegate Methods
extension SearchVC: UITableViewDataSource, UITableViewDelegate{
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
        let cell = resultTableView.dequeueReusableCell(withIdentifier: ComicsCell.reuseID, for: indexPath) as! ComicsCell
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        cell.set(list: comicsResults, index: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
