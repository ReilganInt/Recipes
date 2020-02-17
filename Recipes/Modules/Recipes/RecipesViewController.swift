//
//  RecipesViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Recipes"
        addControl()
    }
    
    
    func addControl() {
        let titles = ["Breakfast", "Lunch", "Dinner", "Popular"]
        let segmentedControl = CustomSegmentedControl(frame: CGRect(x: 0, y: 150, width: view.bounds.width, height: 25))
        segmentedControl.delegate = self
        segmentedControl.setSegmentItems(titles)
        
        segmentedControl.sliderBackgroundColor = .systemFill
        segmentedControl.segmentsBackgroundColor = .systemTeal
        
        view.addSubview(segmentedControl)
    }

}

extension RecipesViewController: CustomSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        print("Selected index: \(segmentIndex)")
    }
    
    
}

extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
    
    
}
