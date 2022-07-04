//
//  ListViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

class ListViewController: UIViewController, Storybordable {
    
    let dataManager = DataManager.shared
    // MARK: - Types
    weak var coordinator: AppCoordinator?
    var category: Category? {
        didSet {}
    }
    var datasourse = [[String:AnyObject]]() {
        didSet { print(datasourse)}
    }
    // MARK: - Constants

    // MARK: - Public Properties

    // MARK: - Subview Properties

    // MARK: - Private Properties

    // MARK: - UIViewController(*)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = category {
            dataManager.getData(by: category) { result in
                switch result {
                case .success(let obj): print(obj[0])
                case .failure(let error): print(error)
                }
            }
        }
       
    }
    
    // MARK: - Public Methods

    // MARK: - Private Methods
  
}
