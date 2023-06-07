//
//  ToDoElementDetailsContainerView.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 05.06.2023.
//

import UIKit

class ToDoElementDetailsContainerView: UIView {
    
    lazy var title: UILabel = {
       let label = UILabel()
        label.backgroundColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 25)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = .black
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayouts()
    }
    
}

//MARK: - Layouts

extension ToDoElementDetailsContainerView {
    
  private func setLayouts() {
      setTitleLAyouts()
      setTextViewLAyouts()
      
    }
    
    private func setTitleLAyouts() {
        self.addSubview(title)
      NSLayoutConstraint.activate([
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        title.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
        title.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
    ])
    }
    
    private func setTextViewLAyouts() {
        self.addSubview(textView)
      NSLayoutConstraint.activate([
        textView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        textView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        textView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
        textView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
    ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        
        title.layer.cornerRadius = 15
        title.layer.borderWidth = 1

        
        textView.layer.cornerRadius = 15
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.white.cgColor
    }
}

typealias ToDoElementDetailsContainerViewSetData = ToDoElementDetailsContainerView
extension ToDoElementDetailsContainerViewSetData {
    
     func setData(element: ToDoElementModel) {
        title.text = element.title
        textView.text = element.information

        switch element.priority {
        case .low:
            title.layer.borderColor = UIColor.green.cgColor
            title.textColor = .green
        case .medium:
            title.layer.borderColor = UIColor.yellow.cgColor
            title.textColor = .yellow
        case .high:
            title.layer.borderColor = UIColor.red.cgColor
            title.textColor = .red
        }
    }
    
}
