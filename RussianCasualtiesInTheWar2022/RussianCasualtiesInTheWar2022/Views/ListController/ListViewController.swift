//
//  ListViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

//MARK: - controller constants
fileprivate struct Constant {
    static let minimumSpasing: CGFloat = 2
    static let numberOfItemsInRow: CGFloat = 7
    static let aspectRatio: CGFloat = 1.1
    static let headerHeight: CGFloat = 40
}

class ListViewController: UIViewController, Storybordable {
    // MARK: - Types
    private let dataManager = DataManager.shared
    weak var coordinator: AppCoordinator?
    var category: Category?
    var datasourse = [Casualties]() {
        didSet { listCollectionView.reloadData() }
    }

    // MARK: - Private Properties
    lazy private var listCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ListCollectionViewCell.nib(),
                                    forCellWithReuseIdentifier: ListCollectionViewCell.id)
        cv.register(HeaderReusableView.nib(),
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: HeaderReusableView.id)
        return cv
    }()
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = category {
            dataManager.getData(by: category) { result in
                switch result {
                case .success(let array):
                    switch category {
                    case .personnel:
                        self.datasourse = array.compactMap{ Personnel(with: $0) }
                    case .equipment:
                        self.datasourse = array.compactMap{ Equipment(with: $0) }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listCollectionView.frame = view.bounds
        setupCollectionView()
    }
}

//MARK: - UICollectionViewDatasourse
extension ListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.months().count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         for i in (0...(months().count-1)) {
             if section == i {
                 let month = months()[i]
                 return daysInMonth(with: month).count
             }
         }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let month = months()[indexPath.section]
        let item =  daysInMonth(with: month)[indexPath.item]
        guard let cell =
        listCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                ListCollectionViewCell.id,
                                                for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let monthNumber = self.months()[indexPath.section]
        let view = listCollectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderReusableView.id,
            for: indexPath) as! HeaderReusableView
        view.setupHeader(with: monthNumber )
        return view
    }
    
}

//MARK: - UICollectionViewDelegate
extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let month = months()[indexPath.section]
        //print("month",month)
        let text =  daysInMonth(with: month)[indexPath.item].detailText()
        coordinator?.goToDetailVC(with: text)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.bounds.size.width,
               height: Constant.headerHeight)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - (Constant.numberOfItemsInRow+1)*Constant.minimumSpasing)/Constant.numberOfItemsInRow
        return CGSize(width: size, height: size*Constant.aspectRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.minimumSpasing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.minimumSpasing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constant.minimumSpasing,
                            left: Constant.minimumSpasing,
                            bottom: Constant.minimumSpasing,
                            right:Constant.minimumSpasing)
    }
}

// MARK: - Private Methods
private extension ListViewController {
    private func setupCollectionView() {
        listCollectionView.backgroundColor = .clear
        view.addSubview(listCollectionView)
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
    }

     func months() -> [Int] {
         let arr = Array(Set(datasourse.compactMap { Int($0.dateArray()[1]) })).sorted()
                return arr
    }
            
    func daysInMonth(with month: Int) -> [Casualties] {
        return datasourse.filter { $0.dateArray()[1] == month }
    }
}
