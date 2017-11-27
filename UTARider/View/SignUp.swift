//
//  SignUp.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/16/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit
import Firebase

class SignUp: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var ProfileImage: UIImageView!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var UserNameTextField: UITextField!
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
    // TO DO: need to set image to the imageView
    @IBAction func SelectProfileImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ProfileImage.image = image
        }
        else{
            AlertController.showAlert(_inViewController: self, title: "Error", message: "Unable to select image")
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        
        guard let username = UserNameTextField.text,
        username != "",
        let email = EmailTextField.text,
        email != "",
        let password = PasswordTextField.text,
        password != ""
            else {
                AlertController.showAlert(_inViewController: self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        //CREATE A NEW USER
        Auth.auth().createUser(withEmail: email, password: password, completion:  { (user, error) in
            
            guard error == nil else {
                AlertController.showAlert(_inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            self.Spinner()
            guard let user = user  else {return}
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
         //SAVE INFORMATION FROM THE USER
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else{
                    AlertController.showAlert(_inViewController: self, title: "Error", message: error!.localizedDescription)
                    return
                }
                //SIGN THE USER IN TO THE APP
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    guard error == nil else {
                        AlertController.showAlert(_inViewController: self, title: "Error", message: "Unable to sign the user in")
                        return
                    }
                    self.performSegue(withIdentifier: "signUp", sender: nil)
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                })
         
            })
        })
    }// END OF CREATE NEW ACCOUNT
    
    
}
