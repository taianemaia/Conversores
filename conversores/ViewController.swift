//
//  ViewController.swift
//  conversores
//
//  Created by user140090 on 8/20/18.
//  Copyright © 2018 Taiane Maia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distancia"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilometro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Fahrenheit", for: .normal)
        }
    }
    
    @IBAction func convert(_ sender: UIButton) {
        if sender == btUnit1 {
            btUnit2.alpha = 0.5
        } else {
            btUnit1.alpha = 0.5
        }
        sender.alpha = 1.0
        
        switch lbUnit.text {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = btUnit2.currentTitle!
            lbResult.text = String(temperature * 1.8 + 32)
        } else {
            lbResultUnit.text = btUnit1.currentTitle!
            lbResult.text = String((temperature - 32) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = btUnit2.currentTitle!
            lbResult.text = String(weight / 2.2046)
        } else {
            lbResultUnit.text = btUnit1.currentTitle!
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = btUnit2.currentTitle!
            lbResult.text = String(currency * 3.5)
        } else {
            lbResultUnit.text = btUnit1.currentTitle!
            lbResult.text = String(currency / 3.5)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = btUnit2.currentTitle!
            lbResult.text = String(distance / 1000.0)
        } else {
            lbResultUnit.text = btUnit1.currentTitle!
            lbResult.text = String(distance * 1000.0)
        }
    }
}

