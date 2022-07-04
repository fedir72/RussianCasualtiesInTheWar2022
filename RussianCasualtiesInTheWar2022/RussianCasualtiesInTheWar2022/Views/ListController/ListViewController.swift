//
//  ListViewController.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import UIKit

fileprivate struct Constant {
    static let minimumSpasing: CGFloat = 2
    static let numberOfItemsInRow: CGFloat = 7
    static let aspectRatio: CGFloat = 1.3
}

class ListViewController: UIViewController, Storybordable {
    
    let dataManager = DataManager.shared
    // MARK: - Types
    weak var coordinator: AppCoordinator?
    var category: Category? {
        didSet {}
    }
    var datasourse = [[String:AnyObject]]() {
        didSet { print(datasourse)}
    }
    // MARK: - Constants

    // MARK: - Public Properties

    // MARK: - Subview Properties

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
    
    // MARK: - UIViewController(*)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCollectionView.backgroundColor = .clear
        view.addSubview(listCollectionView)
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
        if let category = category {
            dataManager.getData(by: category) { result in
                switch result {
                case .success(let obj): print(obj[0])
                case .failure(let error): print(error)
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listCollectionView.frame = view.bounds
        setupCollectionView()
    }
    
    // MARK: - Public Methods

    // MARK: - Private Methods
    private func setupCollectionView() {
    
    }
  
}

//MARK: - UICollectionViewDatasourse
extension ListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                ListCollectionViewCell.id,
                                                for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        //cell.setupCell(with: )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = listCollectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderReusableView.id,
            for: indexPath) as! HeaderReusableView
        view.setupHeader()
        return view
    }
    
}

//MARK: - UICollectionViewDelegate
extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.bounds.size.width,
               height: 50)
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
