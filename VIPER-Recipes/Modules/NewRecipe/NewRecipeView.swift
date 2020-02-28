//
//  NewRecipeView.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol NewRecipeViewViewProtocol {
    func getRecipeImageView() -> UIImageView
    func getTimeCellButton() -> UITableViewCell
    func getDegreeCellButton() -> UITableViewCell
    func getPortionCellButton() -> UITableViewCell
    func getNameTextField() -> UITextField
}

protocol NewRecipeViewDelegate {
    func didChangeRecipeImageView()
    func didChangeTimePickerCell()
    func didChangeDegreePickerCell()
    func didChangePortionPickerCell()
}

final class NewRecipeView: UIView {
    
    var delegate: NewRecipeViewDelegate? = nil
    
    lazy var recipeImangeView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "qw").withRenderingMode(.alwaysOriginal)
        iv.layer.masksToBounds = true
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didChangeRecipeImageView))
        iv.addGestureRecognizer(tapGR)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private let containerView: UIScrollView = UIScrollView()
    
    private let nameTextField: UITextField = TextField()
    
    private let timePickerCellButton: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    private let degreePickerCellButton: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    private let portionPickerCellButton: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, timePickerCellButton, degreePickerCellButton, portionPickerCellButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
}

extension NewRecipeView: NewRecipeViewViewProtocol {
    func getNameTextField() -> UITextField {
        return nameTextField
    }

    func getRecipeImageView() -> UIImageView {
        return recipeImangeView
    }
    
    func getTimeCellButton() -> UITableViewCell {
        return timePickerCellButton
    }
    
    func getDegreeCellButton() -> UITableViewCell {
        return degreePickerCellButton
    }
    
    func getPortionCellButton() -> UITableViewCell {
        return portionPickerCellButton
    }
}

extension NewRecipeView {
  	private func setupView() {
        addSubviews()
        setupConstraints()
        setColors()
  	}

    private func addSubviews() {
        addContainerView()
        addRecipeImageView()
        addNameTexField()
        addTimePickerCellButton()
        addDegreePickerCellButton()
        addPortionPickerCellButton()
        addStackView()
    }
    
    private func setupConstraints() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        
        recipeImangeView.translatesAutoresizingMaskIntoConstraints = false
        recipeImangeView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        recipeImangeView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        recipeImangeView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        recipeImangeView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        recipeImangeView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -100).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: recipeImangeView.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }

  	private func setColors() {
        backgroundColor = .white
  	}
}

extension NewRecipeView {
    fileprivate func addContainerView() {
        addSubview(containerView)
    }
    
    fileprivate func addRecipeImageView() {
        containerView.addSubview(recipeImangeView)
        
    }
    
    fileprivate func addNameTexField() {
        nameTextField.placeholder = "Recipe name"
        nameTextField.layer.cornerRadius = 15
        nameTextField.returnKeyType = .next

    }
    
    fileprivate func addTimePickerCellButton() {
        timePickerCellButton.textLabel?.text = "time"
        timePickerCellButton.textLabel?.textColor = .white
        timePickerCellButton.detailTextLabel?.text = "15"
        timePickerCellButton.detailTextLabel?.textColor = .white
        timePickerCellButton.accessoryType = .disclosureIndicator
        timePickerCellButton.isHighlighted = false
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didChangeTimePickerCell))
        timePickerCellButton.addGestureRecognizer(tapGR)
        timePickerCellButton.backgroundColor = UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1)
        timePickerCellButton.layer.cornerRadius = 15
    }
    
    fileprivate func addDegreePickerCellButton() {
        degreePickerCellButton.textLabel?.text = "°C"
        degreePickerCellButton.textLabel?.textColor = .white
        degreePickerCellButton.detailTextLabel?.text = "50"
        degreePickerCellButton.detailTextLabel?.textColor = .white
        degreePickerCellButton.accessoryType = .disclosureIndicator
        degreePickerCellButton.isHighlighted = false
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didChangeDegreePickerCell))
        degreePickerCellButton.addGestureRecognizer(tapGR)
        degreePickerCellButton.backgroundColor = UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1)
        degreePickerCellButton.layer.cornerRadius = 15
    }
    
    fileprivate func addPortionPickerCellButton() {
        portionPickerCellButton.textLabel?.text = "Portion"
        portionPickerCellButton.textLabel?.textColor = .white
        portionPickerCellButton.detailTextLabel?.text = "1"
        portionPickerCellButton.detailTextLabel?.textColor = .white
        portionPickerCellButton.accessoryType = .disclosureIndicator
        portionPickerCellButton.isHighlighted = false
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didChangePortionPickerCell))
        portionPickerCellButton.addGestureRecognizer(tapGR)
        portionPickerCellButton.backgroundColor = UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1)
        portionPickerCellButton.layer.cornerRadius = 15
    }
    
    fileprivate func addStackView() {
        containerView.addSubview(stackView)
    }
    
}

extension NewRecipeView {
    
    @objc fileprivate func didChangeRecipeImageView() {
        delegate?.didChangeRecipeImageView()
    }
    
    @objc fileprivate func didChangeTimePickerCell() {
        delegate?.didChangeTimePickerCell()
    }
    
    @objc fileprivate func didChangeDegreePickerCell() {
        delegate?.didChangeDegreePickerCell()
    }
    
    @objc fileprivate func didChangePortionPickerCell() {
        delegate?.didChangePortionPickerCell()
    }
}

extension NewRecipeView {
    
}
