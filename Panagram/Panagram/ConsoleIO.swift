//
//  ConsoleIO.swift
//  Panagram
//
//  Created by junichi-tsurukawa on 2017/06/10.
//  Copyright © 2017年 junichit. All rights reserved.
//

import Foundation

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
}
