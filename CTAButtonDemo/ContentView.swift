//
//  ContentView.swift
//  CTAButtonDemo
//
//  Created by Jonathan Lepolt on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isDisabled = false

    var body: some View {
        VStack {
            Button("Hello, World!") {
                isDisabled.toggle()
            }
            .buttonStyle(FancyButtonStyle())
            .disabled(isDisabled)

            Button("Reset") {
                isDisabled.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
