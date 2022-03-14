//
//  SettingsView.swift
//  dysssyasNotes
//
//  Created by dan4 on 10.03.2022.
//

import SwiftUI

struct SettingsView: View { // view for change color theme
    @State private var selectedAppearance = 1
    @Binding var colorScheme: ColorScheme?
    var body: some View {
        Picker(selection: $selectedAppearance, label: Text("Appearance")) {
            Text("System Default").tag(1)
            Text("Light").tag(2)
            Text("Dark").tag(3)
        }.buttonStyle(.bordered)
        .onAppear {
            switch colorScheme {
            case .none:
                selectedAppearance = 1
            case .light:
                selectedAppearance = 2
            case .dark:
                selectedAppearance = 3
            default:
                break
            }
        }
        .onChange(of: selectedAppearance) { value in
            switch selectedAppearance {
            case 1:
                colorScheme = nil
            case 2:
                colorScheme = .light
            case 3:
                colorScheme = .dark
            default:
                break
            }
        }
        Spacer()
    }
}
