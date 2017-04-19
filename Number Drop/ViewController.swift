//
//  ViewController.swift
//  Number Drop
//
//  Created by Blake Clough on 4/18/17.
//  Copyright © 2017 Blake Clough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numberOfColumns = 7
    let paddingWidth: CGFloat = 8.0
    var columnWidth: CGFloat = 0.0
    var playingSquareWidth: CGFloat = 0.0
    var ballsPerLevel = 5
    var ballsInLevelArray = [UIView]()
    var ballsLeftInLevel: Int {
        set {
            for i in 0..<newValue {
                ballsInLevelArray[i].layer.backgroundColor = UIColor.white.cgColor
                ballsInLevelArray[i].layer.borderColor = UIColor.white.cgColor
            }
            for i in newValue..<ballsPerLevel {
                ballsInLevelArray[i].layer.backgroundColor = UIColor.gray.cgColor
                ballsInLevelArray[i].layer.borderColor = UIColor.black.cgColor
            }
        }
        get {
            return self.ballsLeftInLevel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .lightGray

        playingSquareWidth = view.frame.width - CGFloat( 2 * paddingWidth )
        columnWidth = playingSquareWidth / CGFloat(numberOfColumns)
        addSubviews()
        ballsLeftInLevel = ballsPerLevel
        
        
        ballsLeftInLevel = 2
    }
    
    func addSubviews() {
        
        columnStackView.addArrangedSubview(column0View)
        columnStackView.addArrangedSubview(column1View)
        columnStackView.addArrangedSubview(column2View)
        columnStackView.addArrangedSubview(column3View)
        columnStackView.addArrangedSubview(column4View)
        columnStackView.addArrangedSubview(column5View)
        columnStackView.addArrangedSubview(column6View)
        view.addSubview(columnStackView)
        columnStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        columnStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        columnStackView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -paddingWidth).isActive = true
        columnStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -paddingWidth).isActive = true
        
        
        view.addSubview(nextBallView)
        nextBallView.leftAnchor.constraint(equalTo: columnStackView.leftAnchor).isActive = true
        nextBallView.heightAnchor.constraint(equalToConstant: columnWidth).isActive = true
        nextBallView.widthAnchor.constraint(equalTo: columnStackView.widthAnchor).isActive = true
        nextBallView.bottomAnchor.constraint(equalTo: columnStackView.topAnchor, constant: paddingWidth).isActive = true
        
        view.addSubview(scoreView)
        scoreView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -paddingWidth).isActive = true
        scoreView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: paddingWidth).isActive = true
        scoreView.bottomAnchor.constraint(equalTo: nextBallView.topAnchor, constant: -paddingWidth).isActive = true
        scoreView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(ballsLeftInLevelView)
        ballsLeftInLevelView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -paddingWidth).isActive = true
        ballsLeftInLevelView.topAnchor.constraint(equalTo: columnStackView.bottomAnchor, constant: paddingWidth).isActive = true
        ballsLeftInLevelView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        ballsLeftInLevelView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addIndicatorBallsToView(ballsLeftInLevelView)
        
        view.addSubview(levelLabel)
        levelLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: paddingWidth).isActive = true
        levelLabel.topAnchor.constraint(equalTo: columnStackView.bottomAnchor, constant: paddingWidth).isActive = true
        levelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        levelLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(menuButton)
        menuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: paddingWidth).isActive = true
        menuButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -paddingWidth).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -paddingWidth).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let scoreView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.brown
        view.text = "0"
        view.textAlignment = .right
        return view
    }()
    
    let nextBallView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let columnStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fillEqually
        view.axis = .horizontal
        return view
    }()
    
    let column0View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let column1View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let column2View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let column3View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let column4View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let column5View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let column6View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let ballsLeftInLevelView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 3
        return view
    }()
    
    func addIndicatorBallsToView(_ view: UIView) {
        for _ in 0..<ballsPerLevel {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            v.layer.masksToBounds = true
            v.layer.cornerRadius = 10
            v.layer.borderWidth = 1
            v.layer.borderColor = UIColor.white.cgColor
            v.backgroundColor = .white
            ballsInLevelArray.append(v)
            ballsLeftInLevelView.addArrangedSubview(v)
        }
    }
    
    func decrementBallsToView() {

    }
    
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Level 1"
        return label
    }()

    let menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Double-tap for menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        return button
    }()
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

