//
//  InternetConnectionManager.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import Alamofire

class InternetConnectionManager{
    class var isInternetConnection : Bool{
    
        guard let isReachable = NetworkReachabilityManager()?.isReachable else{
            return false
        } 
        
        return isReachable
    }
}
