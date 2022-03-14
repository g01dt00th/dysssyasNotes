//
//  ContentView.swift
//  dysssyasNotes
//
//  Created by dan4 on 10.03.2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var mainD = MyData()
    @State var myColorScheme: ColorScheme?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add the name of new note....", text: $mainD.newNote)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: mainD.createNote) {
                        Image(systemName: "plus")
                    }
                    .disabled(mainD.newNote.isEmpty)
                    
                    .padding()
                }
                .padding()
                
                List {
                    ForEach($mainD.allNotes) { $noteItem in
                        NavigationLink(
                            destination: DetailView(item: $noteItem)
                                            .onDisappear(perform: mainD.saveNotes)
                        ) {
                            Text((((noteItem.note).split(separator: "\n")).first) ?? "")
                        }
                    }.onDelete(perform: mainD.deleteNote)
                }
                
            }
            .navigationBarItems(leading: Text("Dysssyas notes").font(.title2).bold(), trailing: NavigationLink("⚙", destination: SettingsView(colorScheme: $myColorScheme)))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: mainD.loadNotes)
        .preferredColorScheme(myColorScheme)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
