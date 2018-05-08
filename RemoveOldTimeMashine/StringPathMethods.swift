//
//  StringPathMethods.swift
//  RemoveOldTimeMashine
//
//  Created by Andrew Romanov on 08/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation


extension String {
	
	public var fileExtension : String {
		get {
			let ext = URL(fileURLWithPath: self).pathExtension
			return ext
		}
	}
	
	public var lastPathComponent : String {
		get {
			let component = URL(fileURLWithPath: self).lastPathComponent
			return component
		}
	}	
}
