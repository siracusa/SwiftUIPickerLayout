//
//  ContentView.swift
//  SwiftUIPickerLayout
//
//  Created by John Siracusa on 12/27/24.
//

import SwiftUI

let explanation = """
There appears to be no way to make a Picker with a fixed width. When using a Form layout similar to the one used in System Settings, this becomes a problem when a text field and a picker are paired together (e.g., when the text field containing a value and the Picker containing the units of that value).

The three main possibilities are shown below, and they’re all unsatisfactory. In scenario A, the text field moves each time a new unit is selected from the Picker. In scenarios B and C, the gap between the Picker and either the text field or the right edge of the row changes each time a new unit is selected from the Picker.

Allowing the Picker to have a fixed width would solve this problem. Every UI framework I can think of allows pickers to have a fixed width: AppKit, Carbon, the Mac Toolbox, HTML, etc. This is usually the width that will fit the longest item, but it can also sometimes be less than that.

If this kind of System Settings-style layout is going to be a thing, with the labels aligned to the left and the controls aligned to the right (…and a potentially large gap between them, making this entire pursuit of questionable value…), then please allow Pickers to have fixed widths so the control positions and spacing don’t change each time an item is selected from the Picker!
"""

struct ContentView: View {
    @State private var selectedUnit = "Kilometers"
    @State private var distanceInput = 123

    let units = [
        "Inches",
        "Feet",
        "Yards",
        "Miles",
        "Kilometers"
    ]

    var body: some View {
        Form {
            Text(explanation)

            Section("Distance") {
                HStack(spacing: 8) {
                    Text("A: Maximum Distance")

                    Spacer()

                    TextField("Maximum Distance:", value: $distanceInput, format: .number)
                        .labelsHidden()
                        .frame(maxWidth: 70)
                        .textFieldStyle(.roundedBorder)

                    Picker("Units", selection: $selectedUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit).tag(unit)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                }

                HStack(spacing: 8) {
                    Text("B: Maximum Distance")

                    Spacer()

                    TextField("Maximum Distance:", value: $distanceInput, format: .number)
                        .labelsHidden()
                        .frame(maxWidth: 70)
                        .textFieldStyle(.roundedBorder)

                    Picker("Units", selection: $selectedUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit).tag(unit)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .frame(width: 98, alignment: .trailing)
                }

                HStack(spacing: 8) {
                    Text("C: Maximum Distance")

                    Spacer()

                    TextField("Maximum Distance:", value: $distanceInput, format: .number)
                        .labelsHidden()
                        .frame(maxWidth: 70)
                        .textFieldStyle(.roundedBorder)

                    Picker("Units", selection: $selectedUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit).tag(unit)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .frame(width: 98, alignment: .leading)
                }
            }
        }
        .formStyle(.grouped)
        .frame(width: 600, height: 561)
    }
}

#Preview {
    ContentView()
}
