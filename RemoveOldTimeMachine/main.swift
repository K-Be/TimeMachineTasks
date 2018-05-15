//
//  main.swift
//  RemoveOldTimeMashine
//
//  Created by Andrew Romanov on 08/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation


let finder = BackupsFinder()
let backups = finder.findBackups()

print("finded backups:")
for path in backups {
	print(path.lastPathComponent);
}

guard CommandLine.argc > 1 else {
	print("to remove backups. Run application with argument backup name")
	print("all backups before that will be removed (and inputted)")
	exit(0)
}


let backupForRemoving : String = CommandLine.arguments[1]
let index = backups.index { (path) -> Bool in
	let pathName = path.lastPathComponent
	let equal = pathName == backupForRemoving
	return equal;
}

guard let ind = index  else {
	print("can't find backup with name \(backupForRemoving)")
	exit(0)
}

let backupsOperator = BackupsOperator()
backupsOperator.removeBackups(inList: Array<String>(backups[0...ind]));
print("done!")
exit(0)











