//
//  BackupsFinder.swift
//  RemoveOldTimeMashine
//
//  Created by Andrew Romanov on 08/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation


struct BackupsFinder {
	fileprivate var path : String
	
	init(path:String) {
		self.path = path;
	}
	
	public func findBackups() -> Array<String>{
		let manager = FileManager.default
		
		let content : Array<String> = try! manager.contentsOfDirectory(atPath: self.path)
	
		var files = Array<String>()
		
		for file in content
		{
			let fileURL = URL(fileURLWithPath: file)
			if (!fileURL.hasDirectoryPath && fileURL.pathExtension == "")
			{
				let name = fileURL.lastPathComponent
				if (validFileName(name: name))
				{
					let parentDirectory = URL(fileURLWithPath: self.path)
					let pathToFile = parentDirectory.appendingPathComponent(name)
					
					files.append(pathToFile.path)
				}
			}
		}
		
		files.sort { (path1, path2) -> Bool in
			let name1 = path1.lastPathComponent
			let name2 = path2.lastPathComponent
			
			let comparisonResult = name1.compare(name2, options: .numeric, range: nil, locale: nil)
			return comparisonResult == ComparisonResult.orderedAscending
		}
		
		return files
	}
	
	
	fileprivate func validFileName(name : String) -> Bool {
		return true;
	}
	
	
}

