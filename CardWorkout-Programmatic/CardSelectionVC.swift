//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Davyd Darusenkov on 23.11.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    let cardImageView = UIImageView()

    let mainButton = CWButton(backgroundColor: .systemCyan, title: "Start!")
    let pickButton = CWButton(backgroundColor: .systemBrown, title: "Pick")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")

    let deck = Deck()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        configureUI()
        // Do any additional setup after loading the view.
    }

    @objc func presentRulesVC() {
        // щоб передати якісь данні, можна  змінювати у інстанса
        let rulesVC = RulesVC()
        rulesVC.currentCard = cardImageView.image!

        present(rulesVC, animated: true) // Modally
        // navigationController?.pushViewController() // using navigation controller
    }

    @objc func mainButtonTapped() {
        toggleTimer()
        toggleMainButton()
        togglePickButton()
    }

    @objc func pickButtonTapped() {
        timer?.invalidate()
        timer = nil
        showRandomCard()
    }

    @objc func showRandomCard() {
        cardImageView.image = deck.pickRandomCard()
        
    }

    func toggleMainButton() {
        if timer != nil {
            mainButton.setTitle("Stop!", for: .normal)
            mainButton.backgroundColor = .systemRed
        } else {
            mainButton.setTitle("Start!", for: .normal)
            mainButton.backgroundColor = .systemCyan
        }
    }

    func togglePickButton() {
        pickButton.isEnabled = timer == nil
    }

    func toggleTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(showRandomCard),
                userInfo: nil,
                repeats: true
            )
        } else {
            timer?.invalidate()
            timer = nil
        }
    }

    func configureUI() {
        configureCardImageView()
        configureMainButton()
        configurePickButton()
        configureRulesButton()
    }

    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = deck.pickRandomCard()

        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),

        ])
    }

    func configureMainButton() {
        view.addSubview(mainButton)

        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            mainButton.widthAnchor.constraint(equalToConstant: 250),
            mainButton.heightAnchor.constraint(equalToConstant: 50),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 25),
        ])
    }

    func configurePickButton() {
        view.addSubview(pickButton)

        pickButton.addTarget(self, action: #selector(pickButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            pickButton.widthAnchor.constraint(equalToConstant: 115),
            pickButton.heightAnchor.constraint(equalToConstant: 50),
            pickButton.leadingAnchor.constraint(equalTo: mainButton.leadingAnchor),
            pickButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 20),
        ])
    }

    func configureRulesButton() {
        view.addSubview(rulesButton)

        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: mainButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 20),
        ])
    }
}
