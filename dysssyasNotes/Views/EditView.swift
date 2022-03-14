//
//  EditView.swift
//  dysssyasNotes
//
//  Created by dan4 on 11.03.2022.
//

import SwiftUI

struct DetailView: View {
    @Binding var item: NoteItem
    
    var body: some View {
        TextEditor(text: $item.note)
            .padding()
    }
}


