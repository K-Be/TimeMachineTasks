//
//  Executor.swift
//  RemoveOldTimeMachineBackup
//
//  Created by Andrew Romanov on 15/05/2018.
//  Copyright © 2018 Andrew Romanov. All rights reserved.
//

import Foundation


class Executor  {
	typealias Argument = String
	typealias Arguments = Array<String>
	
	public var path : String
	public var arguments : Arguments
	
	init(_ executablePath: String,_ arguments:Array<String> = Array<String>()){
		self.path = executablePath;
		self.arguments = arguments;
	}
	
	func exec() throws -> String {
		let proc = Process()
		proc.executableURL = URL(fileURLWithPath: path)
		proc.arguments = arguments;
		let readingPipe = Pipe()
		proc.standardOutput = readingPipe
		
		try proc.run()
		
		let file = readingPipe.fileHandleForReading
		let output = String(data: file.readDataToEndOfFile(), encoding: .utf8) ?? "";
		
		return output;
	}
	
}
