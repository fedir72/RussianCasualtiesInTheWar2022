//
//  CategoryTableViewCell.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    //MARK: - static properies and methods
    static let id = "CategoryTableViewCell"
    static let nib: UINib = {
        return UINib(nibName: CategoryTableViewCell.id, bundle: nil)
    }()

    //MARK: - outlets
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categorylabel: UILabel!
    
    //MARK: - lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
            setupUI()
    }

    //MARK: - public methods
    open func setupCell(with category: Category) {
        self.categoryImageView.image = UIImage(named:  category.imageName())
        self.categorylabel.text = category.categoryName()
    }
    
    //MARK: - private methods
    private func setupUI() {
        categoryImageView.backgroundColor = .white
        categoryImageView.layer.cornerRadius = 10
        categoryImageView.layer.borderWidth = 2
        categoryImageView.layer.borderColor = UIColor.systemGray4.cgColor
        categoryImageView.contentMode = .center
        categoryImageView.clipsToBounds = true
        backgroundColor = .clear
        categorylabel.tintColor = .systemGray2
    }
}
