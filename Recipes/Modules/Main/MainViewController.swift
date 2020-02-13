//
//  MainViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        let savesNavigationController = createNavigationController(to: SavesViewController(), UIImage(named: "Icons/saves")!, "Saves")
        let recipesNavigationController = createNavigationController(to: RecipesViewController(), UIImage(named: "Icons/recipes")!, "Recipes")
        let groceryNavigationController = createNavigationController(to: GroceryViewController(), UIImage(named: "Icons/grocery")!, "Grocery")
        let moreNavigationController = createNavigationController(to: MoreViewController(), UIImage(named: "Icons/more")!, "More")
        viewControllers = [savesNavigationController, recipesNavigationController, groceryNavigationController, moreNavigationController]
    }
    
    private func createNavigationController(to viewController: UIViewController, _ image: UIImage, _ named: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = named
        navigationController.tabBarItem.image = resizeImage(image: image, targetSize: CGSize(width: 30.0, height: 30.0))
        return navigationController
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

    
}
