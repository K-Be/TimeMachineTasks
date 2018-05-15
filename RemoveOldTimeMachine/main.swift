//
//  main.swift
//  RemoveOldTimeMashine
//
//  Created by Andrew Romanov on 08/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation

func removeBackups(atPaths paths: Array<String>) {
	for str in paths {
		let executor = Executor("/usr/bin/xcrun", ["tmutil", "delete", str])
		do{
			let output = try executor.exec()
			print(output);
		}
		catch let exception {
			print("can't execute with exception: \(exception)");
		}
	}
	
}


let finder = BackupsFinder()
let backups = finder.findBackups()

print("finded backups:")
for path in backups {
	print(path.lastPathComponent);
}

if (CommandLine.argc > 1)
{
	let backupForRemoving : String = CommandLine.arguments[2]
	let index = backups.index { (path) -> Bool in
		let pathName = path.lastPathComponent
		let equal = pathName == backupForRemoving
		return equal;
	}
	
	guard let ind = index  else {
		print("can't find backup with name \(backupForRemoving)")
		exit(0)
	}
	
	removeBackups(atPaths: Array<String>(backups[0...ind]))
	print("done!")
}
else
{
	print("to remove backups. Run application with argument backup name")
	print("all backups before that will be removed (and inputted)")
}










