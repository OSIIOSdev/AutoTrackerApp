//
//  ViewController.swift
//  AutoTrackerApp
//
//  Created by OSIIOSdev on 04.03.2024.
//

import UIKit

final class LogInViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet var logInLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    @IBOutlet var logInTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var registrationButton: UIButton!
    @IBOutlet var forgotLoginPasswordButton: UIButton!
    @IBOutlet var supportContactButton: UIButton!
    
    // MARK: - Private Properties
    private let user = "theCoursive"
    private let password = "1"
    
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIFont()
        setupUILayer { setupButtonConfiguration() }
        setupUILayer { setupTextFieldConfiguration() }
        
        print("Высота вью: \(String(describing: view.superview?.frame.height))")
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBar.viewControllers else { return }
        
        for viewController in viewControllers {
            if let navigationViewController = viewController as? UINavigationController {
                guard let mainViewController = navigationViewController.topViewController as? MainViewController else { return }
                
                mainViewController.user = user
            }
        }
    }
    
    // MARK: - @IBAction Methods
    @IBAction func logInButtonPressed() {
        guard logInTextField.text == user, passwordTextField.text == password else {
            showAlert(title: "Неверный логин или пароль", message: "Введите корректные данные")
            passwordTextField.text = ""
            
            return
        }
        
        performSegue(withIdentifier: "openMainViewController", sender: nil)
    }
    
    // MARK: - Private Methods
    private func setupUIFont() {
        let elements = [logInLabel, passwordLabel,
                        logInTextField, passwordTextField,
                        logInButton, registrationButton,
                        forgotLoginPasswordButton, supportContactButton]
        
        let font = UIFont(name: "TTNorms-Medium", size: 18)
        
        for element in elements {
            switch element {
            case logInLabel, passwordLabel:
                guard let label = element as? UILabel else { return }
                label.font = font
            case logInTextField, passwordTextField:
                guard let textField = element as? UITextField else { return }
                textField.font = font
            case logInButton, registrationButton, forgotLoginPasswordButton, supportContactButton:
                guard let button = element as? UIButton else { return }
                button.titleLabel?.font = font
            default:
                return
            }
        }
    }
        
    private func setupUILayer(UIElement: ()->()) {
        let elements = [logInButton, registrationButton, logInTextField, passwordTextField]
        
        for element in elements {
            switch element {
            case logInButton, registrationButton:
                guard let button = element as? UIButton else { return }
                    button.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    button.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
                    button.layer.shadowOpacity = 0.25
                    button.layer.shadowRadius = 5.0
                    button.layer.masksToBounds = false
                
                    UIElement()
            case logInTextField, passwordTextField:
                guard let textField = element as? UITextField else { return }
                    textField.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    textField.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
                    textField.layer.shadowOpacity = 0.25
                    textField.layer.shadowRadius = 5.0
                    textField.layer.masksToBounds = false
                
                    UIElement()
            default:
                return
            }
        }
    }
    
    private func setupTextFieldConfiguration() {
        let textFields = [logInTextField, passwordTextField]
        
        for textField in textFields {
            textField?.tintColor = #colorLiteral(red: 0.6866500378, green: 0.2395903766, blue: 0.2382137775, alpha: 1)
        }
    }
        
    private func setupButtonConfiguration() {
        let buttons = [logInButton, registrationButton]
        
        for button in buttons {
            button?.layer.cornerRadius = 10
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
