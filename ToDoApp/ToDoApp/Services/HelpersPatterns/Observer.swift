//
//  Observer.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 26.05.2023.


import Foundation


protocol Subscriber {
    func updateState(subject: Subject)
}

class Subject {
    private lazy var subscribers = [Subscriber]()

    var context = ToDoElementModel()

    func atach(subscriber: Subscriber) {
        subscribers.append(subscriber)
    }

    func notify() {
        subscribers.forEach({$0.updateState(subject: self)})
    }

    func modifyTitle(tittle: String) {
        context.title = tittle
        notify()
    }
    
    func modifyInformation(information: String) {
        context.information = information
        notify()
    }
    
    func modifyPriority(priority: ToDoElementPriorityEnums) {
        context.priority = priority
        notify()
    }
}

class ConcretSubscriber: Subscriber {

    func updateState(subject: Subject) {
        
    }

}


    















