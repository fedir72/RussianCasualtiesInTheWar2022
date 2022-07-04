//
//  CategoryTableViewCell.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let id = "CategoryTableViewCell"
    static let nib: UINib = {
        return UINib(nibName: CategoryTableViewCell.id, bundle: nil)
    }()

    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categorylabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
       
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
    open func setupCell(with category: Category) {
        self.categoryImageView.image = UIImage(systemName: category.imageName())
        self.categorylabel.text = category.categoryName()
        
    }
}
