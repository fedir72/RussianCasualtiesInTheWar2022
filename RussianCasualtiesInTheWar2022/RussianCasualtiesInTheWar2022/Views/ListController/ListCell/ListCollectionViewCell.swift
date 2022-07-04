//
//  ListCollectionViewCell.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 04.07.2022.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static let id = "ListCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.id, bundle: nil)
    }
    
    @IBOutlet weak var dayOfMonthLabel: UILabel!
    @IBOutlet weak var dayOfVarlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray3.cgColor
        clipsToBounds = true
    }
    
    open func setupCell(with item: Casualties) {
        dayOfMonthLabel.text = String(item.dateArray()[2])
        dayOfVarlabel.text = "day: " + String(item.day)
    }
   
}
