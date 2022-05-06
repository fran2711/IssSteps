//
//  ApiManager.swift
//  ISS
//
//  Created by Francisco Lucena on 5/5/22.
//

import Foundation
import Alamofire

class ServerManager {
    
    static let shared = ServerManager()
    
    var manager: SessionManager

    init() {
        let configuration = URLSessionConfiguration.default
        manager = SessionManager(configuration: configuration)
    }
    
    // MARK: - Requests

    func publicRequest(_ url: URLConvertible,
                       method: HTTPMethod = .get,
                       parameters: Parameters? = nil,
                       encoding: ParameterEncoding = JSONEncoding.default,
                       headers: HTTPHeaders? = nil,
                       success: ((DataResponse<Data>) -> ())? = nil,
                       failure: ((Error) -> ())? = nil) {
        
        var httpHeaders = headers ?? [:]
        httpHeaders["Accept"] = "*/*"
        httpHeaders["Content-Type"] = "application/json"
        
        request(url, method: method,
                parameters: parameters,
                encoding: encoding,
                headers: httpHeaders,
                success: success,
                failure: failure)
        
    }
    
    func request(_ url: URLConvertible,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = JSONEncoding.default,
                 headers: HTTPHeaders? = nil,
                 success: ((DataResponse<Data>) -> ())? = nil,
                 failure: ((Error) -> ())? = nil) {
        manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    success?(dataResponse)
                case .failure(let error):
                    failure?(error)
                }
            }
    }

}
