//
//  FirabaseManager.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore

class FireBaseManager{
    
    private static let companyName = "companyName"
    
    class func setupRemoteConfigDefaults(){
        let defaultValues = [
            companyName : "" as NSObject
        ]
        RemoteConfig.remoteConfig().setDefaults(defaultValues)
    }
    
    class func logAnalytics(name : String , parameters : [String : Any]?){
        Analytics.logEvent(name, parameters: parameters)
    }
    
    class func fetchRemoteConfig(closure : @escaping (String)->()){
        
        RemoteConfig.remoteConfig().fetch {(status, error) in
            guard error == nil else{
                print("Firebase remoteconfig error: \(String(describing: error))")
                return
            }
            RemoteConfig.remoteConfig().activateFetched()
            
            let companyString = RemoteConfig.remoteConfig().configValue(forKey: companyName).stringValue ?? ""
            closure(companyString)
        }
    }
}

