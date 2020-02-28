//
//  NewRecipeViewController.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol NewRecipeViewProtocol: NewRecipeProtocol {
    func setPresenter(_ presenter: NewRecipePresenterProtocol)
}

final class NewRecipeViewController: UIViewController {
    private var presenter: NewRecipePresenterProtocol?

    private lazy var rootView: (UIView & NewRecipeViewViewProtocol) = {
        let view = NewRecipeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private var pickerArray: [String] = []
    private var currentPicker: NewRecipePicker? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        presenter?.didReceiveEvent(.viewDidLoad)
    }
}

extension NewRecipeViewController: NewRecipeViewProtocol {
    func setPresenter(_ presenter: NewRecipePresenterProtocol) {
        self.presenter = presenter
    }
}

extension NewRecipeViewController: NewRecipeProtocol {
  
}

extension NewRecipeViewController {
    
    private func setupNavigationBar() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didSave))
        saveButton.tintColor = .white
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel , target: self, action: #selector(didBack))
        backButton.tintColor = .white
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = backButton
        
    }
    
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
        navigationController?.navigationBar.barTintColor = UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
    }
}

extension NewRecipeViewController: NewRecipeViewDelegate {
    func didChangeTimePickerCell() {
        showPickerController(for: .time)
    }
    
    func didChangeDegreePickerCell() {
        showPickerController(for: .degree)
    }
    
    func didChangePortionPickerCell() {
        showPickerController(for: .portion)
    }
    
    func didChangeRecipeImageView() {
        showImagePickerControllerActionSheet()
    }
}

extension NewRecipeViewController {
    @objc fileprivate func didSave() {
        guard let name = rootView.getNameTextField().text else { return
            // throw
        }
        guard let imageData = rootView.getRecipeImageView().image?.pngData() else { return
            // throw
        }
        DataCoordinator.performBackgroundTask { (context) -> (Void) in
            let obj = Recipe(context: context)
            obj.name = name
            obj.image = imageData
            obj.stars = Int32.random(in: 0..<5)
            do {
                print(context.hasChanges)
                try context.save()
                print("saved changes")
            } catch {
                print("exception saving in background thread")
            }
        }
        dismiss(animated: true) {
            // Send alert to reload CollectionView
        }
    }
    
    @objc fileprivate func didBack() {
        dismiss(animated: true, completion: nil)
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
            let iv = rootView.getRecipeImageView()
            iv.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let iv = rootView.getRecipeImageView()
            iv.image = originalImage
        }
        dismiss(animated: true)

    }
}

extension NewRecipeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch currentPicker {
        case .time:
            let cellButton = rootView.getTimeCellButton()
            cellButton.detailTextLabel?.text = pickerArray[row]
        case .degree:
            let cellButton = rootView.getDegreeCellButton()
            cellButton.detailTextLabel?.text = pickerArray[row]
        case .portion:
            let cellButton = rootView.getPortionCellButton()
            cellButton.detailTextLabel?.text = pickerArray[row]
        case .none:
            break
        }
    }

    func showPickerController(for type: NewRecipePicker) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self

        switch type {
        case .time:
            pickerArray = []
            for value in 15...300 {
                if value % 5 == 0 {
                    pickerArray.append(String(value))
                }
            }
            AlertService.showPicker(style: .actionSheet, title: "Change time", message: "", actions: [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], pickerView: pickerView, completion: {
                self.currentPicker = .time
            })
        case .degree:
            pickerArray = []
            for value in 50...300 {
                if value % 10 == 0 {
                    pickerArray.append(String(value))
                }
            }
            AlertService.showPicker(style: .actionSheet, title: "Change degree", message: "", actions: [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], pickerView: pickerView, completion: {
                self.currentPicker = .degree
            })
        case .portion:
            pickerArray = []
            for value in 1...15 {
                pickerArray.append(String(value))
            }
            AlertService.showPicker(style: .actionSheet, title: "Change portions", message: "", actions: [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], pickerView: pickerView, completion: {
                self.currentPicker = .portion
            })

        }
    }
}

