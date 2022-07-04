//
//  DataManager.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

//enum DataType {
//    case personnel
//    case equipment
//}

class DataManager {
    static let shared = DataManager()
    private init() { }
    
    func getData(by type: Category, completion: @escaping(Result<[[String:AnyObject]],CustomError>) -> Void){
        switch type {
        case .personnel:
           Bundle.main.jsonDataFromBundle(from: "russia_losses_personnel") { result in
               completion(result)
            }
        case .equipment:
            Bundle.main.jsonDataFromBundle(from: "russia_losses_equipment") { result in
                completion(result)
             }
        }
    }
}



extension Bundle {
    
    private func fixUnvalideJSONdata(_ data: Data) -> Data? {
        guard let str = String(bytes: data, encoding: .utf8) else { return nil}
        let newStr = str.replacingOccurrences(of: "NaN", with: "0")
        guard let fixData = newStr.data(using: .utf8) else {return nil}
        return fixData
    }
     
    func jsonDataFromBundle(from file: String,
                            completion: @escaping (Result<[[String:AnyObject]],CustomError>) -> Void ){
        guard let url = self.url(forResource: file, withExtension: "json") else {
            completion(.failure(.noFileInBundle))
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            completion(.failure(.noData))
            return
        }
        guard let fixData = fixUnvalideJSONdata(data) else {
            completion(.failure(.invalidDataType))
            return
        }
        do {
            let obj = try JSONSerialization.jsonObject(with: fixData, options: .fragmentsAllowed)
            guard let array = obj as? [[String: AnyObject]] else {return}
            completion(.success(array))
        } catch {
            completion(.failure(.serializationError))
        }
    }
}

