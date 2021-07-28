//
//  ViewController.swift
//  thePicker
//
//  Created by Jz D on 2021/7/28.
//

import UIKit






struct YearX {
    
    
    let minYEAR: Int
    
    
    
    let yearInfo: [Int]
    
    
    let cnt: Int
    
    
    init() {
        
        minYEAR = { () -> Int in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            let time = formatter.string(from: Date())
            if let t = Int(time){
                return t
            }
            else{
                return 2021
            }
        }()
        
        
        
        
        yearInfo = Array(minYEAR...2030)
        
        cnt = yearInfo.count
    }
    
    
    subscript(idx: Int) -> String{
        
            guard idx >= 0 , idx < cnt else {
                return "Nan"
            }

            return String(yearInfo[idx])
        
    }
    
    
}










class ViewController: UIViewController {
    
    
    
    
    
    lazy var picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: 400, height: 320))
    
    
    let yearInfo = YearX()
    
    
    

    var minMonth: Int{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let time = formatter.string(from: Date())
        if let t = Int(time){
            return t
        }
        else{
            return 7
        }
    }



    var minDay: Int{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let time = formatter.string(from: Date())
        if let t = Int(time){
            return t
        }
        else{
            return 28
        }
    }
    
    
    var monthInfo: [Int] = Array(1...12)
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = UIColor.white
        picker.backgroundColor = UIColor.systemPink
        
        
        
        
        picker.delegate = self
        picker.dataSource = self
        
        
        view.addSubview(picker)
        
        
        
        
        
        
        
    }


    
    
    
    
    
    
    
    
    
}






extension ViewController: UIPickerViewDelegate{
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        switch component {
        case 0:
            
            if row == 0{
                
            }
            else{
                
            }
            
        case 1:
            
            ()
        default:
            // 2
        
            ()
        }
        
        
        
        
    }
    
    
    
    
    
}




extension ViewController: UIPickerViewDataSource{
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
        
    }
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        switch component {
        case 0:
            return yearInfo.cnt
        case 1:
            return monthInfo.count
        default:
            
            // 2
            return 10
        }
        
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        switch component {
        case 0:
            return yearInfo[row]
        case 1:
            return String(monthInfo[row])
        default:
            
            // 2
            return "哈    哈"
        }
        
    }
    
    
    
    
    
}
