//
//  BackupsOperator.swift
//  RemoveOldTimeMachineBackup
//
//  Created by Andrew Romanov on 15/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation


class BackupsOperator {

	public func removeBackups(inList backups: Array<String>) -> Void {
		for path in backups {
			let executor = Executor("/usr/bin/xcrun", ["tmutil", "delete", path])
			do{
				let output = try executor.exec()
				print(output);
			}
			catch let exception {
				print("can't execute with exception: \(exception)");
			}
		}
	}
	
}

