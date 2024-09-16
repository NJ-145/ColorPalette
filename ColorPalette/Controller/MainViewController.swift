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
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISettings()
        
    }
    
    // MARK: - UI Settings
    
    func UISettings() {
        txvRed.delegate = self
        txvBlue.delegate = self
        txvGreen.delegate = self
        
        //設定滑桿最大最小值
        sldRed.minimumValue = 0
        sldRed.maximumValue = 255
        sldRed.isContinuous = true
        sldRed.value = 0
        
        //設定滑桿最大最小值
        sldGreen.minimumValue = 0
        sldGreen.maximumValue = 255
        sldGreen.isContinuous = true
        sldGreen.value = 0

        
        //設定滑桿最大最小值
        sldBlue.minimumValue = 0
        sldBlue.maximumValue = 255
        sldBlue.isContinuous = true
        sldBlue.value = 0
    }
    
    // MARK: - IBAction
    
    //控制紅色的TextField輸入的數值如果超過255,直接變成255
    @IBAction func limitationsRad(_ sender: Any) {
        if let text = txvRed.text, let number = Int(text){
            if number > 255{
                txvRed.text = "255"
            }
        }
    }
    
    //控制綠色的TextField輸入的數值,如果超過255,直接變成255
    @IBAction func limitationGreen(_ sender: Any) {
        if let text = txvGreen.text, let number = Int(text){
            if number > 255{
                txvGreen.text = "255"
            }
        }
    }
    
    //控制藍色的TextField輸入的數值,如果超過255,直接變成255
    @IBAction func limitationBlue(_ sender: Any) {
        if let text = txvBlue.text, let number = Int(text){
            if number > 255{
                txvBlue.text = "255"
            }
        }
    }
    
    // 取得滑竿值並更新對應的 TextField
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if sender == sldRed {
            txvRed.text = String(Int(sender.value))
        }
        else if sender == sldGreen {
            txvGreen.text = String(Int(sender.value))
        } else if sender == sldBlue {
            txvBlue.text = String(Int(sender.value))
        }
    }
    
    //調色盤顏色跟著滑桿數值變動
    @IBAction func sliderSum(_ sender: Any){
        vPalette.backgroundColor = UIColor(
            red: CGFloat((sldRed.value)/255),
            green: CGFloat((sldGreen.value)/255),
            blue: CGFloat((sldBlue.value)/255),
            alpha: 1)
    }
    
    //輸入的數值輸入
    @IBAction func doRedText(_ sender: Any) {
        if let redStringValue = txvRed.text{
            if let redIntValue = Int(redStringValue){
                sldRed.setValue(Float(redIntValue), animated: true)
            }
        }
    }
    
    //輸入的數值輸入
    @IBAction func doGreenText(_ sender: Any) {
        if let greenStringValue = txvGreen.text{
            if let greenIntValue = Int(greenStringValue){
                sldGreen.setValue(Float(greenIntValue), animated: true)
            }
        }
    }
    
    //輸入的數值輸入
    @IBAction func doBlueText(_ sender: Any) {
        if let blueStringValue = txvBlue.text{
            if let blueIntValue = Int(blueStringValue){
                sldBlue.setValue(Float(blueIntValue), animated: true)
            }
        }
    }
    
    // MARK: - Function
    
    //限制輸入匡只能輸入數字
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
}
