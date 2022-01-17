//
//  ViewController.swift
//  Worde
//
//  Created by Damir Aushenov on 13/1/22.
//

import UIKit

class ViewController: UIViewController {
    struct Constants {
        let keyboardTop: [String] = ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ъ"]
        let keyboardMiddle: [String] = ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"]
        let keyboardBottom: [String] = ["x", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю", "ввод"]
    }
    
    let secret: [String] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WORDLE (RU)"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        print(digitsLabel)
       
    }
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    lazy var keyboardStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    func createHorizontalStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        return view
    }
    
    func createField(field: UILabel) -> UILabel {
       
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.widthAnchor.constraint(equalToConstant: 60).isActive = true
        field.heightAnchor.constraint(equalToConstant: 60).isActive = true
        field.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return field
    }
    
    var digitsLabel: [[UILabel]] = []
    
    func createFields(x: Int, y: Int) {
        for _ in 0..<x {
            let createXView = createHorizontalStackView()
            var row: [UILabel] = []
            for _ in 0..<y {
               
               
               
                let field = createField(field:  UILabel())
                row.append(field)
             
                createXView.addArrangedSubview(field)
            }
            digitsLabel.append(row)
            verticalStackView.addArrangedSubview(createXView)
        }
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(textDidChange), for: .touchUpInside)
        return button
    }
   
    var currentRow = [String]()
    var rowCount = 0
    
    fileprivate func appendTextToLabel(rowCount: Int) {
        for i in 0 ..< digitsLabel[rowCount].count {
            let currentLabel = createField(field: digitsLabel[rowCount][i])
            if i < currentRow.count {
                let index = currentRow.index(currentRow.startIndex, offsetBy: i)
                currentLabel.text = String(currentRow[index])
            }
        }
    }
    
    @objc func textDidChange(_ sender: UIButton) {
        let letter = sender.titleLabel?.text
        if letter == "ввод" && currentRow.count == 5 {
            rowCount += 1
            currentRow = []
        }
        
        if rowCount > 5 {
            return
        }
      
        if currentRow.count == 5 {
            return
        }
        
        if letter != "ввод" && letter != "x" {
            currentRow.append(letter!)
        }
        
        appendTextToLabel(rowCount: rowCount)

    }
    
    func createKeyboard(x: Int, y: Int) {
        for v in 0..<x {
            let createXView = createHorizontalStackView()
            if v == 0 {
                for n in 0..<Constants().keyboardTop.count {
                    let field = createButton()
                   
                    field.setTitle(Constants().keyboardTop[n], for: .normal)
                    createXView.addArrangedSubview(field)
                }
            } else if v == 1 {
                for n in 0..<Constants().keyboardMiddle.count {
                    let field = createButton()
                   
                    field.setTitle(Constants().keyboardMiddle[n], for: .normal)
                    createXView.addArrangedSubview(field)
                }
            } else {
                for n in 0..<Constants().keyboardBottom.count {
                    let field = createButton()
                    field.setTitle(Constants().keyboardBottom[n], for: .normal)
                    createXView.addArrangedSubview(field)
                }
            }
            
            keyboardStackView.addArrangedSubview(createXView)
        }
    }
    
    private func configureViews() {
        [titleLabel, verticalStackView, keyboardStackView].forEach {
            view.addSubview($0)
        }
        
        createFields(x: 6, y: 5)
        createKeyboard(x: 3, y: 3)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor)

        verticalStackView.anchor(top: titleLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        
        keyboardStackView.anchor(top: verticalStackView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        keyboardStackView.backgroundColor = .red
    }
}

