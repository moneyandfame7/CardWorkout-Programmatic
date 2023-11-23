//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Davyd Darusenkov on 23.11.2023.
//

import UIKit

class CWButton: UIButton {
    enum Icons: String {
        case info = "info.circle"
        case pause = "pause.circle"
        case play = "play.circle"
        case pointer = "cursorarrow"
        case returnLeft = "return.left"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

//        configure()
    }

//    @available(*, unavailable)
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(color: UIColor, title: String, config: Configuration = .tinted(), icon: Icons? = nil) {
        super.init(frame: .zero)

        configuration = config

        if icon != nil {
            configuration?.image = UIImage(systemName: icon!.rawValue)
            configuration?.imagePadding = 10
        }

        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        configuration?.cornerStyle = .medium

        translatesAutoresizingMaskIntoConstraints = false // Using auto-layout
    }

    public func changeIcon(icon: Icons? = nil) {
        if icon == nil {
            configuration?.image = nil
        } else {
            configuration?.image = UIImage(systemName: icon!.rawValue)
        }
    }
}
