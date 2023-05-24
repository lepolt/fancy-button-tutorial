//
//  FancyButtonStyle.swift
//  CTAButtonDemo
//
//  Created by Jonathan Lepolt on 5/18/23.
//

import SwiftUI

struct FancyButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var enabled

    @State private var isPressed = false

    struct Constants {
        static let topPadding: CGFloat = 16
        static let rightPadding: CGFloat = 16
        static let bottomPadding: CGFloat = 16
        static let leftPadding: CGFloat = 16

        static let backgroundTopPadding: CGFloat = 0
        static let backgroundHorizontalPadding: CGFloat = 2
        static let backgroundBottomPadding: CGFloat = 16

        static let backgroundTopPaddingPressed: CGFloat = 12
        static let backgroundHorizontalPaddingPressed: CGFloat = 4
        static let backgroundBottomPaddingPressed: CGFloat = 2

        static let cornerRadius: CGFloat = 4
    }

    private var backgroundColor: Color {
        guard enabled else { return Color("disabledAtomic") }

        return isPressed ?
        Color("secondaryAtomic") :
        Color("primaryAtomic")
    }

    private var foregroundColor: Color {
        isPressed ? Color("mono200") : .white
    }

    private var backgroundHorizontalPadding: CGFloat {
        isPressed ? Constants.backgroundHorizontalPaddingPressed : Constants.backgroundHorizontalPadding
    }

    private var backgroundTopPadding: CGFloat {
        isPressed ? Constants.backgroundTopPaddingPressed : Constants.backgroundTopPadding
    }

    private var backgroundBottomPadding: CGFloat {
        isPressed ? Constants.backgroundBottomPaddingPressed : Constants.backgroundBottomPadding
    }

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .bold()

            Image(systemName: "chevron.forward")
        }
        .foregroundColor(foregroundColor)
        .font(.title2)
        .padding(.top, Constants.topPadding)
        .padding(.bottom, Constants.bottomPadding)
        .padding(.leading, Constants.leftPadding)
        .padding(.trailing, Constants.rightPadding)
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(backgroundColor)
        )
        .padding(.top, backgroundTopPadding)
        .padding(.bottom, backgroundBottomPadding)
        .padding(.horizontal, backgroundHorizontalPadding)
        .background(
            enabled ?
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color("atomicNeutron")):
                nil
        )
        .animation(nil, value: isPressed)
        .animation(nil, value: enabled)
        .onChange(of: configuration.isPressed) { newValue in
            self.isPressed = newValue
        }
    }
}

struct FancyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Button("Call to Action") {}
                .buttonStyle(FancyButtonStyle())

            Button("Call to Action Disabled") {}
                .buttonStyle(FancyButtonStyle())
                .disabled(true)
        }
    }
}
