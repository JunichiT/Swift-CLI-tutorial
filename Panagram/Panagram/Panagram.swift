//
//  Panagram.swift
//  Panagram
//
//  Created by junichi-tsurukawa on 2017/06/10.
//  Copyright © 2017年 junichit. All rights reserved.
//

class Panagram {
    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let (option, value) = ConsoleIO.getOption(argument.substring(from: argument.characters.index(argument.startIndex, offsetBy: 1)))
        ConsoleIO.writeMessage("Argument count: \(argCount), Option: \(option), value: \(value)")

        switch option {
        case .anagram:
            guard argCount == 4 else {
                if argCount > 4 {
                    ConsoleIO.writeMessage("Too many argumants for option \(option.rawValue)", to: .error)
                } else {
                    ConsoleIO.writeMessage("Too few argumants for option \(option.rawValue)", to: .error)
                }
                return
            }
            let first = CommandLine.arguments[2]
            let second = CommandLine.arguments[3]
            if first.isAnagram(of: second) {
                ConsoleIO.writeMessage("\(first) is an anagral of \(second)")
            } else {
                ConsoleIO.writeMessage("\(first) is NOT an anagral of \(second)")
            }

        case .palindrome:
            guard argCount == 3 else {
                if argCount > 3 {
                    ConsoleIO.writeMessage("Too many argumants for option \(option.rawValue)", to: .error)
                } else {
                    ConsoleIO.writeMessage("Too few argumants for option \(option.rawValue)", to: .error)
                }
                return
            }
            let string = CommandLine.arguments[2]
            let isPalindrome = string.isPalindrome()
            ConsoleIO.writeMessage("\(string) is \(isPalindrome ? "" : "NOT ")a palindrome")

        case .help:
            ConsoleIO.showUsage()

        case .unknown, .quit:
            ConsoleIO.writeMessage("Unknown option: \(value)", to: .error)
            ConsoleIO.showUsage()
        }
    }

    func interactiveMode() {
        ConsoleIO.writeMessage("Welcome to Panagram. This program checks if an input string is an anagram ot palindrome.")
        var sholdQuit = false
        while !sholdQuit {
            ConsoleIO.writeMessage("Type 'a' to check for anagrams or 'p' for palindromes, type 'q' to quit.")
            let (option, value) = ConsoleIO.getOption(ConsoleIO.getInput())

            switch option {
            case .anagram:
                ConsoleIO.writeMessage("Type the first string:")
                let first = ConsoleIO.getInput()
                ConsoleIO.writeMessage("Type the second string:")
                let second = ConsoleIO.getInput()
                if first.isAnagram(of: second) {
                    ConsoleIO.writeMessage("\(first) is an anagral of \(second)")
                } else {
                    ConsoleIO.writeMessage("\(first) is NOT an anagral of \(second)")
                }

            case .palindrome:
                ConsoleIO.writeMessage("Type a word or sentence:")
                let string = ConsoleIO.getInput()
                let isPalindrome = string.isPalindrome()
                ConsoleIO.writeMessage("\(string) is \(isPalindrome ? "" : "NOT ")a palindrome")

            case .quit:
                sholdQuit = true

            default:
                ConsoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
}
