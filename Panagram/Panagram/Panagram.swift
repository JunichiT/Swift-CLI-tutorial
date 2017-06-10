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
        print("Argument count: \(argCount), Option: \(option), value: \(value)")
    }
}
