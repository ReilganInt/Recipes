//
//  BubbleTabBarController.swift
//  BubbleTabBar
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

open class BubbleTabBarController: UITabBarController {

    fileprivate var shouldSelectOnTabBar = true

    open override var selectedViewController: UIViewController? {
        willSet {
            guard shouldSelectOnTabBar,
                  let newValue = newValue else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? BubbleTabBar, let index = viewControllers?.firstIndex(of: newValue) else {
                return
            }
            tabBar.select(itemAt: index, animated: false)
        }
    }

    open override var selectedIndex: Int {
        willSet {
            guard shouldSelectOnTabBar else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? BubbleTabBar else {
                return
            }
            tabBar.select(itemAt: selectedIndex, animated: false)
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = BubbleTabBar()
//        tabBar.tintColor = Colors.Button.Background.defaultColor
        self.setValue(tabBar, forKey: "tabBar")
        configureViewControllers()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private var _barHeight: CGFloat = 74
    open var barHeight: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                return _barHeight + view.safeAreaInsets.bottom
            } else {
                return _barHeight
            }
        }
        set {
            _barHeight = newValue
            updateTabBarFrame()
        }
    }

    private func updateTabBarFrame() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = barHeight
        tabFrame.origin.y = self.view.frame.size.height - barHeight
        self.tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateTabBarFrame()
    }

    open override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
        }
        updateTabBarFrame()
    }

    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item) else {
            return
        }
        if let controller = viewControllers?[idx] {
            shouldSelectOnTabBar = false
            selectedIndex = idx
            delegate?.tabBarController?(self, didSelect: controller)
        }
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
