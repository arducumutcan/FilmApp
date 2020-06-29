//
//  ApiClient.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Alamofire
import RxSwift

class ApiClient {
    
    static func searchFilms(params: [String: Any]) -> Observable<SearchFilmsResponse> {
        return request(APIRouter.searchFilms(params: params))
    }
    
    static func detailFilmPage(params: [String: Any]) -> Observable<FilmDetailPage> {
        return request(APIRouter.searchFilms(params: params))
    }

    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            
            let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let value):
                    
                    if((urlConvertible.urlRequest?.url?.absoluteString.contains("api/token"))! || (urlConvertible.urlRequest?.url?.absoluteString.contains("SocialLoginResult"))!){
                    }
                    
                    observer.onNext(value)
                    observer.onCompleted()
                    
                case .failure(let error):
                    print(response.response as Any)
                    print(response.data as Any)
                    print(response.description)
                    print(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
