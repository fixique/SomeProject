//
//  Color.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 11/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

enum Color {

    private enum Figma {
        static let lightGray = UIColor(hexString: "E8E8E8")
        static let strokeGray = UIColor(hexString: "DCDCDC")
        static let textGray = UIColor(hexString: "B9BCC5")
        static let itemGray = UIColor(hexString: "5C6979")
        static let purple = UIColor(hexString: "7C42FB")
        static let purpleBold = UIColor(hexString: "631DFA")
        static let red = UIColor(hexString: "D82424")
        static let white = UIColor(hexString: "FFFFFF")
        static let black = UIColor(hexString: "000000")
    }

    enum Main {
        static let background = Figma.white
    }

    enum TabBar {
        static let background = Figma.white
        static let selectedTabItem = Figma.black
        static let tabItem = Figma.itemGray
        static let stroke = Figma.lightGray
    }

    enum InputFields {
        enum RoundInputField {
            static let background = Figma.lightGray
            static let stroke = Figma.strokeGray
            static let text = Figma.textGray
            static let tint = Figma.purple
            static let error = Figma.red
        }
    }

    enum Buttons {
        enum MainPurple {
            static let background = Figma.purple
            static let highlighted = Figma.purple.withAlphaComponent(0.6)
            static let stroke = Figma.purpleBold
            static let text = Figma.white
        }
    }

    enum NavigationBarStyle {
        enum White {
            static let background = Figma.white
            static let text = Figma.black
        }
    }

}
