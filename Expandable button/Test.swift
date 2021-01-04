//
//  ContentView.swift
//  Expandable button
//
//  Created by Joep Hinderink on 04/01/2021.
//

import SwiftUI

struct Test: View {
    
    @State private var isExpanded = false
    
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
                        if isExpanded {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "photo")
                        })
                        .padding()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "camera")
                        })
                        .padding()
                        }
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }, label: {
                            Image(systemName: "ellipsis")
                                .frame(width: 50, height: 65)
                        })
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(radius: 10)
                }
                .frame(width: 65)
                .padding()
            }
            .navigationTitle("Demo")
            .listStyle(PlainListStyle())
        }
    }
}

//struct ExpandableButtonPanel: View {
//
//    private let size: CGFloat = 65
//    private var cornerRadius: CGFloat {
//        get { size / 2 }
//    }
//
//    @State private var isExpanded = false
//
//    var body: some View {
//        VStack {
//            if isExpanded {
//                ForEach(secondaryButtons) { button in
//                    Button(action: {
//                        button.action?()
//                    }, label: {
//                        Image(systemName: "photo")
//                    })
//                    .frame(width: self.size, height: self.size)
//                }
//            }
//            Button(action: {
//                withAnimation {
//                    isExpanded.toggle()
//                }
//                self.primaryButton.action?()
//            }, label: {
//                Image(systemName: "ellipsis")
//            })
//            .frame(width: self.size, height: self.size)
//        }
//        .background(Color.white)
//        .cornerRadius(cornerRadius)
//        .shadow(radius: 5)
//    }
//}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
