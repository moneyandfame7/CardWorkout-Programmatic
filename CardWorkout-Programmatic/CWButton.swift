//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Davyd Darusenkov on 23.11.2023.
//

import UIKit

class CWButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

//    @available(*, unavailable)
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        configure()

        self.backgroundColor = backgroundColor

        setTitle(title, for: .normal)
    }

    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false // Using auto-layout
    }
}
