//
//  HomeViewController.swift
//  Umbrella
//
//  Created by Максим Боталов on 23.08.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: UI-components
    private let listTableView = UITableView(backgroundColor: .clear)
    
    let lm = LocationManager()
    
    // MARK: Lifecycle viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorSetup.white()
        title = "List of cities"
        
        setupTableView(for: listTableView)
        setupConstraints()
    }
    
    // MARK: SetupTableView function
    private func setupTableView(for tableView: UITableView) {
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellID)
//        tableView.rowHeight = 62
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellID, for: indexPath) as! ListTableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Setting UI-element constraints
extension HomeViewController {
    private func setupConstraints() {
        view.addSubview(listTableView)
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

