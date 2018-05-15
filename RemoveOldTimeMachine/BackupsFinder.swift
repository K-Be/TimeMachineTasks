//
//  BackupsFinder.swift
//  RemoveOldTimeMashine
//
//  Created by Andrew Romanov on 08/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation


struct BackupsFinder {
	init() {
	}
	
	public func findBackups() -> Array<String>{
		let executor = Executor("/usr/bin/xcrun", ["tmutil", "listbackups"]);
		let backups = (try? executor.exec().components(separatedBy: CharacterSet.newlines)) ?? [];
		return backups;
	}
}

