//
//  ContentView.swift
//  Expandable button
//
//  Created by Joep Hinderink on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView{
            ZStack {
                List(1...10, id: \.self) { i in
                    Text("Row \(i)")
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ExpandableButtonPanel(primaryButton: ExpandableButtonItem(label: Image(systemName: "ellipsis")), secondaryButtons: [
                                                ExpandableButtonItem(label: Image(systemName: "photo")){
                                                    self.showAlert.toggle()
                                                },
                                                ExpandableButtonItem(label: Image(systemName: "camera")){
                                                    self.showAlert.toggle()
                                                },
                        ])
                    }
                }
                .padding()
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Test"))
                })
            }
            .navigationTitle("Demo")
            .listStyle(PlainListStyle())
        }
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
                withAnimation {
                    isExpanded.toggle()
                }
                self.primaryButton.action?()
            }, label: {
                self.primaryButton.label
            })
            .frame(width: self.size, height: self.size)
        }
        .background(Color.white)
        .cornerRadius(cornerRadius)
        .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
