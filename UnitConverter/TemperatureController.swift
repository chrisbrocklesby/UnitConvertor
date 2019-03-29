import UIKit

class TemperatureController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var result : Float?
    let temperatureType = ["Celsius","Fahrenheit","Kelvin"]
    var convertToSource = "Celsius"
    var convertFromSource = "Celsius"
    
    
    @IBOutlet weak var convertFrom: UIPickerView!
    @IBOutlet weak var convertTo: UIPickerView!
    @IBOutlet weak var inputTemp: UITextField!
    
    @IBAction func convertButton(_ sender: Any) {
        let inputTempFloat = (inputTemp.text! as NSString).floatValue
        
        switch convertToSource {
        case "Celsius" : result = convertToCelsius(temp: inputTempFloat, source: convertFromSource)
        case "Fahrenheit" : result = convertToFahrenheit(temp: inputTempFloat, source: convertFromSource)
        case "Kelvin" : result = convertToKelvin(temp: inputTempFloat, source: convertFromSource)
            default : result = 0
        }
        
        if  (inputTemp.text != "") {
            let alertController = UIAlertController(title: "Converted", message:
                "The result is: \(Float(result!)) \(convertToSource) ", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Close", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Problem", message:
                "Please make sure all fields are selected.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return temperatureType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == convertFrom {
            convertFromSource = String(temperatureType[row])
        }
        if pickerView == convertTo {
            convertToSource = String(temperatureType[row])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertFrom.delegate = self
        convertTo.delegate = self
        convertTo.dataSource = self
        convertFrom.dataSource = self
    }

    func convertToCelsius(temp:Float, source:String) -> Float? {
        switch source {
        case "Celsius": return temp
        case "Fahrenheit": return (temp - 32) * 5 / 9
        case "Kelvin": return temp - 273.15
        default: return nil
        }
    }
    
    func convertToFahrenheit(temp:Float, source:String) -> Float? {
        switch source {
        case "Fahrenheit": return temp
        case "Celsius": return (temp * 9 / 5) + 32
        case "Kelvin": return (temp - 273.15) * 9 / 5 + 32
        default: return nil
        }
    }
    
    func convertToKelvin(temp:Float, source:String) -> Float? {
        switch source {
        case "Kelvin": return temp
        case "Fahrenheit": return (temp - 32) * 5 / 9 + 273.15
        case "Celsius": return temp + 273.15
        default: return nil
        }
    }
    
}
