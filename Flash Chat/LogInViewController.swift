//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController, UITextFieldDelegate {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        
        emailTextfield.returnKeyType = .done
        passwordTextfield.returnKeyType = .done
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        SVProgressHUD.show()
        
        let auth = Auth.auth()
        auth.signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            [weak self]
            (user, error) in
            
            if error != nil
            {
                print(error!)
            }
            else
            {
                print("Log in is sucessfull")
                
                SVProgressHUD.dismiss()
                
                self?.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}  
