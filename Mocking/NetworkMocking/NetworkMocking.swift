//
//  NetworkMocking.swift
//  NetworkMocking
//
//  Created by Benjamin Hall on 18/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import Mocking

typealias ResponseHandling = (Data?, URLResponse?, Error?) -> Void

class NetworkMocking: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
        Want to test three 4 things in the News class
        1. What was URL that was requested?
        2. Was a network request actually started?
        3. Did the request come back with certain data?
        4. Did the request come back with a specific error?
    */
    
    // 1. Checking requested URL
    func testNewsFetchLoadsCorrectURL() {
        class DataTaskMock: URLSessionDataTask {
            override func resume() { }
        }
        
        class URLSessionMock: URLSessionProtocol {
            var lastURL: URL?
            func dataTask(with url: URL, completionHandler: @escaping ResponseHandling) -> URLSessionDataTask {
                defer { completionHandler(nil, nil, nil) }
                lastURL = url
                return DataTaskMock()
            }
        }
        
        let url = URL(string: "https://www.apple.com/news-room/rss-feed.rss")!
        let sut = News(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories.")
        
        sut.fetch(using: session) {
            XCTAssertEqual(url, session.lastURL, "Fetch url \(url.absoluteString) does not match session url \(String(describing: session.lastURL?.absoluteString))")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

    // 2. Checking network test actually started (dataTast .resume)
    func testNewsFetchCallsResume() {
        class URLSessionMock: URLSessionProtocol {
            var dataTask: DataTaskMock?
            
            func dataTask(with url: URL, completionHandler: @escaping ResponseHandling) -> URLSessionDataTask {
                let newDataTask = DataTaskMock(completionHandler: completionHandler)
                dataTask = newDataTask
                return newDataTask
            }
        }
        
        class DataTaskMock: URLSessionDataTask {
            var completionHandler: ResponseHandling
            var numberOfCallsToResume = 0
            
            init(completionHandler: @escaping ResponseHandling) {
                self.completionHandler = completionHandler // stash away handler for later use
            }
            
            override func resume() {
                // log resume called
                numberOfCallsToResume += 1
                completionHandler(nil, nil, nil)
            }
        }
        
        let url = URL(string: "https://www.apple.com/news-room/rss-feeds.rss")!
        let sut = News(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories triggers resume().")
        
        sut.fetch(using: session) {
            XCTAssertTrue(session.dataTask?.numberOfCallsToResume ?? 0 > 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    // 3. Request returns with particular data
    func testNewsStoriesAreFetched() {
        class DataTaskMock: URLSessionDataTask {
            override func resume() { }
        }
        
        class URLSessionMock: URLSessionProtocol {
            var testData: Data?
            
            func dataTask(with url: URL, completionHandler: @escaping ResponseHandling) -> URLSessionDataTask {
                defer { completionHandler(testData, nil, nil) }
                return DataTaskMock()
            }
        }
        
        let sut = News(url: URL(string: "https://www.apple.com/news-room/rss-feeds.rss")!)
        let session = URLSessionMock()
        session.testData = Data("Hello World!".utf8)
        let expectation = XCTestExpectation(description: "Downloading news stories")
        
        sut.fetch(using: session) {
            XCTAssertEqual(sut.stories, "Hello World!")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    // 4. Check specific error occurs
    func testNewsFetchingReturnedError() {
        
        enum TestError: Error {
            case test
        }
        
        class DataTaskMock: URLSessionDataTask {
            override func resume() { }
        }
        
        class URLSessionMock: URLSessionProtocol {
            var testError: Error?
            
            func dataTask(with url: URL, completionHandler: @escaping ResponseHandling) -> URLSessionDataTask {
                defer { completionHandler(nil, nil, TestError.test) }
                return DataTaskMock()
            }
        }
        
        let sut = News(url: URL(string: "https://www.apple.com/news-room/rss-feeds.rss")!)
        let session = URLSessionMock()
        session.testError = TestError.test
        let expectation = XCTestExpectation(description: "Downloading news stories triggers error")
        
        sut.fetch(using: session) {
            XCTAssertNotNil(sut.error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
