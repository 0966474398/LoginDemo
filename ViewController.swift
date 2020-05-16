//
//  ViewController.swift
//  TesstUI
//
//  Created by Nguyen Quoc Dich on 5/4/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textLable: UILabel!
    
    
    
    @IBOutlet weak var btnLogin: UIButton!
    private var isHiddenErrName = false {
        didSet {
            textLable.isHidden = isHiddenErrName
            textLable.text = "Incorrect UserName. Try again"
        }
    }
    
    private var isHiddenErrPass = false {
        didSet {
            textLable.isHidden = isHiddenErrPass
            textLable.text = "Incorrect PassWord. Try again"
        }
    }
    
    private var isHiddenErrOther = false {
        didSet {
            btnLogin.isUserInteractionEnabled = !isHiddenErrOther
            btnLogin.alpha = isHiddenErrOther == true ? 0.5 : 1
            textLable.isHidden = isHiddenErrOther
            textLable.text = "Correct \(textUserName.text!) and \(textPassword.text!)"
        }
    }
    override func viewDidLoad() {
        
        let imageText = UIImage(named: "123")
        addImage(textfield: textUserName, img: imageText!)
        let passwordImage = UIImage(named: "3")
        addImage(textfield: textPassword, img: passwordImage!)
        super.viewDidLoad()
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.cyan.cgColor, UIColor.purple.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: btnLogin.frame.size.width, height:btnLogin.frame.size.height);
        btnLogin.layer.insertSublayer(gradient, at: 0)
        btnLogin.layer.cornerRadius = 20
        btnLogin.layer.masksToBounds = true
        
        //        btnLogin.backgroundColor(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
        //        startPoint: .leading,
        //        endPoint: .trailing))
        
        
        textLable.isHidden = true
        btnLogin.isUserInteractionEnabled = false
        
        [textUserName, textPassword].forEach {
            $0?.delegate = self
            
        }        // Do any additional setup after loading the view.
    }
    func addImage(textfield: UITextField,img: UIImage){
        let uiView = UIView()
        let imageViewText = UIImageView()
        imageViewText.frame = CGRect(x: 7.5, y: 7.5, width: 15, height: 15)
        
        imageViewText.image = img
        uiView.addSubview(imageViewText)
        
        textfield.leftView = uiView
        uiView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //uiView.backgroundColor = UIColor.red
        
        textfield.leftViewMode = .always
    }
    
    
    
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textUserName == textField {
            let isValidateUserName = text.isValidate(.userName)
            self.isHiddenErrName = isValidateUserName
            
        } else if textPassword == textField  {
            let isValidatePassWord = text.isValidate(.passWord)
            self.isHiddenErrPass = isValidatePassWord
        } else if textUserName == textField && textPassword == textField {
            isHiddenErrOther = false        
        }
        //        if  {
        //            let isOther = isHiddenErrName && isHiddenErrPass
        //            self.isHiddenErrOther = !isOther
        //        }
        //        let isOther = isHiddenErrName && isHiddenErrPass
        //        isHiddenErrOther = !isOther
        
        return true
    }
}
