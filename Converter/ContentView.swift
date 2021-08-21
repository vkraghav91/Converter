//
//  ContentView.swift
//  Converter
//
//  Created by Varun Kumar Raghav on 02/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var outputValue = ""
    @State private var inputUnitValue = 2
    @State private var outputUnitValue = 2

    let inputUnitTypes = ["meter","Kilometer","Yard"]
    let outputUnitTypes = ["meter","Kilometer","Yard"]
    
    var inputUnitAfterConversionToOutput: String{
        let baseUnit = inputUnitTypes[inputUnitValue]
        let outputUnitType = outputUnitTypes[outputUnitValue]
        var inputNumber = Double(inputValue) ?? 0
        var outputNumber = Double(outputValue) ?? 0
        switch baseUnit{
        case "Kilometer":
            inputNumber = convertingtoBaseMeter(from: "Kilometer", with: inputNumber)
        case "meter":
            inputNumber = convertingtoBaseMeter(from: "meter", with: inputNumber)
        case "Yard":
            inputNumber = convertingtoBaseMeter(from: "Yard", with: inputNumber)
        default:
            inputNumber = 0
        }
        switch outputUnitType {
        case "Kilometer":
            outputNumber = inputNumber/1000
        case "meter":
            outputNumber = inputNumber/1
        case "Yard":
            outputNumber = inputNumber/1.0936133333333000195
        default:
            outputNumber = 0
        }
        return "\(outputNumber)"
    }
    func convertingtoBaseMeter(from inputUnitType:String, with value:Double) -> Double {
        var convertedValue: Double
        switch inputUnitType {
        case "meter":
            convertedValue = value * 1
        case "Kilometer":
            convertedValue = value * 1000
        case "Yard" :
            convertedValue = value * 1.0936133333333000195
        default:
            convertedValue = value
        }
        return convertedValue
    }
    

    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Units to be converted")){
                    TextField("Input a value", text: $inputValue).keyboardType(.numberPad)
                    
                    Picker("Select Intput Unit Type", selection:$inputUnitValue){
                        ForEach(0 ..< inputUnitTypes.count){
                            Text(self.inputUnitTypes[$0])
                        }
                     }.pickerStyle(SegmentedPickerStyle())
                    }
                Section(header:Text("Convert Units")){
                    Picker("Select Output Unit Type", selection:$outputUnitValue){
                        ForEach(0 ..< outputUnitTypes.count){
                            Text(self.outputUnitTypes[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("\(inputUnitAfterConversionToOutput)")
                }
            }.navigationBarTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
