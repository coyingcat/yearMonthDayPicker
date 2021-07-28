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



struct IndexRegister {
    var year = 0
    var month = 0
    var day = 0
}




struct MonthX {
    
    
    let minMonth: Int
    
    
    var monthInfo: [Int]
    
    
    
    var cnt: Int{
        monthInfo.count
    }
    
    
    
    var idxRegister = IndexRegister()
    
    
    init() {
        
        minMonth = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM"
            let time = formatter.string(from: Date())
            if let t = Int(time){
                return t
            }
            else{
                return 7
            }
        }()
        
        
        monthInfo = Array(minMonth...12)
        
    }
    
    
    
    
    mutating
    func reset(){
        
        monthInfo = Array(1...12)
        
    }
    
    
    mutating
    func beCurrent(){
        
        monthInfo = Array(minMonth...12)
        
    }
    
    
    
    subscript(idx: Int) -> String{
        
            guard idx >= 0 , idx < cnt else {
                return "Nan"
            }

            return String(monthInfo[idx])
        
    }
}







struct DayX {
    
    
    let minDay: Int
    
    
    
    var dayInfo: [Int]
    
    
    let cnt: Int
    
    
    init() {
        
        minDay = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd"
            let time = formatter.string(from: Date())
            if let t = Int(time){
                return t
            }
            else{
                return 28
            }
        }()
        
        
        
        dayInfo = Array(minDay...31)
        
        cnt = dayInfo.count
    }
    
    
    subscript(idx: Int) -> String{
        
            guard idx >= 0 , idx < cnt else {
                return "Nan"
            }

            return String(dayInfo[idx])
        
    }
    
    
    
    mutating
    func reset(){
        
        dayInfo = Array(1...31)
        
    }
    
    
    mutating
    func beCurrent(){
        
        dayInfo = Array(minDay...31)
        
    }
}





class ViewController: UIViewController {
    
    
    
    
    
    lazy var picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: 400, height: 320))
    
    
    let yearInfo = YearX()
    
    
    var monthInfo = MonthX()
    

    var dayInfo = DayX()
    
    
    
    var registerX = IndexRegister()
    
    

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
            registerX.year = row
            if row == 0{
                monthInfo.beCurrent()
            }
            else{
                monthInfo.reset()
            }
            pickerView.reloadComponent(1)
            
        case 1:
            registerX.month = row
            
        default:
            // 2
            registerX.day = row
            
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
            return monthInfo.cnt
        default:
            
            // 2
            return dayInfo.cnt
        }
        
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        switch component {
        case 0:
            return yearInfo[row]
        case 1:
            return monthInfo[row]
        default:
            
            // 2
            return dayInfo[row]
        }
        
    }
    
    
    
    
    
}
