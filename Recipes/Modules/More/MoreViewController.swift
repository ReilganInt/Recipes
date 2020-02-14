//
//  MoreViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import Firebase

class MoreViewController: UIViewController {
    
    var fluidCardView = FluidCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logoutButtonClicked))
        configureFluidCard()
        view.addSubview(fluidCardView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fluidCardView.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
        })
    }
    
    private func configureFluidCard() {
        fluidCardView = FluidCardView()
        configureTopView()
        configureBottomView()
    }
    
    private func configureTopView() {
        let topNib = UINib(nibName: "TopView", bundle: nil)
        let topView = topNib.instantiate(withOwner: self, options: nil).first as! UIView

        fluidCardView.topContentView = topView
    }
    
    private func configureBottomView() {
        let bottomNib = UINib(nibName: "BottomView", bundle: nil)
        let bottomView = bottomNib.instantiate(withOwner: self, options: nil).first as! UIView

        fluidCardView.bottomContentView = bottomView
    }
    
    @objc private func logoutButtonClicked() {
        let alertController = UIAlertController(title: "Logout", message: "Do you realy want to exit?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "EXIT", style: .destructive, handler: { action in
            
            do {
                try Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
            
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "UserUID")
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        alertController.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
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
