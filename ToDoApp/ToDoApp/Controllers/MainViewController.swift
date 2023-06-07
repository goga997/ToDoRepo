//
//  ViewController.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 08.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    var arrayElements = [ToDoElementModel]()
    
    private var subject = Subject()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleOrizonallStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let image = UIImage(systemName: "plus.circle")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        let button = UIButton()
        button.addTarget(self, action: #selector(addingAction), for: .touchUpInside)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newItemView: ToDosetNewItem = {
        let view = ToDosetNewItem(frame: .zero, subject: subject)
        view.isHidden = true
        
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpLayouts()
        mainTableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        self.arrayElements = DataBaseService.shared.getData()
    }
    
}

typealias MainViewControllerLayouts = MainViewController
extension MainViewControllerLayouts {
   private func setUpLayouts() {
        setUpVerticalStackViewLayouts()
        setUpTitleOrizontalStackViewLayouts()
        setUpLinesVerticalStackView()
        setUpAddButtonLayout()
       setUpNewItemViewLayout()
    }
    
   private func setUpVerticalStackViewLayouts() {
        self.view.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            verticalStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -220),
            verticalStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40)
        ])
    }
    
    private func setUpTitleOrizontalStackViewLayouts() {
        
        let line = UIView()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints = false
        let line2 = UIView()
        line2.backgroundColor = .white
        line2.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "To Do"
        label.font = UIFont(name: "Avenir Next Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        
        titleOrizonallStackView.addSubview(line)
        titleOrizonallStackView.addSubview(label)
        titleOrizonallStackView.addSubview(line2)
        
        self.verticalStackView.addSubview(titleOrizonallStackView)
        
        NSLayoutConstraint.activate([
            titleOrizonallStackView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            titleOrizonallStackView.centerXAnchor.constraint(equalTo: verticalStackView.centerXAnchor),
            titleOrizonallStackView.heightAnchor.constraint(equalTo: verticalStackView.heightAnchor, multiplier: 0.2),
            titleOrizonallStackView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            
            label.centerXAnchor.constraint(equalTo: titleOrizonallStackView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: titleOrizonallStackView.centerYAnchor),
            label.heightAnchor.constraint(equalTo: titleOrizonallStackView.heightAnchor, multiplier: 0.9),
            label.widthAnchor.constraint(equalTo: titleOrizonallStackView.widthAnchor, multiplier: 0.4),
            
            line.leadingAnchor.constraint(equalTo: titleOrizonallStackView.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: label.leadingAnchor),
            line.centerYAnchor.constraint(equalTo: titleOrizonallStackView.centerYAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            line2.trailingAnchor.constraint(equalTo: titleOrizonallStackView.trailingAnchor),
            line2.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            line2.centerYAnchor.constraint(equalTo: titleOrizonallStackView.centerYAnchor),
            line2.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setUpLinesVerticalStackView() {
   
        self.verticalStackView.addSubview(mainTableView)
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: titleOrizonallStackView.bottomAnchor),
            mainTableView.centerXAnchor.constraint(equalTo: verticalStackView.centerXAnchor),
            mainTableView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor),
        ])
    }
    
    private func setUpAddButtonLayout() {
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            addButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }
    
    private func setUpNewItemViewLayout() {
        self.view.addSubview(newItemView)
        NSLayoutConstraint.activate([
            newItemView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            newItemView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            newItemView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            newItemView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
}

typealias MainViewControllerAddingButtonDelegate = MainViewController
extension MainViewControllerAddingButtonDelegate {
    @objc private func addingAction() {
        self.newItemView.viewWillAppear()
        self.newItemView.isHidden = false
    }
}

typealias MainViewControllerTableViewDelegates = MainViewController
extension MainViewControllerTableViewDelegates: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.cellIdentifier, for: indexPath)  as? ToDoTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        let currentElement = arrayElements[indexPath.row]
        
        cell.setUpTitleLabel(title: currentElement.title)
        cell.setUpPriority(priority: currentElement.priority)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentElement = arrayElements[indexPath.row]
        
        let toDoElementDetailsViewController = ToDoElementDetailsViewController(curentElement: currentElement)
        self.navigationController?.pushViewController(toDoElementDetailsViewController, animated: true)
        
    }
    
}


