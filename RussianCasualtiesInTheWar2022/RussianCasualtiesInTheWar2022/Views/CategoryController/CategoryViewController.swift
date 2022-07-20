//
//  CategoryViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit
//MARK: - controller constants
private struct Constant {
    static let titleTExt = "Categories".localized()
    static let tableviewColor = UIColor.clear
    static let heithOhtOfRow: CGFloat = 70
    }

class CategoryViewController: UIViewController,
                              Storybordable {
    // MARK: - Types
    
    weak var coordinator: AppCoordinator?
    private let transition = CustomTransitionAnimator()
    private let dataSourse = Category.allCases
    
    //MARK: - outlets
    @IBOutlet private weak var categoryTableview: UITableView!
    
    // MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.delegate = self
        title  = Constant.titleTExt
    }
    
 
    // MARK: - Private Methods
    private func setupTableView() {
        categoryTableview.register(CategoryTableViewCell.nib,
                                   forCellReuseIdentifier: CategoryTableViewCell.id)
        categoryTableview.backgroundColor = Constant.tableviewColor
        categoryTableview.delegate = self
        categoryTableview.dataSource = self
    }
}

//MARK: - UITableViewDataSource
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
        return Constant.heithOhtOfRow
    }
}

//MARK: - UITableViewDelegate
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = dataSourse[indexPath.row]
        categoryTableview.deselectRow(at: indexPath, animated: true)
        
        let startFrame = CGRect(x: 0, y: 0, width: 57, height: 57)
        transition.originFrame = startFrame
        coordinator?.goToListVC(with: category)
    }
}

//MARK: - UINavigationControllerDelegate
extension CategoryViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.operation = operation
        return transition
    }
}
