//
//  ListCollectionViewCell.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 04.07.2022.
//

import UIKit
private struct Constant {
    static let background = UIColor.clear
    static let borderColor = UIColor.gray.cgColor
    static let day = "day: ".localized()
    static let cornerradius: CGFloat = 10
    static let borderWeith: CGFloat = 1
}

class ListCollectionViewCell: UICollectionViewCell {
    //MARK: - static properies and methods
    static let id = "ListCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.id, bundle: nil)
    }
    
    //MARK: - outlets
    @IBOutlet private weak var dayOfMonthLabel: UILabel!
    @IBOutlet private weak var dayOfVarlabel: UILabel!
    
    //MARK: - lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
      setupUI()
    }
    
    //MARK: - public methods
    open func setupCell(with item: Casualties) {
        dayOfMonthLabel.text = String(item.dateArray()[2])
        dayOfVarlabel.text = Constant.day + String(item.day)
    }
    
    //MARK: - private methods
    private func setupUI() {
        backgroundColor = Constant.background
        layer.cornerRadius = Constant.cornerradius
        layer.borderWidth = Constant.borderWeith
        layer.borderColor = Constant.borderColor
        clipsToBounds = true
    }
   
}
