//
//  News.swift
//  Mocking
//
//  Created by Benjamin Hall on 18/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

class News {
    var url: URL
    var stories = ""
    var error: Error?
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(using session: URLSessionProtocol = URLSession.shared, completionHandler: @escaping () -> Void) {
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            } else if let error = error {
                self.error = error
            }
            completionHandler()
        }
        
        task.resume()        
    }
}
