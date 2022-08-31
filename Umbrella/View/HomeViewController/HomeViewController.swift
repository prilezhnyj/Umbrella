//
//  HomeViewController.swift
//  Umbrella
//
//  Created by Максим Боталов on 23.08.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Property
    private let allCities = Bundle.main.decode([CityModel].self, from: "CitiesRussia")
    private var filtredCities = [CityModel]()
    
    private var searchIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return text.isEmpty
    }
    
    private var isFiltring: Bool {
        return searchController.isActive && !searchIsEmpty
    }
    
    // MARK: UI-components
    private let listTableView = UITableView(backgroundColor: .clear)
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: Lifecycle viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorSetup.white()
        title = "Список городов"
        
        setupTableView(for: listTableView)
        setupConstraints()
        setupSearchController()
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите город"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: SetupTableView function
    private func setupTableView(for tableView: UITableView) {
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchController.searchBar.text!)
    }
    
    private func filterContent(_ searchText: String) {
        filtredCities = allCities.filter({ result -> Bool in
            return result.city!.lowercased().contains(searchText.lowercased())
        })
        listTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltring == true {
            return filtredCities.count
        }
        return allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellID, for: indexPath) as! ListTableViewCell
        var city: CityModel
        
        if isFiltring == true {
            city = filtredCities[indexPath.row]
        } else {
            city = allCities[indexPath.row]
        }
        
        cell.configureCell(for: city)
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

