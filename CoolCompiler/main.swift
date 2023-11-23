//
//  main.swift
//  CoolCompliler
//
//  Created by Akash Madhu on 23/11/23.
//

import Foundation


func readSourceFile(filePath:String) throws ->[String]{
    
    let content = try String(contentsOfFile: filePath)
    let lines = content.components(separatedBy: .newlines)
    return lines
}

let arguments=CommandLine.arguments

if arguments.count > 1 {
    let filePath = arguments[1]
    print("File path: \(filePath)")
    do{
        let fileContents = try readSourceFile(filePath: filePath)
        for(lineNumber,line) in fileContents.enumerated(){
            print("Line \(lineNumber + 1): \(line)")
        }
        
    }
    catch{
        print("Error reading the source file: \(error)")
    }
    
    
    
} else {
    print("No file path provided.")
}
