//
//  DataBaseService.swift
//  FirstApp(Vlad)
//
//  Created by Grigore on 24.05.2023.
//

import Foundation

class DataBaseService {
    //MARK: - Properties
    
    static let shared = DataBaseService()
    
    private var dataContainer: [ToDoElementModel]
    
    //MARK: - Initialization
    
    private init() {
        self.dataContainer = []
    }
    
    //MARK: - Methods
    
    func addData(data: ToDoElementModel) {
        dataContainer.append(data)
        let result = saveData()
        
        if result {
            print("Data saved succesfullly")
        }
        else
        {
            print("Data failled to save")
        }
    }
    
    func getData() -> [ToDoElementModel] {
        
        guard let decodedData = UserDefaults.standard.data(forKey: "dataContainer") else { return [] }
        
        let decoder = JSONDecoder()
        
        do {
            let finalDataDecoded = try decoder.decode([ToDoElementModel].self, from: decodedData)
        
            return finalDataDecoded
            
        } catch( let error ) {
            print(error)
        }
        
        return []
    }
    
    
    func saveData() -> Bool {
        let temporarContainer = dataContainer
        let userDefaults = UserDefaults.standard
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(temporarContainer)
            userDefaults.set(encodedData, forKey: "dataContainer")
        } catch( let error ) {
            print(error)
        }
    
        return userDefaults.synchronize()
        
    }
}



