//tested on iPhone 15 Pro

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculatorButton(_ sender: UIButton) {
        calculateResult()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.placeholder = "შეიყვანეთ მნიშვნელობა"
        textField2.placeholder = "შეიყვანეთ მნიშვნელობა"
    }
    
    @IBAction func calculateButton(sender: UIButton) {
        calculateResult()
    }
    
    @IBAction func switchButton(sender: UISwitch) {
        if sender.isOn {
            output.text = "უმცირესი საერთო ჯერადი"
        } else {
            output.text = "უდიდესი საერთო გამყოფი"
        }
    }
    
    func calculateResult() {
        guard let number1Text = textField1.text,
              let number2Text = textField2.text,
              let number1 = Int(number1Text),
              let number2 = Int(number2Text) else {
            resultLabel.text = "შეიყვანეთ რიცხვითი მნიშვნელობა!"
            return
        }
        
        if output.text == "უმცირესი საერთო ჯერადი" {
            resultLabel.text = "პასუხი: \(lcm(number1, number2))"
        } else {
            resultLabel.text = "პასუხი: \(gcd(number1, number2))"
        }
        
    }
    
    func lcm(_ a: Int, _ b: Int) -> Int {
        return (a / gcd(a, b) * b)
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
}




