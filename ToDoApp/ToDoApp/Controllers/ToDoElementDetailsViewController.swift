//
//  ToDoElementDetailsViewController.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 05.06.2023.
//

import UIKit

class ToDoElementDetailsViewController: UIViewController {
        
    private var toDoElementModel: ToDoElementModel? {
        didSet
        {
            transferData(element: toDoElementModel!)
        }
    }
    
    lazy var containerView: ToDoElementDetailsContainerView = {
        let view = ToDoElementDetailsContainerView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var completeButton: UIButton = {
        let image = UIImage(systemName: "xmark.bin")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        let button = UIButton()
        button.addTarget(self, action: #selector(completeAction), for: .touchUpInside)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var completeLabel: UILabel = {
       let label = UILabel()
        label.text = "Tap on the icon to mark the task as complited       ->"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(curentElement: ToDoElementModel) {
        super.init(nibName: nil, bundle: nil)
        self.toDoElementModel = curentElement
        transferData(element: curentElement)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setLayouts()
    }
    
    
    //De ce am bagat ??
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func completeAction() {
        print("completeAction")
    }
    
}

//MARK: - Layouts

extension ToDoElementDetailsViewController {
  private func setLayouts() {
        view.addSubview(containerView)
//      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Complete", style: .done, target: self, action: #selector(removeAction))
      NSLayoutConstraint.activate([
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
      ])
      
      view.addSubview(completeButton)
      NSLayoutConstraint.activate([
        completeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
        completeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
        completeButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.130),
        completeButton.widthAnchor.constraint(equalTo: completeButton.heightAnchor),
      ])
      
      view.addSubview(completeLabel)
      NSLayoutConstraint.activate([
        completeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
        completeLabel.trailingAnchor.constraint(equalTo: completeButton.leadingAnchor, constant: -10),
        completeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        completeLabel.heightAnchor.constraint(equalTo: completeButton.heightAnchor)
      ])
  }
  
//  @objc private func removeAction() {
//      print("tap")
//  }
    
}

typealias ToDoElementSetViewWithDetails = ToDoElementDetailsViewController
extension ToDoElementSetViewWithDetails {
    
    private func transferData(element: ToDoElementModel) {
        containerView.setData(element: element)
    }
    
}
