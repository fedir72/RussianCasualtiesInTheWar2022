//
//  CategoryViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

class CategoryViewController: UIViewController, Storybordable {
    
    // MARK: - Types
    weak var coordinator: AppCoordinator?
    // MARK: - Constants

    // MARK: - Public Properties

    // MARK: - Subview Properties

    // MARK: - Private Properties
    private let dataSourse = Category.allCases
    @IBOutlet private weak var categoryTableview: UITableView!
    
    // MARK: - UIViewController(*)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
     title  = "Categories"
    }
    
    // MARK: - Public Methods

    // MARK: - Private Methods
    
    private func setupTableView() {
        categoryTableview.register(CategoryTableViewCell.nib,
                                   forCellReuseIdentifier: CategoryTableViewCell.id)
        categoryTableview.backgroundColor = .clear
        categoryTableview.delegate = self
        categoryTableview.dataSource = self
    }
  

}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSourse[indexPath.row]
        guard let cell = categoryTableview.dequeueReusableCell(withIdentifier: CategoryTableViewCell.id, for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(with: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
 
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = dataSourse[indexPath.row]
        categoryTableview.deselectRow(at: indexPath, animated: true)
        coordinator?.goToListVC(with: category )
    }
}
