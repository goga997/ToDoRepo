//
//  ToDoElementModel.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 24.05.2023.
//

import Foundation

struct ToDoElementModel: Codable {
    var title: String = ""
    var information: String = ""
    var priority: ToDoElementPriorityEnums = .low

}


enum ToDoElementPriorityEnums: Codable {
    case low
    case medium
    case high
}

//class ToDoElementModel: NSObject, Codable {
    
//    init(title: String, information: String, priority: ToDoElementPriorityEnums) {
//        self.title = title
//        self.information = information
//        self.priority = priority
//    }
//
//    //acest initializator se apeleaza cand este nevoie sa decodam datele noastre
//    required init?(coder: NSCoder) {
//
//        if let title = coder.decodeObject(forKey: "title") as? String {
//            self.title = title
//        }
//        else
//        {
//            self.title = ""
//        }
//
//        if let information = coder.decodeObject(forKey: "information") as? String {
//            self.information = information
//        }
//        else
//        {
//            self.information = ""
//        }
//
//        if let priority = coder.decodeObject(forKey: "priority") as? ToDoElementPriorityEnums {
//            self.priority = priority
//        }
//        else
//        {
//            self.priority = .low
//        }
//
//    }
//
//    // functia care raspunde de pseudoPrelucrarea datelor ca sa poata fie puse in UserDefaults
//    func encode(with coder: NSCoder) {
//        coder.encode(self.title, forKey: "title")
//        coder.encode(self.information, forKey: "information")
//        coder.encode(self.priority, forKey: "priority")
//    }
//}

