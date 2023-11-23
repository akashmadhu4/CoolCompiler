//
//  lexer.swift
//  CoolCompliler
//
//  Created by Akash Madhu on 23/11/23.
//

import Foundation

struct Token{
    let type:TokenType
    let value:String?
    let lineNumber:Int
}

enum TokenType{
    case identifier
    case keywords
    case op
    case integers
    case typeIdentifer
    case objectIdentifer
    case strings
    case whiteSpace
}
class Lexer {
    var input:String = ""
    var currentIndex:Int = 0
    
}

