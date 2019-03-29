import UIKit

class VolumeController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var result : Float?
    let volumeType = ["Litre","Millilitre","Gallon"]
    var convertToSource = "Litre"
    var convertFromSource = "Litre"
    
    
    @IBOutlet weak var convertFrom: UIPickerView!
    @IBOutlet weak var convertTo: UIPickerView!
    @IBOutlet weak var inputVolume: UITextField!
    
    @IBAction func convertButton(_ sender: Any) {
        let inputVolumeFloat = (inputVolume.text! as NSString).floatValue
        
        switch convertToSource {
        case "Litre" : result = convertToLitre(volume: inputVolumeFloat, source: convertFromSource)
        case "Millilitre" : result = convertToMillilitre(volume: inputVolumeFloat, source: convertFromSource)
        case "Gallon" : result = convertToGallon(volume: inputVolumeFloat, source: convertFromSource)
        default : result = 0
        }
        
        if (inputVolume.text != "") {
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
        return volumeType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return volumeType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == convertFrom {
            convertFromSource = String(volumeType[row])
        }
        if pickerView == convertTo {
            convertToSource = String(volumeType[row])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertFrom.delegate = self
        convertTo.delegate = self
        convertTo.dataSource = self
        convertFrom.dataSource = self
    }
    
    func convertToLitre(volume:Float, source:String) -> Float? {
        switch source {
        case "Litre": return volume
        case "Millilitre": return volume / 1000
        case "Gallon": return volume * 3.785
        default: return nil
        }
    }
    
    func convertToMillilitre(volume:Float, source:String) -> Float? {
        switch source {
        case "Millilitre": return volume
        case "Litre": return volume * 1000
        case "Gallon": return volume * 3785.412
        default: return nil
        }
    }
    
    func convertToGallon(volume:Float, source:String) -> Float? {
        switch source {
        case "Gallon": return volume
        case "Millilitre": return volume / 3785.412
        case "Litre": return volume / 3.785
        default: return nil
        }
    
}
}
