//
//  FilterViewController.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 1.08.2021.
//

import UIKit

protocol FilterViewControllerDelegate {
    func didUpdateFilter(filter: String)
}

class FilterViewController: UIViewController {
    
    let categories = ["Men's Clothing","Women's Clothing","Electronics","Jewelery"]
    
    var tableView: UITableView!
    var currentFilter = ""
    var delegate: FilterViewControllerDelegate!
    let filterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Filtrele", for: .normal)
        button.layer.cornerRadius = 28
        button.layer.backgroundColor = #colorLiteral(red: 0.993037045, green: 0.748840332, blue: 0.006271075923, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureFilterButton()
    }
    
    @objc func filterButtonAction(){
        if currentFilter == "" {
            let alert = UIAlertController(title: "Hata", message: "Bir kategori belirtmeden filtreleme yapmaya çalıştınız.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            delegate.didUpdateFilter(filter: currentFilter)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func configureTableView(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 80))
        header.backgroundColor = .secondarySystemBackground
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.font = UIFont(name: "Helvetica", size: 22)
        headerLabel.text = "Kategoriler"
        headerLabel.textAlignment = .center
        header.addSubview(headerLabel)
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = header
        
        view.addSubview(tableView)
    }
    
    func configureFilterButton(){
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterButton)
        NSLayoutConstraint.activate([
            filterButton.heightAnchor.constraint(equalToConstant: 56),
            filterButton.widthAnchor.constraint(equalToConstant:251),
            filterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26)
        ])
        filterButton.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
    }
}
extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentFilter = categories[indexPath.row]
    }
}
extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.backgroundColor = .white
        cell?.textLabel?.textColor = .black
        
        return cell!
    }
}
