//
//  BaseApiClient.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//


import Foundation
import Alamofire

open class BaseApiClient{ // allow to extend the class  - default is open
    fileprivate let BASE_URL = API.BASE_URL
    
    func requestApiWithoutHeaders(
        url : String ,
        method : HTTPMethod,
        params : Parameters,
        success : @escaping(Data) -> Void,
        failure : @escaping(String)-> Void){
        
        Alamofire.request(url, method: method, parameters: params, headers: [:]).responseJSON { response in
            switch response.result {
            case .success :
                success(response.data!)
            case .failure(let error) :
                debugPrint("\(error.localizedDescription)")
                failure(error.localizedDescription)
            }
        }
    }
    
    
    func requestApiWithHeaders(
        url : String,
        method : HTTPMethod,
        params : Parameters,
        success : @escaping(Data) -> Void,
        failure : @escaping(String)-> Void){
        
        let headers : HTTPHeaders = [
            : // " Authorization" : "Bearer \(UserDefaults.standard.string(forKey: USER_DEF_TOKEN) ?? "") "
        ]
        
        Alamofire.request(url, method: method, parameters: params, headers:headers).responseJSON { response in
            switch response.result {
            case .success :
                success(response.data!)
            case .failure(let error) :
                debugPrint("\(error.localizedDescription)")
                failure(error.localizedDescription)
            }
        }
    }
    
    func generateUrl(route : String) -> String {
        print(BASE_URL + route)
        return BASE_URL + route
    }
}

