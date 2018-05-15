//
//  main.swift
//  RemoveOldTimeMashine
//
//  Created by Andrew Romanov on 08/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation

guard (CommandLine.argc > 1) else
{
	print("should add path to direcotry");
	exit(1);
}


func removeBackups(atPaths paths: Array<String>) {
	for str in paths {
		let proc = Process()
		proc.executableURL = URL(fileURLWithPath: "/usr/bin/xcrun")
		proc.arguments = ["tmutil", "delete", str];
		let readingPipe = Pipe()
		proc.standardOutput = readingPipe
		do{
			try proc.run()
		}
		catch let exept {
			print("exception \(exept)")
		}
		
		let file = readingPipe.fileHandleForReading
		let string = String(data: file.readDataToEndOfFile(), encoding: .utf8);
		print(string ?? "");
		
	}
	
}


let pathToDirectory = CommandLine.arguments[1]
let finder = BackupsFinder(path: pathToDirectory)
let backups = finder.findBackups()

print("finded bachups:")
for path in backups {
	print(path.lastPathComponent);
}

if (CommandLine.argc > 2)
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
	print("to remove backups. Run application with second argument backup name")
	print("all backups before will be removed (and inputted)")
}










