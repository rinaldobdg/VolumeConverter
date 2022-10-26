//
//  ContentView.swift
//  VolConverter
//
//  Created by Benny Rinaldo on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var mesInput = UnitVolume.milliliters
    @State private var mesOutput = UnitVolume.liters
    @State private var value: Double = 0.0
    
    let measures = [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
    
    private var result: Double {
        let inputResult = Measurement(value: value, unit: mesInput)
        let outputResult = inputResult.converted(to: mesOutput)
        return outputResult.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Insert a measurement value", value: $value, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker("Choose your input unit", selection: $mesInput) {
                        ForEach(measures, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Enter your input unit:")
                }
                
                Section {
                    Picker("Choose your output unit", selection: $mesOutput) {
                        ForEach(measures, id:\.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(result.formatted())
                } header: {
                    Text("Select your output unit")
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
