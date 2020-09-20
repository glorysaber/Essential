//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Stephen Kac on 9/6/20.
//

import Foundation

public struct FeedItem: Equatable {
	let id: UUID
	let description: String?
	let location: String?
	let imageURL: URL
}
