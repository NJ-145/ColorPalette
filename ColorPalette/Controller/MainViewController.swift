//
//  MainViewController.swift
//  ColorPalette
//
//  Created by imac-2626 on 2024/9/10.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet var vPalette: UIView!
    
    @IBOutlet var sldRed: UISlider!
    
    @IBOutlet var sldGreen: UISlider!
    
    @IBOutlet var sldBlue: UISlider!
    
    @IBOutlet var txvRed: UITextField!
    
    @IBOutlet var txvGreen: UITextField!
    
    @IBOutlet var txvBlue: UITextField!
    
    
    // MARK: - Property
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //vPalette.backgroundColor = UIColor.gray
        
        txvRed.delegate = self
        txvBlue.delegate = self
        txvGreen.delegate = self
        
        sldRed.minimumValue = 0
        sldRed.maximumValue = 255
        sldRed.isContinuous = true
        sldRed.value = 0
//        sldRed.addTarget(self, action: #selector(sldRedValueChanged(_:)), for: .valueChanged)
//        sldRed.addTarget(self, action:
//            #selector(sliderSum(_:)), for: .valueChanged)
        /*sldRed.addTarget(
         Any?, action: Selector,
         for: UIControl.Event)*/
        
        sldGreen.minimumValue = 0
        sldGreen.maximumValue = 255
        sldGreen.isContinuous = true
        sldGreen.value = 0
//        sldGreen.addTarget(self, action:
//            #selector(sldGreenValueChanged(_:)), for: .valueChanged)
//        sldGreen.addTarget(self, action:
//            #selector(sliderSum(_:)), for: .valueChanged)
        
        
        sldBlue.minimumValue = 0
        sldBlue.maximumValue = 255
        sldBlue.isContinuous = true
        sldBlue.value = 0
//        sldBlue.addTarget(self, action: #selector(sldBlueValueChanged(_:)), for: .valueChanged)
//        sldBlue.addTarget(self, action:
//            #selector(sliderSum(_:)), for: .valueChanged)
        
    }
    
//    @IBAction func sldGreenValueChanged(_ sender: UISlider) {
//        if sender == sldGreen {
//            txvGreen.text = String(Int(sender.value))
//        }
//    }
//    
//    @IBAction func sldBlueValueChanged(_ sender: UISlider) {
//        if sender == sldBlue {
//            txvBlue.text = String(Int(sender.value))
//        }
//    }
//    
//    @IBAction func sldRedValueChanged(_ sender: UISlider) {
//        if sender == sldRed {
//            txvRed.text = String(Int(sender.value))
//        }
//    }
    func textField(_ textField:UITextField,shouldChangeCharactersIn range:NSRange,replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if !allowedCharacters.isSuperset(of: characterSet){
            return false
        }
        
        let currentText = (textField.text ?? "") as NSString
        let newString = currentText.replacingCharacters(in: range, with: string)
        
        if let number = Int(newString), number >= 0{
            return true
        } else if newString.isEmpty{
            return true
        } else{
            return false
        }
    }
    
    @IBAction func limitationsRad(_ sender: Any) {
        if let text = txvRed.text, let number = Int(text){
            if number > 255{
                txvRed.text = "255"
            }
        }
    }
    
    @IBAction func limitationGreen(_ sender: Any) {
        if let text = txvGreen.text, let number = Int(text){
            if number > 255{
                txvGreen.text = "255"
            }
        }
    }
    
    @IBAction func limitationBlue(_ sender: Any) {
        if let text = txvBlue.text, let number = Int(text){
            if number > 255{
                txvBlue.text = "255"
            }
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // 取得滑竿值並更新對應的 TextField
        if sender == sldRed {
            txvRed.text = String(Int(sender.value))
        }
        else if sender == sldGreen {
            txvGreen.text = String(Int(sender.value))
        } else if sender == sldBlue {
            txvBlue.text = String(Int(sender.value))
        }
    }
    /*@IBAction func sliderToText(_ sender: UISlider){
        txvRed.text = "\(Int(sldRed.value))"
        txvGreen.text = "\(Int(sldGreen.value))"
        txvBlue.text = "\(Int(sldBlue.value))"
        }*/
    @IBAction func sliderSum(_ sender: Any){
        vPalette.backgroundColor = UIColor(
            red: CGFloat((sldRed.value)/255),
            green: CGFloat((sldGreen.value)/255),
            blue: CGFloat((sldBlue.value)/255),
            alpha: 1)
    }
    
    
    @IBAction func doRedText(_ sender: Any) {
        if let redStringValue = txvRed.text{
            if let redIntValue = Int(redStringValue){
                sldRed.setValue(Float(redIntValue), animated: true)
            }
        }
    }
    
    
    @IBAction func doGreenText(_ sender: Any) {
        if let greenStringValue = txvGreen.text{
            if let greenIntValue = Int(greenStringValue){
                sldGreen.setValue(Float(greenIntValue), animated: true)
            }
        }
    }
    
    
    @IBAction func doBlueText(_ sender: Any) {
        if let blueStringValue = txvBlue.text{
            if let blueIntValue = Int(blueStringValue){
                sldBlue.setValue(Float(blueIntValue), animated: true)
            }
        }
    }
    
    /*@IBAction func textToSlider(_ sender: UITextField){
        if let redStringValue = txvRed.text{
            if let redIntValue = Int(redStringValue){
                sldRed.setValue(Float(redIntValue), animated: true)
            }
        }
        if let greenStringValue = txvGreen.text{
            if let greenIntValue = Int(greenStringValue){
                sldGreen.setValue(Float(greenIntValue), animated: true)
            }
        }
        if let blueStringValue = txvBlue.text{
            if let blueIntValue = Int(blueStringValue){
                sldBlue.setValue(Float(blueIntValue), animated: true)
            }
        }
    }*/
    
        // MARK: - UI Settings
        
        // MARK: - IBAction
        
        // MARK: - Function
        
    
    // MARK: - Extensions
    
}
