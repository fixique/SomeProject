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
        static let purple = UIColor(hexString: "7C42FB")
        static let red = UIColor(hexString: "D82424")
        static let white = UIColor(hexString: "FFFFFF")
    }

    enum Main {
        static let background = Figma.white
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

}
