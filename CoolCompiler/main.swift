import Foundation


class FileReader {
    private let fileHandle: FileHandle
    private var currentPosition: UInt64 = 0

    init(filePath: String) throws {
        self.fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: filePath))
    }

    deinit {
        fileHandle.closeFile()
    }

    func readNextCharacter() -> Character? {

        fileHandle.seek(toFileOffset: currentPosition)

        if let byte = fileHandle.readData(ofLength: 1).first,
           let character = String(bytes: [byte], encoding: .utf8)?.first {
            
            currentPosition += 1
            return character
        }

        return nil
    }
}


func getChar()->Character?{
    return fileHandler.readNextCharacter()
    
}

let arguments=CommandLine.arguments

let fileHandler:FileReader

if arguments.count > 1 {
    let filePath = arguments[1]
    print("File path: \(filePath)")
    do{
        fileHandler=try FileReader(filePath: filePath)
        
    }catch{
        fatalError("Error reading file")
    }
} else {
    fatalError("No file path provided.", file: "main.swift")
}



func lexicalTest(){
    let lexer=Lexer()
    for _ in 0..<30{
        if let token=lexer.getNextToken(){
            print("LineNumber:\(token.lineNumber)\nType:\(token.type)\nValue:\(token.value)\n")
        }
    }

}
lexicalTest()

//for _ in 0..<30{
//    getChar()
//}

