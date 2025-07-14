//
//  GameViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/12/25.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var maxNumberTextField: UITextField!
    @IBOutlet var tappableView: UIView!
    @IBOutlet var gameTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    
    var stringNumberList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetting()
    }
    
    func uiSetting() {
        maxNumberTextField.textColor = .accent
        maxNumberTextField.layer.borderWidth = 1
        maxNumberTextField.layer.borderColor = UIColor.accent.cgColor
        maxNumberTextField.attributedPlaceholder = NSAttributedString(string: "최대 숫자를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        
        gameTextView.text = ""
        gameTextView.isEditable = false
        gameTextView.isScrollEnabled = true
        gameTextView.textColor = .accent
        
        resultLabel.text = ""
        
    }

    @IBAction func maxNumberTextFieldDidEndOnExit(_ sender: UITextField) {
        gameLogic()
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        gameLogic()
    }
    
    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        tappableView.endEditing(true)
    }
    
    func gameLogic() {
        stringNumberList.removeAll()
        
        let clapNumbers: [String] = ["3", "6", "9"]
        var claplist: [String] = []
        
        if Int(maxNumberTextField.text ?? "") != nil {
            for number in 1...Int(maxNumberTextField.text!)! {
                stringNumberList.append(String(number))
            }
            
            for i in 0..<stringNumberList.count {
                for j in 0..<clapNumbers.count {
                    if stringNumberList[i].contains(clapNumbers[j]) {
                        stringNumberList[i] = stringNumberList[i].replacingOccurrences(of: clapNumbers[j], with: "👏")
                        claplist.append(stringNumberList[i])
                    }
                }
            }
            gameTextView.text = stringNumberList.joined(separator: ", ")
            
            resultLabel.text = "숫자 \(maxNumberTextField.text!)까지 총 박수는 \(claplist.count)번 입니다."
            
        } else {
            maxNumberTextField.text = nil
            maxNumberTextField.attributedPlaceholder = NSAttributedString(string: "숫자만 입력해주세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            gameTextView.text = nil
            resultLabel.text = nil
        }
    }
}
