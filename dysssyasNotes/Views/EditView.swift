//
//  EditView.swift
//  dysssyasNotes
//
//  Created by dan4 on 11.03.2022.
//

import SwiftUI

struct DetailView: View {
    @State private var allNotes:[NoteItem] = []
    @State var item: NoteItem
    @ObservedObject var mainD: MyData
    private let noteKey = "noteKey"
    
    var body: some View {
        VStack {
            TextEditor(text: $item.note)
        }
        .padding()
        .onDisappear(perform: {
            print()
            mainD.newEdNote = item.note
            self.item.note = self.mainD.newEdNote
            
//            self.mainD.allNotes.append(NoteItem(note: self.mainD.newEdNote))
            item.note = UserDefaults.standard.string(forKey: noteKey) ?? ""
            UserDefaults.standard.set(item.note, forKey: noteKey)
            print(mainD.newEdNote)
            mainD.saveNotes()
        })
//        .onAppear(perform: {
//            item.note = UserDefaults.standard.string(forKey: noteKey) ?? ""
//
//            print(UserDefaults.standard.string(forKey: noteKey) ?? "")
//        })
    }
}


