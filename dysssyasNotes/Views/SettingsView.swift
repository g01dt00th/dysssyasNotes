//
//  SettingsView.swift
//  dysssyasNotes
//
//  Created by dan4 on 10.03.2022.
//

import SwiftUI

struct SettingsView: View { // view for change color theme
    @Binding var colorScheme: ColorScheme?
    
    var body: some View {
        VStack {
            Picker(selection: $colorScheme, label: Text("Appearance")) {
                Text("System Default")
                    .tag(Optional<ColorScheme>.none)
                
                Text("Light")
                    .tag(Optional<ColorScheme>.some(ColorScheme.light))
                
                Text("Dark")
                    .tag(Optional<ColorScheme>.some(ColorScheme.dark))
                
            }.buttonStyle(.bordered)
            
            Spacer()
        }
    }
}
