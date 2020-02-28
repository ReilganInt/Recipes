////
////  SavesViewController.swift
////  VIPER-Recipes
////
////  Created admin on 18.02.2020.
////  Copyright © 2020 Rinat Kutuev. All rights reserved.
////
////  Template generated by Juanpe Catalán @JuanpeCMiOS
////
//
//import UIKit
//import SnapKit
//import CoreData
//
//class SavesViewController: UICollectionViewController {
//
//    var dataCache: [Recipe] = [] {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
//    var presenter: SavesPresenterProtocol?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Saves"
//
//        DataCoordinator.getAllRecipes() { result in
//            switch result {
//            case .failure(let error):
//                print(error.localizedDescription)
//            case .success(let recipes):
//                self.dataCache = recipes
//                self.collectionView.reloadData()
//            }
//        }
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewRecipe(sender:)))
//        addButton.tintColor = .black
//        navigationItem.rightBarButtonItem = addButton
//        navigationController?.navigationBar.prefersLargeTitles = true
//        collectionView?.backgroundColor = .white
//        collectionView?.register(SavesLocalCell.self, forCellWithReuseIdentifier: SavesLocalCell.id)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavesLocalCell.id, for: indexPath)
//        guard let savesCell = cell as? SavesLocalCell else { return cell }
//        savesCell.nameLabel.text = dataCache[indexPath.row].name
//        guard let imageData = dataCache[indexPath.row].image else { return cell }
//        savesCell.imageView.image = UIImage(data: imageData)
//        savesCell.ratingView.text = String(dataCache[indexPath.row].stars)
//        return cell
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        dataCache.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//
//    @objc private func addNewRecipe(sender: UIBarButtonItem) {
//        let vc = NewRecipeWireframe.makeViewController(delegate: self)
//        let nc = UINavigationController(rootViewController: vc)
//        nc.modalPresentationStyle = .overFullScreen
//        present(nc, animated: true)
//    }
//
//
//
//}
//
//extension SavesViewController: NewRecipeDelegateProtocol {
//
//}
//
//extension SavesViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width - 20, height: 200.0)
//    }
//}
//
//extension SavesViewController: SavesViewProtocol {
//
//}
//
////extension SavesViewController: NewRecipeViewControllerDelegate {
////    func didAddNewRecipe() {
////        collectionView.reloadData()
////    }
////
////}
