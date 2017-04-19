//
//  CustomViews.swift
//  Number Drop
//
//  Created by Blake Clough on 4/18/17.
//  Copyright © 2017 Blake Clough. All rights reserved.
//

import UIKit

class NumberBall: UITextView {
    

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        addBehavior()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addBehavior() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.text = "1"
    }
}

enum BallNumber: Int {
    case one = 1, two, three, four, five, six, seven
}
