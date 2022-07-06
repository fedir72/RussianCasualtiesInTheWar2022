//
//  DetailViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit
//MARK: - controller constants
private struct Constant {
    static let titleText = "Details".localized()
}

class DetailViewController: UIViewController, Storybordable {
 
    weak var coordinator: AppCoordinator?
    var descriptionText: String?
 
    @IBOutlet private weak var textLabel: UILabel!
    
    //MARK: - viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constant.titleText
        if let descriptionText = descriptionText {
            textLabel.text = descriptionText
        }
    }
}
