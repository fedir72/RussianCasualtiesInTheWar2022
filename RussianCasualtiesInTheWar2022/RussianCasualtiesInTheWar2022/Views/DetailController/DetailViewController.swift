//
//  DetailViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

class DetailViewController: UIViewController, Storybordable {
 
    weak var coordinator: AppCoordinator?
    var descriptionText: String?
 
    @IBOutlet weak var textLabel: UILabel!
    
    //MARK: - viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details".localized()
        if let item = descriptionText {
            textLabel.text = item
        }
    }
}
