//
//  ColorButtonChoose.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 19.05.2023.
//

import UIKit

class ColorButtonChoose: UIView {
    
    private var subject: Subject
    
    lazy var buttonsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var lowPriorityButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Low", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 21)
        button.isSelected = true
        button.addTarget(self, action: #selector(lowPriorityButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mediumPriorityButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Medium", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 21)
        button.isSelected = false
        button.addTarget(self, action: #selector(mediumPriorityButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var highPriorityButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("High", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 21)
        button.isSelected = false
        button.addTarget(self, action: #selector(highPriorityButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        self.subject = Subject()
        super.init(frame: frame)
        setUpViewLayout()
    }
    
    required init?(coder: NSCoder) {
        self.subject = Subject()
        super.init(coder: coder)
        setUpViewLayout()
    }
    
    init(frame: CGRect, subject: Subject) {
        self.subject = subject
        super.init(frame: frame)
        setUpViewLayout()
    }
    
    
    //MARK: - Layouts
    
    private func setUpViewLayout() {
        setUpStackViewLayout()
    }
    
    private func setUpStackViewLayout() {
        buttonsStackView.addArrangedSubview(lowPriorityButton)
        buttonsStackView.addArrangedSubview(mediumPriorityButton)
        buttonsStackView.addArrangedSubview(highPriorityButton)
        
        self.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}


//MARK: - Functionality

typealias ColorButtonChooseFunctionality = ColorButtonChoose
extension ColorButtonChooseFunctionality {
    @objc private func highPriorityButtonTapped() {
        highPriorityButton.layer.opacity = 1
        highPriorityButton.isSelected = true
        
        lowPriorityButton.layer.opacity = 0.5
        lowPriorityButton.isSelected = false
        
        mediumPriorityButton.layer.opacity = 0.5
        mediumPriorityButton.isSelected = false
        
        subject.modifyPriority(priority: .high)
    }
    
    @objc private func mediumPriorityButtonTapped() {
        highPriorityButton.layer.opacity = 0.5
        highPriorityButton.isSelected = false
        
        lowPriorityButton.layer.opacity = 0.5
        lowPriorityButton.isSelected = false
        
        mediumPriorityButton.layer.opacity = 1
        mediumPriorityButton.isSelected = true
        
        subject.modifyPriority(priority: .medium)

    }
    
    @objc private func lowPriorityButtonTapped() {
        highPriorityButton.layer.opacity = 0.5
        highPriorityButton.isSelected = false
        
        lowPriorityButton.layer.opacity = 1
        lowPriorityButton.isSelected = true
        
        mediumPriorityButton.layer.opacity = 0.5
        mediumPriorityButton.isSelected = false
        
        subject.modifyPriority(priority: .low)
    }
}
    

    //MARK: - Layout Subview

extension ColorButtonChoose {
    override func layoutSubviews() {
        super.layoutSubviews()
    
        lowPriorityButton.layer.borderColor = UIColor.black.cgColor
        mediumPriorityButton.layer.borderColor = UIColor.black.cgColor
        highPriorityButton.layer.borderColor = UIColor.black.cgColor
        
        mediumPriorityButton.layer.opacity = 0.5
        highPriorityButton.layer.opacity = 0.5
        
//        lowPriorityButton.layer.borderWidth = 1
        mediumPriorityButton.layer.borderWidth = 1.5
//        highPriorityButton.layer.borderWidth = 1
    }
}
