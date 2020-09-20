//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Stephen Kac on 9/20/20.
//

import Foundation

public enum HTTPClientResult {
	case success(Data, HTTPURLResponse)
	case failure(Error)
}

public protocol HTTPClient {
	func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
