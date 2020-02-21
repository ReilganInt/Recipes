//
//  NewRecipeViewController.swift
//  VIPER-Recipes
//
//  Created admin on 19.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import SnapKit
import CoreData

protocol NewRecipeViewControllerDelegate {
    func didAddNewRecipe()
}

class NewRecipeViewController: UIViewController, NewRecipeViewProtocol {

	var presenter: NewRecipePresenterProtocol?
    
    lazy var recipeImageView: UIImageView = {
        let iv =  UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "select").withRenderingMode(.alwaysOriginal)
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let imageButton: UIButton = UIButton()
    
    let nameTextField: UITextField = TextField()
    
    let timeButton: UIButton = UIButton()
    let degreeButton: UIButton = UIButton()
    let categoryButton: UIButton = UIButton()
    
    let pickerView: UIPickerView = UIPickerView()
    
    let descriptionTextField: UITextField = UITextField()
    
    override func loadView() {
        super.loadView()
        setup()
        
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveRecipe))
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel , target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = backButton
        view.backgroundColor = .white
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recipeImageView.snp.makeConstraints({ make in
            make.width.equalTo(view.bounds.width)
            make.height.equalTo(200)
            make.left.equalTo(0)
            make.top.equalTo(50)
        })
        
        nameTextField.snp.makeConstraints({ make in
            make.width.equalTo(view.bounds.width - 80)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(recipeImageView.snp.bottom)
        })
        
        imageButton.snp.makeConstraints({ make in
            make.width.equalTo(view.bounds.width)
            make.height.equalTo(200)
            make.left.equalTo(0)
            make.top.equalTo(50)
        })
        
        timeButton.snp.makeConstraints({ make in
            make.width.equalTo((view.bounds.width - 80) / 3)
            make.left.equalTo(40)
            make.top.equalTo(80)
        })
        degreeButton.snp.makeConstraints({ make in
            make.width.equalTo((view.bounds.width - 80) / 3)
            make.left.equalTo((view.bounds.width - 80) / 3)
            make.top.equalTo(80)
        })
        categoryButton.snp.makeConstraints({ make in
            make.width.equalTo((view.bounds.width - 80) / 3 * 2)
            make.left.equalTo((view.bounds.width - 80))
            make.top.equalTo(80)
        })
    }
    
    private func setup() {
        view.addSubview(recipeImageView)
        view.addSubview(nameTextField)
        view.addSubview(imageButton)
        view.addSubview(timeButton)
        view.addSubview(degreeButton)
        view.addSubview(categoryButton)
        setupTimeButton()
        setupDegreeButton()
        setupCategoryButton()
        setupImageButton()
        setupNameTextField()
        
    }
    
    private func setupTimeButton() {
        timeButton.backgroundColor = .green
    }
    
    private func setupDegreeButton() {
        degreeButton.backgroundColor = .red
    }
    
    private func setupCategoryButton() {
        categoryButton.backgroundColor = .blue
    }
    
    
    
    
    private func setupNameTextField() {
        nameTextField.placeholder = "Recipe name"
        
    }
    
    private func setupImageButton() {
        imageButton.backgroundColor = .clear
        imageButton.layer.cornerRadius = 50
        imageButton.layer.masksToBounds = true
        imageButton.addTarget(self, action: #selector(didSelectImage), for: .touchUpInside)
    }
    
    @objc private func didSelectImage() {
        showImagePickerControllerActionSheet()
    }
    
    @objc private func saveRecipe() {
        let name = self.nameTextField.text
        DataCoordinator.performBackgroundTask { (context) -> (Void) in
            let obj = Recipe(context: context)
            obj.name = name
            do {
                print(context.hasChanges)
                try context.save()
                print("saved changes")
            } catch {
                print("exception saving in background thread")
            }
        }
        // delegate.didAddNewRecipe() reload data
        dismiss(animated: true)
    }
    
    @objc private func back() {
        DataCoordinator.getAllRecipes { (result) in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        dismiss(animated: true)
    }

}


extension NewRecipeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { _ in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "Take from Camera", style: .default) { _ in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        AlertService.showAlert(style: .actionSheet, title: "Choose your image", message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            recipeImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            recipeImageView.image = originalImage
        }
        dismiss(animated: true)
        
    }
}