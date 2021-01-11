//
//  ContentView.swift
//  TestButton
//
//  Created by Joep Hinderink on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isExpanded = false
    
    var body: some View {
        VStack {
            Button (action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }, label: {
                Image(systemName: "house")
                    .frame(width: 65, height: 65)
            })
            if isExpanded {
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "house")
                        .frame(width: 65, height: 65)
                })
            }
            if isExpanded {
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "house")
                        .frame(width: 65, height: 65)
                })
            }
        }
        .background(Color.black)
        .cornerRadius(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
