//
//  Network.swift
//  Netflix Project
//
//  Created by Manimaran on 2/17/23.
//

import Foundation
import Alamofire


class Networking : NSObject{
    
    static let Sharednetwork = Networking()
    
    func callapi(url: String, params: [String:Any]? = nil, method:Method , complition: @escaping(Data? , Bool, String)->Void) {
   
        
        AF.request(url , method: method == .post ? .post : .get , parameters: params,encoding: JSONEncoding.default).responseData { resp in
            switch resp.result{
                
                    
            case .success(let datae):
                complition(datae,true,"Success")
            case .failure(_):
                complition(nil,false,"something went wrong")
            }
        }
        
    }
    
}

enum Method{
    
    case get, post
}

