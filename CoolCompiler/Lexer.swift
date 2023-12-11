import Foundation



let keywords: Set<String>=["class","else","false","fi","if","in","inherits","isvoid","let","loop","pool","then","while","case","esac","new","of","not","true"]


struct Token{
    let type:TokenType
    let value:String
    let lineNumber:Int
}

enum TokenType{
    case identifier
    case integers
    case strings
    case keyword
    case op
    case delimeters
    case eof
}



class Lexer {
    var currentLine:Int
    var lastChar:Character?
    
    init() {
        self.currentLine=1;
        self.lastChar=" "
    }
    
    func getNextToken() ->Token?{
        
        
        if(lastChar!.isNewline){
            currentLine+=1
            lastChar=getChar()
        }
        
        //skip any white space
        while lastChar!.isWhitespace {
            lastChar=getChar()
            if(lastChar!.isNewline){
                currentLine+=1
                lastChar=getChar()
            }
        }
        //scanning for keywords and identifiers
        if(lastChar!.isLetter){
            var value:String = String(lastChar!)
            lastChar=getChar()
            if(lastChar!.isNewline){
                currentLine+=1
                lastChar=getChar()
            }
            while(lastChar!.isLetter || lastChar!.isNumber){
                value+=String(lastChar!)
                lastChar=getChar()
            }
            
            if(keywords.contains(value)){
                let tok_keyword=Token(type:.keyword, value: value, lineNumber: currentLine)
                return tok_keyword
            }
            else{
                let tok_identifier=Token(type: .identifier, value: value, lineNumber: currentLine)
                return tok_identifier
            }
            
        }
        //scanning for numbers
        if(lastChar!.isNumber){
            var numValue=String(lastChar!)
            lastChar=getChar()
            if(lastChar!.isNewline){
                currentLine+=1
                lastChar=getChar()
            }
            while(lastChar!.isNumber || lastChar! == "."){
                numValue+=String(lastChar!)
            }
            
            let token_integer=Token(type: .integers, value: numValue, lineNumber: currentLine)
            return token_integer
        }
        
        //handling commments
        if(lastChar! == "-"){
            let nextChar=getChar()
            if(nextChar! == "-")
            {
                repeat{
                    lastChar=getChar()
                }while(lastChar != nil && !lastChar!.isNewline)
                if(lastChar != nil){
                    return getNextToken()
                }
            }
            else{
                lastChar=nextChar
                return getNextToken()
            }
            
        }
        
        if(lastChar == nil){
            return Token(type: .eof, value: "endoffile", lineNumber: currentLine)
        }
        
        lastChar=getChar()
        return nil
    }
    
}




