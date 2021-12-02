//
//  Calculator.swift
//  Calculator
//
//  Created by Julius Kempen on 01/12/2021.
//

import Foundation

struct button {
    let id = UUID()
    var name: String
    var sign: String
}

struct Calculator {
    var value = "0"
    var previousvalue = "0"
    var action = ""
    var calculation = 0.0
    var equal_is_pushed = false
    var decimal_is_used = false
    var D = 1
    var on_off = true
    
    mutating func buttonpress(button: button){
        switch button.sign {
        case one.sign, two.sign, three.sign, four.sign, five.sign, six.sign, seven.sign, eight.sign, nine.sign, zero.sign:
            if equal_is_pushed == true {
                previousvalue = value
                decimal_is_used = false
            }
            
            if value == "0" || equal_is_pushed == true {
                value = button.sign
                equal_is_pushed = false
            }
            else {
                value = "\(value)\(button.sign)"
            }
            
        case plus.sign:
            if equal_is_pushed == true {
                equal_is_pushed = false
            }
            action = "+"
            calculation = Double(value) ?? 0
            value = "0"
            decimal_is_used = false
            
        case minus.sign:
            if equal_is_pushed == true {
                equal_is_pushed = false
            }
            action = "-"
            calculation = Double(value) ?? 0
            value = "0"
            decimal_is_used = false
            
        case times.sign:
            if equal_is_pushed == true {
                equal_is_pushed = false
            }
            action = "x"
            calculation = Double(value) ?? 0
            value = "0"
            decimal_is_used = false
            
        case devide.sign:
            if equal_is_pushed == true {
                equal_is_pushed = false
            }
            action = "÷"
            calculation = Double(self.value) ?? 0
            value = "0"
            decimal_is_used = false
            
        case dot.sign:
            if value.suffix(1) != "." && decimal_is_used != true && equal_is_pushed != true {
                decimal_is_used = true
                value = "\(value)\(dot.sign)"
            }
            
        case plusminus.sign:
            value = "\(-(Double(value) ?? 0))"
        
        case percentage.sign:
            value = "\((Double(value) ?? 0) * 0.01)"
            decimal_is_used = true
            
        case equal.sign:
            if action == "+"{
                value = "\((Double(value) ?? 0) + calculation)"
            }
            else if action == "-"{
                value = "\((Double(value) ?? 0) - calculation)"
            }
            else if action == "x"{
                value = "\((Double(value) ?? 0) * calculation)"
            }
            else if action == "÷"{
                value = "\((Double(calculation) / (Double(value) ?? 0)))"
            }
            action = ""
            equal_is_pushed = true
        
        case clear.sign:
            value = "0"
            calculation = 0
            action = ""
            equal_is_pushed = false
            decimal_is_used = false
            
        default:
            D = 1
            
        }
    }
    
    mutating func on_off_func(){
        if on_off == true {
            on_off = false
        }
        else {
            on_off = true
        }
    }
}
    

let zero = button(name: "zero", sign: "0")
let one = button(name: "one", sign: "1")
let two = button(name: "two", sign: "2")
let three = button(name: "three", sign: "3")
let four = button(name: "four", sign: "4")
let five = button(name: "five", sign: "5")
let six = button(name: "six", sign: "6")
let seven = button(name: "seven", sign: "7")
let eight = button(name: "eight", sign: "8")
let nine = button(name: "nine", sign: "9")
let equal = button(name: "equal", sign: "=")
let dot = button(name: "dot", sign: ".")
let plus = button(name: "plus", sign: "+")
let minus = button(name: "minus", sign: "-")
let times = button(name: "times", sign: "x")
let devide = button(name: "devide", sign: "÷")
let percentage = button(name: "percentage", sign: "%")
let plusminus = button(name: "plusminus", sign: "+/-")
let clear = button(name: "clear", sign: "AC")





