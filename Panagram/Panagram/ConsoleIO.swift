//
//  ConsoleIO.swift
//  Panagram
//
//  Created by junichi-tsurukawa on 2017/06/10.
//  Copyright © 2017年 junichit. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case unknown

    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        default: self = .unknown
        }
    }
}

class ConsoleIO {
    static func showUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent

        let instructionString = ""
        + "Usage:\n"
        + "\(executableName) -a string1 string2\n"
        + "or\n"
        + "\(executableName) -p string\n"
        + "or\n"
        + "`\(executableName) -h` to show usage information\n"
        + "Type `\(executableName)` without an option to enter interactive mode."
        print(instructionString)
    }

    static func getOption(_ option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }

    static func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
}
