//
//  ContentView.swift
//  Calculator
//
//  Created by Julius Kempen on 30/11/2021.
//

import SwiftUI

extension Color {
    static let customcolor = Color("calculatorbackround")
}

struct ContentView: View {
    
    @State var calculator: Calculator = Calculator()
    
    let buttons: [[button]] = [
        [clear, plusminus, percentage, devide],
        [seven, eight, nine, times],
        [four, five, six, minus],
        [one, two, three, plus],
        [zero, dot, equal]
    ]
    
    var body: some View {
        ZStack{
            Color.customcolor
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                VStack {
                    Capsule()
                        .foregroundColor(Color(hue: 0.573, saturation: 0.925, brightness: 0.988))
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                        .frame(height: 60)
                        .overlay(Text("Kempen Instruments")
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                        )
                        .padding()
                    Spacer()
                    
                    VStack {
                        HStack{
                            Spacer()
                            Text(calculator.previousvalue.prefix(9))
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 60))
                                .padding()
                        }
                        HStack{
                            Spacer()
                            Text(calculator.value.prefix(9))
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 60))
                                .padding()
                        }
                    }
                    .padding(.all, 0.0)
                    .background(Color.gray)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 7)
                    .cornerRadius(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
                    .padding()
                    Spacer()

                }
                
                VStack {
                    Spacer()
                    // Our buttons
                    ForEach(0 ..< 5 ) { i in
                        HStack {
                            ForEach(buttons[i], id: \.id) { item in
                                Button(action: {
                                    calculator.buttonpress(button: item)
                                }) {
                                    Text(item.sign)
                                        .foregroundColor(Color.black)
                                        .frame(width: 90, height: 90)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                                        .font(.system(size: 30))
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
