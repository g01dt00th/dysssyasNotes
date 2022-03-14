//
//  ContentView.swift
//  dysssyasNotes
//
//  Created by dan4 on 10.03.2022.
//

import SwiftUI
import Foundation

struct ContentView: View {

    @ObservedObject var mainD = MyData()
    @Environment(\.colorScheme) var systemColorScheme
    @State var myColorScheme: ColorScheme?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add the name of new note....", text: $mainD.newNote)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !self.mainD.newNote.isEmpty else {return}
                        self.mainD.allNotes.append(NoteItem(note: self.mainD.newNote))
                        self.mainD.newNote = ""
                        self.mainD.saveNotes()
                    }) {
                        Image(systemName: "plus")
                    }
                    
                    .padding()
                }
                .padding()
                
                List {
                    ForEach(mainD.allNotes) { noteItem in
                        NavigationLink(destination: DetailView(item: noteItem, mainD: mainD)) {
                            Text((((noteItem.note).split(separator: "\n")).first) ?? "")
                        }
                    }.onDelete(perform: mainD.deleteNote)
                }
                
            }
            .navigationBarItems(leading: Text("Dysssyas notes").font(.title2).bold(), trailing: NavigationLink("⚙", destination: SettingsView(colorScheme: $myColorScheme)))
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: mainD.loadNotes)
        .colorScheme(myColorScheme ?? systemColorScheme)
    }

    

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
