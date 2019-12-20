//
//  main.swift
//  valid_braces
//
//  Created by Marcela Limieri Tozzato on 18/12/19.
//  Copyright © 2019 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

//MARK: minha solução

func validBraces(_ string:String) -> Bool {
    
    testeArrayString(arrayDeStrings: separarEmArrayDeStrings(string: string))
}

func separarEmArrayDeStrings(string: String) -> [String] {
    
    var arrayDeStrings: [String] = []
    var stack = ""
    var previousValue = ""
    
    for value in string[string.startIndex..<string.endIndex] {
        if (value == "(" || value == "[" || value == "{") && (previousValue == ")" || previousValue == "]" || previousValue == "}") {
            arrayDeStrings.append(stack)
            stack = ""
        }
        switch String(value) {
        case "(", "[", "{":
            stack += String(value)
        case ")", "]", "}":
            stack += String(value)
        default:
            break
        }
        previousValue = String(value)
    }
    arrayDeStrings.append(stack)
    return arrayDeStrings
}

func testeArrayString(arrayDeStrings: [String]) -> Bool {
    for string in arrayDeStrings {
        
        var arrayAbertura: [Character] = []
        var arrayFechamento: [Character] = []
        
        for value in string[string.startIndex..<string.endIndex]{
            if value == "(" || value == "[" || value == "{" {
                arrayAbertura.append(value)
            } else {
                arrayFechamento.append(value)
            }
        }
        if !compararAberturaEFechamento(arrayAbertura: arrayAbertura, arrayFechamento: arrayFechamento) {
            return false
        }
    }
    return true
}

func compararAberturaEFechamento(arrayAbertura: [Character], arrayFechamento: [Character]) -> Bool {
    if arrayAbertura.count == arrayFechamento.count {
        let total = arrayAbertura.count - 1
        for index in 0...total {
            if !(arrayAbertura[index] == "(" && arrayFechamento[total - index] == ")") && !(arrayAbertura[index] == "[" && arrayFechamento[total - index] == "]") && !(arrayAbertura[index] == "{" && arrayFechamento[total - index] == "}") {
                return false
            }
        }
        return true
    }
    return false
}

print(validBraces("({})[({})]"))

//MARK: outras soluções

func validBraces2(_ string:String) -> Bool {
    let str = string
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "{}", with: "")
        .replacingOccurrences(of: "[]", with: "")
        .replacingOccurrences(of: "()", with: "")
    switch str {
    case "": return true
    case string: return false
    default: return validBraces(str)
    }
}

print(validBraces2("({})[({})]"))



let matches: [Character: Character] = ["(": ")", "[": "]", "{": "}"]

func validBraces3(_ string: String) -> Bool {
    var stack: [Character] = []
    for char in string {
        print("CHAR: \(char)")
        if let match = matches[char] {
            stack.append(match)
            print("STACK: \(stack)")
        } else {
            if char != stack.popLast() {
                print("STACK: \(stack)")
                return false
            }
            print("STACK: \(stack)")
        }
    }
    return stack.isEmpty
}

print(validBraces3("({})[({})]"))


