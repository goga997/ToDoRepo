//
//  toDosetNewItem.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 16.05.2023.
//

import UIKit

class ToDosetNewItem: UIView {
    
    private var subject: Subject
    
    private var keyBoardIsShown = false
    
    private var isValid = false
    
    private var toDoElementModel: ToDoElementModel!
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleTextField: UITextField = {
        let title = UITextField()
        title.text = "Set title..."
        title.textColor = .white
        title.font = UIFont(name: "Avenir Next Bold", size: 20)
        title.textAlignment = .center
        
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var closeButton: UIButton = {
        let image = UIImage(systemName: "xmark.circle")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        let button = UIButton()
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Type here..."
        textView.font = UIFont(name: "Avenir Next", size: 18)
        textView.textColor = .lightGray
        textView.backgroundColor = .black
        textView.delegate = self

        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var buttonsStackView: ColorButtonChoose = {
        let view = ColorButtonChoose(frame: .zero, subject: subject)
        
        view.layer.masksToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var priorityLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Priority"
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 23)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        button.backgroundColor = .black
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        self.subject = Subject()
        super.init(frame: frame)
        setUpViewLayOuts()
    }
    
    required init?(coder: NSCoder) {
        self.subject = Subject()
        super.init(coder: coder)
        setUpViewLayOuts()
    }
    
    init(frame: CGRect, subject: Subject) {
        self.subject = subject
        super.init(frame: frame)
        setUpViewLayOuts()
    }
}

    //MARK: - LAYOUTS

typealias ToDosetNewItemLayouts = ToDosetNewItem
extension ToDosetNewItemLayouts {
   private func setUpViewLayOuts() {
       setMainView()
       setUpTitleTextFieldLayout()
       setUpCloseButtonLayouts()
       setDescriptionTExtViewLayouts()
       setUpButtonsViewLayout()
       setPriorityLabelLayout()
       setSaveButtonLayouts()
    }
    
   private func setMainView() {
        self.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            mainView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            mainView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
            
        ])
    }
    
    private func setUpTitleTextFieldLayout() {
        mainView.addSubview(titleTextField)
        
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 25),
            titleTextField.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1),
            titleTextField.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func setUpCloseButtonLayouts() {
        self.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            closeButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor)
        ])
    }
    
    private func setDescriptionTExtViewLayouts() {
        mainView.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30),
            descriptionTextView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 50),
            descriptionTextView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -50),
            descriptionTextView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -30)
        ])
    }
    
    private func setUpButtonsViewLayout() {
        self.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 80),
            buttonsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonsStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.075),
            buttonsStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor)
        ])
    }
    
    private func setPriorityLabelLayout() {
        self.addSubview(priorityLabel)
        
        NSLayoutConstraint.activate([
            priorityLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -10),
            priorityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            priorityLabel.heightAnchor.constraint(equalTo: buttonsStackView.heightAnchor, multiplier: 0.3),
            priorityLabel.widthAnchor.constraint(equalTo: buttonsStackView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func setSaveButtonLayouts() {
        self.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            saveButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.075),
            saveButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
}


    //MARK: - Functionality

typealias ToDoSetNewItemFunctionality = ToDosetNewItem
extension ToDoSetNewItemFunctionality {
    
    @objc private func closeAction() {
        viewWillDisappear()
                
        self.isHidden = true
    }
    
    @objc private func keyboardWillShow() {
        keyBoardIsShown = true
        self.frame.origin.y -= 200
    }
    
    @objc private func keyboardWillHide() {
        if keyBoardIsShown {
            keyBoardIsShown = false
            self.frame.origin.y += 200
        }
        self.endEditing(true)
    }
    
    @objc private func saveAction() {
        print("save")
        self.endEditing(true)
        
        guard let title = titleTextField.text else { return }
        guard let description = descriptionTextView.text else { return }
        subject.modifyTitle(tittle: title)
        subject.modifyInformation(information: description)
//        let toDoElementModel = ToDoElementModel(title: title, information: descriptionTextView.text, priority: .low)
        DataBaseService.shared.addData(data: subject.context)

    }
}

//MARK: -  Layout Subview

extension ToDosetNewItem {
    override func layoutSubviews() {
        super.layoutSubviews()
    
        mainView.layer.cornerRadius = mainView.frame.size.height / 10
        buttonsStackView.layer.cornerRadius = mainView.frame.size.height / 15
        buttonsStackView.layer.borderWidth = 1.5
        
        saveButton.layer.cornerRadius = 10
        if saveButton.isEnabled == true {
            saveButton.layer.opacity = 1
        } else {
            saveButton.layer.opacity = 0.5
        }
        
        titleTextField.layer.borderColor = UIColor.white.cgColor
        titleTextField.layer.cornerRadius = 10
        titleTextField.layer.borderWidth = 1
    }
    
}

//MARK: - Notification Center for Keyboard
extension ToDosetNewItem {
    func viewWillAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         
         let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
         self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func viewWillDisappear() {
        NotificationCenter.default.removeObserver(self)
        
        guard let parrentController = self.findViewController() as? MainViewController else {
            print("There is no result of Controller")
            return
        }
        parrentController.arrayElements = DataBaseService.shared.getData()
        
        parrentController.mainTableView.reloadData()
    }
}


//MARK: - TextView Delegates

typealias ToDosetNewItemTextViewDelegate = ToDosetNewItem
extension  ToDosetNewItemTextViewDelegate: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        //        print("edit")
        if textView.text == "Type here..." {
            textView.text = ""
            textView.textColor = .white
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //        print("endEditing")
        
        if textView.text.count > 4 {
            self.saveButton.isEnabled = true
            saveButton.layer.opacity = 1
        } else {
            self.saveButton.isEnabled = false
            saveButton.layer.opacity = 0.5
        }
        
        if textView.text.count < 1 {
            textView.text = "Type here..."
            textView.textColor = .lightGray
        }
    }
    
}



//typealias txtFieldDeleg = ToDosetNewItem
//extension  txtFieldDeleg: UITextFieldDelegate {
//
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField.text?.count ?? <#default value#> > 4 {
//            self.saveButton.isEnabled = true
//            saveButton.layer.opacity = 1
//        } else {
//            self.saveButton.isEnabled = false
//            saveButton.layer.opacity = 0.5
//        }
//    }
//}
//
