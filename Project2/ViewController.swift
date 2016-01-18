//
//  ViewController.swift
//  Project2
//
//  Created by Alain Gall on 17/01/2016.
//  Copyright © 2016 Alain Gall. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController:


    UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        askQuestion()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func askQuestion(action: UIAlertAction! = nil){
        title = countries[correctAnswer].uppercaseString
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        var title: String
        if sender.tag == correctAnswer{
            title = "correct"
            ++score
        }
        else{
            title = "wrong"
            --score
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
            presentViewController(ac,animated: true,completion:
 nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

