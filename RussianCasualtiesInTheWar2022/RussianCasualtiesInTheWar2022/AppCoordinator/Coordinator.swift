//
//  Coordinor.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
    func goToListVC(with type: Category)
    func goToDetailVC(with text: String)
}
