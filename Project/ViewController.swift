//
//  ViewController.swift
//  Project
//
//  Created by Diego Gomes on 17/05/22.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func updateLabel(text: String)
}

class ViewController: UIViewController {


    lazy var textField = buildTextField()
    lazy var label = buildLabel()
    lazy var button = buildButton()
    private var viewModel: ViewModelProtocol

    init(viewModel: ViewModelProtocol = ViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        [textField, label, button].forEach { view.addSubview($0) }

        textField
            .centerYAnchor(to: view.centerYAnchor)
            .centerXAnchor(to: view.centerXAnchor)

        button
            .top(to: textField.bottomAnchor, constant: 18)
            .leadingToSuperview(constant: 28)
            .trailingToSuperview(constant: -28)

        label
            .top(to: button.bottomAnchor, constant: 18)
            .leadingToSuperview(constant: 28)
            .trailingToSuperview(constant: -28)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        textField.becomeFirstResponder()
        view.backgroundColor = .white

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        viewModel.makeRequest(number: textField.text)
    }
}

extension ViewController {
    func buildTextField() -> UITextField {
        let textfield = UITextField()
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Type something"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }

    func buildLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func buildButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Try out!", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

extension ViewController: ViewControllerDelegate {
    func updateLabel(text: String) {
        label.text = text
    }
}
