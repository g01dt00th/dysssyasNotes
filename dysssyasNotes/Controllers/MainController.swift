//
//  MainController.swift
//  dysssyasNotes
//
//  Created by dan4 on 12.03.2022.
//

import Foundation


class MyData: ObservableObject {
    @Published var allNotes:[NoteItem] = []
    @Published var notekey = "noteKey"
    @Published var newNote = ""
    @Published var newEdNote: String = ""
    func deleteNote(at offsets:IndexSet) {
        self.allNotes.remove(atOffsets: offsets)
        saveNotes()
    }
    
    func saveNotes() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(allNotes), forKey: notekey)
    }
    
    func saveEdNotes() {
        if let noteData = UserDefaults.standard.value(forKey: notekey) as? Data {
            if let noteList = try? PropertyListDecoder().decode(Array<NoteItem>.self, from: noteData) {
                self.allNotes = noteList
            }
        }
    }

    func loadNotes() {
        if let noteData = UserDefaults.standard.value(forKey: notekey) as? Data {
            if let noteList = try? PropertyListDecoder().decode(Array<NoteItem>.self, from: noteData) {
                self.allNotes = noteList
                print(noteList)
            }
        }
        if allNotes.count < 1 {
            self.allNotes.append(NoteItem(note: "Read me \nДля создания заметки, введите в поле для ввода название заметки и нажмите клавишу +, после этого, в списке появится название вашей заметки, нажав на него, вы получите доступ к редактированию заметки"))
        }
    }
}
