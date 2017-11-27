//
//  SignIn.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/16/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit
import Firebase

class SignIn: UITableViewController,UINavigationControllerDelegate,UITextFieldDelegate {
 
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    //CHANGE STATUS BAR TO DEFAULT
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    //TAP ON THE APP OUTSIDE KEYBOARD
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //TAP ON RETURN BUTTON
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    //SET UP SPINNER AND PAUSE THE APP
    func Spinner() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    @IBAction func ForgotPasswordPressed(_ sender: Any) {
        guard let email = EmailTextField.text,
            email != ""
            else {
                AlertController.showAlert(_inViewController: self, title: "Error", message: "Please enter a valid email")
                return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            guard error == nil else {
                AlertController.showAlert(_inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            //IF NO ERROR CONFORMATION EMAIL SENT
            AlertController.showAlert(_inViewController: self, title: "Sent", message: "A reset link has been sent to " + email)
        }
    }
    
    @IBAction func SignInPressed(_ sender: Any) {
        
        guard let email = EmailTextField.text,
        email != "",
        let password = PasswordTextField.text,
        password != ""
            else {
                AlertController.showAlert(_inViewController: self, title: "Missing Infor", message: "Please fill out all required fields")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
           
            guard error == nil else {
                AlertController.showAlert(_inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
             self.Spinner()
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName ?? "MISSING DISPLAY NAME")
            print(user.uid)
            
            self.performSegue(withIdentifier: "signIn", sender: nil)
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    
    
    
}
