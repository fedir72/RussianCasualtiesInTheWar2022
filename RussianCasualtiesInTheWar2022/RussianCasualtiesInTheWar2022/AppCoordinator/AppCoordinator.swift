//
//  AppCoordinator.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isTranslucent = true
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let vc = CategoryViewController.createObject()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToListVC() {
        let vc = SubcategoryListViewController.createObject()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailVC() {
        let vc = DetailViewController.createObject()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}