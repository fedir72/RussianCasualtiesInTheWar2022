//
//  HeaderReusableView.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 04.07.2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    static let id = "HeaderReusableView"
    static func nib() -> UINib {
        return UINib(nibName: self.id, bundle: nil)
    }
    
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var monthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .tertiarySystemFill
        monthLabel.textColor = .gray
    }
    
    open func setupHeader(with number: Int ) {
        monthLabel.text = getMonth(by: number)
    }
    
    func getMonth(by number: Int) -> String {
        switch number {
        case 1: return  "January".localized()
        case 2: return  "February".localized()
        case 3: return  "March".localized()
        case 4: return  "April".localized()
        case 5: return  "May".localized()
        case 6: return  "June".localized()
        case 7: return  "July".localized()
        case 8: return  "August".localized()
        case 9: return  "September".localized()
        case 10: return  "October".localized()
        case 11: return  "November".localized()
            
        default: return "December".localized()
        }
    }
}
