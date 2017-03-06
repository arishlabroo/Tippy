
import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var defaultTipPicker: UIPickerView!
    var tipOptions = [18, 20, 25]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaultTipPicker.delegate = self
        defaultTipPicker.dataSource = self
        
        let defaults = UserDefaults.standard
        
        let selected = defaults.object(forKey: "tipDefault")
        
        if ( selected != nil) {
            let row = tipOptions.index(of: (selected as! Int)) ?? 0
            defaultTipPicker.selectRow(row, inComponent: 0, animated: false)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(tipOptions[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let defaults = UserDefaults.standard
        defaults.set(tipOptions[row], forKey: "tipDefault")
        defaults.synchronize()
    }
}
