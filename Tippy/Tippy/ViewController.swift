
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [18, 20, 25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        let selected = defaults.object(forKey: "tipDefault")
        
        if ( selected != nil) {
            let index = tipPercentages.index(of: (selected as! Int)) ?? 0
            tipControl.selectedSegmentIndex = index
        }
        calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        let tipInPercent = (Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100)
        let tip = bill * (tipInPercent)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip) //"$\(tip)"
        totalLabel.text = String(format: "$%.2f", total)
    }
}

