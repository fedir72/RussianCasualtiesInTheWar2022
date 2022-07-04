//
//  HeaderReusableView.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 04.07.2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var monthLabel: UILabel!
    static let id = "HeaderReusableView"
    static func nib() -> UINib {
        return UINib(nibName: self.id, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        monthLabel.textColor = .gray
    }
    
    open func setupHeader() {
        
    }
}
