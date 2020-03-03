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
}

final class SavesViewController: UICollectionViewController {
    private var presenter: SavesPresenterProtocol?

    private lazy var rootView: (UIView & SavesViewViewProtocol) = {
        let view = SavesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.didReceiveEvent(.viewDidLoad)
    }
}

extension SavesViewController: SavesViewProtocol {
    func setPresenter(_ presenter: SavesPresenterProtocol) {
        self.presenter = presenter
    }
}

extension SavesViewController: SavesProtocol {
  
}


extension SavesViewController {
    private func setupView() {
        addSubviews()
        setupConstraints()
        setColors()
    }

    private func addSubviews() {
        view.addSubview(rootView)
    }
    
    private func setupConstraints() {
        rootView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func setColors() {
        view.backgroundColor = .white
    }
}

