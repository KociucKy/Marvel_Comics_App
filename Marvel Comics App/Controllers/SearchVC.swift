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
    let stateContainer = StateContainerView(text: K.StateContainer.textLabel, icon: K.SFSymbols.book)
    var resultTableView: UITableView!
    var isSearchingFirstTime = true
    
    
    //MARK: - Properties
    var comicsResults: [Results] = []
    

    //MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
        configureResultTableView()
    }
    
    
    //MARK: - Methods
    private func configureVC(){
        view.backgroundColor = .secondarySystemBackground
        searchTextField.delegate = self
    }
    
    func layoutUI(){
        view.addSubview(searchTextField)
        view.addSubview(stateContainer)
        
        searchTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(K.SearchTextField.searchFieldTopMargin)
            make.left.equalTo(K.SearchTextField.searchFieldLeftRightMargin)
            make.right.equalTo(-K.SearchTextField.searchFieldLeftRightMargin)
            make.height.equalTo(K.SearchTextField.searchFieldHeight)
        }
        
        stateContainer.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.equalTo(K.ViewControllers.containerHeight)
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
            make.top.equalTo(searchTextField.snp.bottom).offset(K.TableView.resultTableOffset)
            make.left.equalTo(K.TableView.tableViewPadding)
            make.right.equalTo(-K.TableView.tableViewPadding)
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
                            self.displayAnAlert(title: K.Alerts.noResults, message: "There are no comics with title: \(title).", action: K.Alerts.alertAction)
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
                    case .failure(let error):
                        self.displayAnAlert(title: K.Alerts.anErrorOccured, message: error.rawValue, action: K.Alerts.alertAction)
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
        return K.TableView.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.TableView.cellPadding
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTableView.dequeueReusableCell(withIdentifier: ComicsCell.reuseID, for: indexPath) as! ComicsCell
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = K.TableView.cellCornerRadius
        cell.clipsToBounds = true
        cell.set(list: comicsResults, index: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.TableView.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !comicsResults[indexPath.section].urls.isEmpty{
            if let url = URL(string: comicsResults[indexPath.section].urls[0].url){
                presentSafariVC(with: url)
            }
        }
    }

}
