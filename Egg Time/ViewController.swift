//
//  ViewController.swift
//  Egg Time
//
//  Created by Tomas Sanni on 6/17/24.
//

import UIKit

class ViewController: UIViewController {
    let softEggImageButton = EggButton(eggType: .soft)
    let mediumEggImageButton = EggButton(eggType: .medium)
    let hardEggImageButton = EggButton(eggType: .hard)
    let horizontalStack = UIStackView()
    let progressBar = UIProgressView()
    let titleTop = UILabel()
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7960784314, green: 0.9490196078, blue: 0.9882352941, alpha: 1)
        titleTop.text = "How do you like your eggs?"
        titleTop.font = UIFont.preferredFont(forTextStyle: .title1)
        configureStack()
        configureEggButtons()
        configureProgressBar()
    }
    
    @objc func handleButton(button: EggButton) {
        timer.invalidate()
        totalTime = button.eggType.time
        progressBar.setProgress(0.0, animated: false)
        progressBar.progress = 0.0
        secondsPassed = 0
        titleTop.text = button.eggType.title
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer()
    {
        if secondsPassed < totalTime
        {
            secondsPassed += 1
            let setProgressValue = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(setProgressValue, animated: true)
        }
        else
        {
            timer.invalidate()
            titleTop.text = "Done"
        }
    }
    
    func configureStack() {
        view.addSubview(titleTop)
        titleTop.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        horizontalStack.addArrangedSubview(softEggImageButton)
        horizontalStack.addArrangedSubview(mediumEggImageButton)
        horizontalStack.addArrangedSubview(hardEggImageButton)

        NSLayoutConstraint.activate([
            
            titleTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleTop.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

        ])
    }
    
    func configureEggButtons() {
        softEggImageButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        mediumEggImageButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        hardEggImageButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            softEggImageButton.heightAnchor.constraint(equalToConstant: 120),
            softEggImageButton.widthAnchor.constraint(equalTo: softEggImageButton.heightAnchor, multiplier: 1),
            
            mediumEggImageButton.heightAnchor.constraint(equalToConstant: 120),
            mediumEggImageButton.widthAnchor.constraint(equalTo: mediumEggImageButton.heightAnchor, multiplier: 1),
            
            hardEggImageButton.heightAnchor.constraint(equalToConstant: 120),
            hardEggImageButton.widthAnchor.constraint(equalTo: hardEggImageButton.heightAnchor, multiplier: 1),
            
        ])
    }
    
    func configureProgressBar() {
        view.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = .systemYellow
        progressBar.setProgress(0.5, animated: true)
        
        NSLayoutConstraint.activate([
            progressBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}


#Preview {
    ViewController()
}

