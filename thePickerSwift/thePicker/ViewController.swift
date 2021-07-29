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
    
    
    init(){
        
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
    
    
    
    var dayInfo: [Int]!
    
    
    
    var jahr: Int
    
    var moon: Int
    
    
    var cnt: Int{
        dayInfo.count
    }
    
    
    var final: Int{
        dayNum(inMonth: moon, inYear: jahr)
    }
    
    
    init(jahr y: Int, month m: Int) {
        jahr = y
        moon = m
        
        
        
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
        
        
        
        dayInfo = Array(minDay...final)
    }
    
    
    subscript(idx: Int) -> String{
        
            guard idx >= 0 , idx < cnt else {
                return "Nan"
            }

            return String(dayInfo[idx])
        
    }
    
    
    
    ///
    
    
    
    mutating
    func reset(month m: Int){
        
        moon = m
        dayInfo = Array(1...final)
    }
    
    
    mutating
    func reset(jahr y: Int){
        
        jahr = y
        dayInfo = Array(1...final)
    }
    
    
    mutating
    func beCurrent(month m: Int){
        moon = m
        
        
        dayInfo = Array(minDay...final)
        
    }
    
    
    mutating
    func beCurrent(jahr y: Int){
        
        jahr = y
        
        dayInfo = Array(minDay...final)
        
    }
    
    
    ///
    
    
    
    func dayNum(inMonth m: Int, inYear y: Int) -> Int{
        
        var isrunNian = false
        if y % 4 == 0{
            if y % 100 == 0{
                isrunNian = (y % 400 == 0)
            }
            else{
                isrunNian = true
            }
        }
        
        switch m{
        case 1, 3, 5, 7, 8, 10, 12:
                return 31
        case 4, 6, 9, 11:
                return 30
        default:
                if isrunNian{
                    return 29
                }
                else{
                    return 28
                }
        }
        
    }
    
    
    
}


//


//


class ViewController: UIViewController {
    
    
    
    
    
    lazy var picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: 400, height: 320))
    
    
    let yearInfo = YearX()
    
    
    var monthInfo = MonthX()
    

    lazy var dayInfo = DayX(jahr: yearInfo.minYEAR, month: monthInfo.minMonth)
    
    
    
    var registerX = IndexRegister()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = UIColor.white
       // picker.backgroundColor = UIColor.systemPink
        
        picker.layer.borderWidth = 2
        picker.layer.borderColor = UIColor.systemPink.cgColor
        
        
        picker.delegate = self
        picker.dataSource = self
        
        
        view.addSubview(picker)
        
        
        
        
        
        
        
    }


    
    
    
    
    
    
    
    
    
}






extension ViewController: UIPickerViewDelegate{
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch component {
        case 0:
            
            // 修改年，把月也给改了
            
            registerX.year = row
            pickerView.reloadComponent(0)
            if row == 0{
                monthInfo.beCurrent()
                registerX.month = min(monthInfo.cnt - 1, registerX.month)
            }
            else{
                monthInfo.reset()
            }
            
            
            pickerView.reloadComponent(1)
            
            
            if row == 0{
                dayInfo.beCurrent(jahr: yearInfo[0].scalar)
                dayInfo.beCurrent(month: monthInfo[registerX.month].scalar)
            }
            else{
                dayInfo.reset(jahr: yearInfo[row].scalar)
            }
            
            registerX.day = min(dayInfo.cnt - 1, registerX.day) // 为了闰年
            pickerView.reloadComponent(2)
            
        case 1:
            registerX.month = row
            pickerView.reloadComponent(1)
            if registerX.year == 0, row == 0{
                dayInfo.beCurrent(month: monthInfo[0].scalar)
            }
            else{
                dayInfo.reset(month: monthInfo[row].scalar)
            }
            registerX.day = min(dayInfo.cnt - 1, registerX.day)
            pickerView.reloadComponent(2)
            
        default:
            // 2
            registerX.day = row
            pickerView.reloadComponent(2)
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
    
    
    
    
    
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        switch component {
        case 0:
            if row == registerX.year{
                return yearInfo[row].selected
            }
            else{
                return yearInfo[row].normal
            }
            
        case 1:
            if row == registerX.month{
                return monthInfo[row].selected
            }
            else{
                return monthInfo[row].normal
            }
        default:
            
            // 2
            if row == registerX.day{
                return dayInfo[row].selected
            }
            else{
                return dayInfo[row].normal
            }
        }
    }
    
    
    
    
    
}








extension String{
    var scalar: Int{
        Int(self) ?? 0
    }
    
    
    
    var selected: NSAttributedString{
        
        NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont.semibold(ofSize: 16) , NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x1A1B1C)])
        
    }
    
    
    
    var normal: NSAttributedString{
        
        NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont.regular(ofSize: 16) , NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xC3C3C3)])
        
    }
    
    
}
