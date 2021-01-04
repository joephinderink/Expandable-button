//
//  ContentView.swift
//  Expandable button
//
//  Created by Joep Hinderink on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Expandable Button")
            .padding()
    }
}

struct ExpandableButtonItem: Identifiable {
    let id = UUID()
    let label: Image
    var action: (() -> Void)? = nil
}

struct ExpandableButtonPanel: View {
    
    let primaryButton: ExpandableButtonItem
    let secondaryButtons: [ExpandableButtonItem]
    
    private let size: CGFloat = 65
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                ForEach(secondaryButtons) { button in
                    Button(action: {
                        button.action?()
                    }, label: {
                        button.label
                    })
                    .frame(width: self.size, height: self.size)
                }
            }
            Button(action: {
                self.primaryButton.action?()
            }, label: {
                self.primaryButton.label
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
