//
//  RulesVC.swift
//  CardWorkout-Programmatic
//
//  Created by Davyd Darusenkov on 23.11.2023.
//

import UIKit

class RulesVC: UIViewController {
    let okButton = CWButton(color: .systemMint, title: "OK",icon: .returnLeft)

    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let exerciseLabel = UILabel()

    let currentCardImageView = UIImageView()
    var currentCard: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        configureUI()
    }

    func configureUI() {
        configureCardImageView()
        configureOkButton()
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }

    func configureCardImageView() {
        view.addSubview(currentCardImageView)
        currentCardImageView.image = currentCard
        currentCardImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            currentCardImageView.widthAnchor.constraint(equalToConstant: 50),
            currentCardImageView.heightAnchor.constraint(equalToConstant: 75),
            currentCardImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            currentCardImageView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
        ])
    }

    func configureOkButton() {
        view.addSubview(okButton)

        okButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        NSLayoutConstraint.activate([
            okButton.widthAnchor.constraint(equalToConstant: 150),
            okButton.heightAnchor.constraint(equalToConstant: 50),
            okButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    func configureTitleLabel() {
        view.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: currentCardImageView.bottomAnchor, constant: 15),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), check difference
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }

    func configureRulesLabel() {
        view.addSubview(rulesLabel)

        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel
            .text = """
            The value of each card represents the number of exercise you do.

            J = 11, Q = 12, K = 13, A = 14
            """
        rulesLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.numberOfLines = 0
        rulesLabel.lineBreakMode = .byWordWrapping

        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),

            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }

    func configureExerciseLabel() {
        view.addSubview(exerciseLabel)

        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = """
        ♠️ - Push-ups

        ♣️ - Lorem

        ❤️ - Ipsum

        ♦️ - Dorem
        """
        exerciseLabel.font = .systemFont(ofSize: 18)
        exerciseLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 20),
            exerciseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            exerciseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }

    @objc func dismissController() {
        dismiss(animated: true)
    }
}
