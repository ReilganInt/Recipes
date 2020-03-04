//
//  SavesViewController.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SavesViewProtocol: SavesProtocol {
    func setPresenter(_ presenter: SavesPresenterProtocol)
    func reloadData(data: [Recipe])
}

final class SavesViewController: UICollectionViewController {
    private var presenter: SavesPresenterProtocol?
    
    private var data: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.didReceiveEvent(.viewDidLoad)
        collectionView?.backgroundColor = .white
        collectionView?.register(SavesLocalCell.self, forCellWithReuseIdentifier: SavesLocalCell.id)
    }
}

extension SavesViewController: SavesViewProtocol {
    func reloadData(data: [Recipe]) {
        DispatchQueue.main.async {
            self.data = data
            self.collectionView.reloadData()
        }
    }
    
    func setPresenter(_ presenter: SavesPresenterProtocol) {
        self.presenter = presenter
    }
}

extension SavesViewController: SavesProtocol {
  
}


extension SavesViewController {
    private func setupView() {
        addSubviews()
        setupNavigationItem()
        setupConstraints()
        setColors()
    }

    private func addSubviews() {
        
    }
    
    private func setupNavigationItem() {
        let newRecipeButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newRecipeButtonClicked))
        navigationItem.rightBarButtonItem = newRecipeButton
    }
    
    @objc private func newRecipeButtonClicked() {
        presenter?.didTriggerAction(.newRecipe)
    }
    
    private func setupConstraints() {
        
    }

    private func setColors() {
        view.backgroundColor = .white
        
    }
}

extension SavesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 200.0)
    }
}

extension SavesViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavesLocalCell.id, for: indexPath)
        
        guard let savesCell = cell as? SavesLocalCell else { return cell }
        savesCell.nameLabel.text = data[indexPath.row].name
        guard let imageData = data[indexPath.row].image else { return cell }
        savesCell.imageView.image = UIImage(data: imageData)
        savesCell.ratingView.text = String(data[indexPath.row].stars)
        return savesCell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension SavesViewController: NewRecipeDelegateProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.presenter?.didReceiveEvent(.reloadData)
        }
    }
}

