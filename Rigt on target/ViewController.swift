//
//  ViewController.swift
//  Rigt on target
//
//  Created by Aleksandr Luchinin on 01.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func numberButton(_ sender: Any) {
        
        if round == 0 {
            number = Int.random(in: 1...50)
            numberLabel.text = String(number)
            round = 1
        } else {
            let numSlider = Int(mySlider.value.rounded())
            
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 50 {
                
                let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil); self.round = 1
                self.points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            numberLabel.text = String(number)
            }
            
        }
    }


