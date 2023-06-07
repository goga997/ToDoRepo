//
//  ToDoView.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 10.05.2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    private var circleBorderColor: UIColor! {
        didSet
        {
            self.circleView.layer.borderColor = circleBorderColor.cgColor
        }
    }

    private var circleBackgroundColor: UIColor! {
        didSet
        {
            self.circleView.backgroundColor = circleBackgroundColor
        }
    }
    static let cellIdentifier = "cellIdentifier"
    
    lazy var circleView: UIView = {
        let view = UIView()
        
        view.layer.borderColor = circleBorderColor.cgColor
        view.backgroundColor = circleBackgroundColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.text = "Information"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpPriority(priority: .low)
        setUpView()
        
    }
    
    private func setUpView() {
        setUpCircleViewLayOut()
        setUpInfoText()
        setUpButtonLayout()
    }
    
    private func setUpCircleViewLayOut() {
        self.addSubview(circleView)
        
        NSLayoutConstraint.activate([
            circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.075),
            circleView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.075)
        ])
        
    }
    
    private func setUpInfoText() {
        self.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            infoLabel.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    private func setUpButtonLayout() {
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.heightAnchor.constraint(equalTo: self.heightAnchor),
            button.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}

extension ToDoTableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
    
        circleView.layer.cornerRadius = circleView.frame.size.height / 2
        circleView.layer.borderWidth = 3
    }
}

typealias ToDoViewFunctionality = ToDoTableViewCell
extension ToDoViewFunctionality {
     @objc private func onTap() {
         
         if circleView.backgroundColor == circleBorderColor {
             circleView.layer.borderColor = circleBorderColor.cgColor
             circleView.backgroundColor = circleBackgroundColor
         } else {
             circleView.backgroundColor = circleBorderColor
         }
     }
    
 }

extension ToDoTableViewCell {
    func setUpTitleLabel(title: String) {
        self.infoLabel.text = title
    }
    
    func setUpPriority(priority: ToDoElementPriorityEnums) {
        switch priority {
        case .low :
            circleBorderColor = .green
            circleBackgroundColor = .green
        case .medium :
            circleBackgroundColor = .yellow
            circleBorderColor = .yellow
        case .high :
            circleBackgroundColor = .red
            circleBorderColor = .red
        }
    }
}


    


