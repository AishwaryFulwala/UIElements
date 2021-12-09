//
//  Registration.swift
//  Assignment6
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    /*private let tab: UITabBar = {
        let t = UITabBar()
        let i1 = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        let i2 = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        t.items = [i1,i2]
        
        return t
    }()*/
    
    private let lbltitle : UILabel = {
        let l = UILabel()
        l.text = "Registration Form"
        l.font = l.font.withSize(30)
        return l
    }()
    
    private let lblnm : UILabel = {
        let l = UILabel()
        l.text = "Name :: "
        return l
    }()
    
    private let lbladd : UILabel = {
        let l = UILabel()
        l.text = "Address :: "
        return l
    }()
    
    private let lblcity : UILabel = {
        let l = UILabel()
        l.text = "City :: "
        return l
    }()
    
    private let lblgen : UILabel = {
        let l = UILabel()
        l.text = "Gender :: "
        return l
    }()
    
    private let lbldob : UILabel = {
        let l = UILabel()
        l.text = "Date of Birth :: "
        return l
    }()
    
    private let lblyear : UILabel = {
        let l = UILabel()
        l.text = "Year of Experience :: "
        return l
    }()
    
    private let lblsal : UILabel = {
        let l = UILabel()
        l.text = "Expected Salary :: "
        return l
    }()
    
    private let txtnm : UITextField = {
        let t = UITextField()
        t.borderStyle = .roundedRect
        return t
    }()
    
    private let tvadd : UITextView = {
        let t = UITextView()
        t.layer.borderWidth = 0.2
        t.layer.cornerRadius = 7
        
        return t
    }()
    
    private let pickcity = UIPickerView()
    private let data = ["Surat", "Varodra", "Vapi", "Gandhinager", "Bharuch", "Valsad"]
    
    private let datedob : UIDatePicker = {
        let d = UIDatePicker()
        d.datePickerMode = .date
        return d
    }()
    
    private let switchgen : UISwitch = {
        let s = UISwitch()
        s.addTarget(self, action: #selector(ison), for: .valueChanged)
        return s
    }()
    private let lblgenv : UILabel = {
        let l = UILabel()
        l.text = "Male"
        return l
    }()
    
    @objc func ison() {
        if(switchgen.isOn) {
            lblgenv.text = "Female"
        }
        else {
            lblgenv.text = "Male"
        }
    }
    
    private let stepyear : UIStepper = {
        let s = UIStepper()
        s.minimumValue = 0
        s.maximumValue = 10
        s.isContinuous = true
        s.tintColor = .lightGray
        s.addTarget(self, action: #selector(step), for: .valueChanged)
        return s
    }()
    private let lblyearv : UILabel = {
        let l = UILabel()
        l.text = "0"
        return l
    }()
    
    @objc func step() {
        lblyearv.text =  Int(stepyear.value).description
    }
    
    private let slidsal : UISlider = {
        let s = UISlider()
        s.minimumValue = 10000
        s.maximumValue = 50000
        s.addTarget(self, action: #selector(slide), for: .valueChanged)
        return s
    }()
    private let lblsalv : UILabel = {
        let l = UILabel()
        l.text = "10000"
        return l
    }()
    
    @objc func slide() {
        lblsalv.text = Int(slidsal.value).description
    }
    
    private let pro: UIProgressView = {
        let p = UIProgressView()
        p.setProgress(0.0, animated: true)
        return p
    }()
    
    private let btnregi: UIButton = {
        let b = UIButton()
        b.setTitle("Next", for: .normal)
        b.backgroundColor = .red
        b.layer.cornerRadius = 6
        b.tag = 0
        b.addTarget(self, action: #selector(click), for: .touchUpInside)
        return b
    }()
    
    @objc func click() {
        UIView.animate(withDuration: 10.0, animations: {
            self.pro.setProgress(1.0, animated: true)
        }) { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
                let alert = UIAlertController(title: "Reigstration", message: "Registration Sucessfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                self.present(alert, animated: true)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(tab)
        //tab.delegate = self
        
        view.addSubview(lbltitle)
        view.addSubview(lblnm)
        view.addSubview(lbladd)
        view.addSubview(lblcity)
        view.addSubview(lblgen)
        view.addSubview(lbldob)
        view.addSubview(lblyear)
        view.addSubview(lblsal)
        
        view.addSubview(txtnm)
        view.addSubview(tvadd)
        
        view.addSubview(pickcity)
        pickcity.dataSource = self
        pickcity.delegate = self
        
        view.addSubview(switchgen)
        view.addSubview(lblgenv)

        view.addSubview(datedob)
        
        view.addSubview(stepyear)
        view.addSubview(lblyearv)
        
        view.addSubview(slidsal)
        view.addSubview(lblsalv)
        
        view.addSubview(pro)
        view.addSubview(btnregi)
    }
    
    override func viewDidLayoutSubviews() {
        //let tabheight: CGFloat = view.safeAreaInsets.bottom + 50.0
        //tab.frame = CGRect(x: 0, y: view.height - tabheight, width: view.width, height: tabheight)
        
        let lx = CGFloat(15)
        let lw = CGFloat(150)
        let lh = CGFloat(30)
        lbltitle.frame = CGRect(x: 70, y: view.safeAreaInsets.top + 20, width: 250, height: 40)
        lblnm.frame = CGRect(x: lx, y: 150, width: lw, height: lh)
        lbladd.frame = CGRect(x: lx, y: lblnm.bottom + 10, width: lw, height: lh)
        lblcity.frame = CGRect(x: lx, y: lbladd.bottom + 40, width: lw, height: lh)
        lblgen.frame = CGRect(x: lx, y: lblcity.bottom + 20, width: lw, height: lh)
        lbldob.frame = CGRect(x: lx, y: lblgen.bottom + 20, width: lw, height: lh)
        lblyear.frame = CGRect(x: lx, y: lbldob.bottom + 20, width: lw + 10, height: lh)
        lblsal.frame = CGRect(x: lx, y: lblyear.bottom + 20, width: lw, height: lh)
        
        let cx = CGFloat(180)
        let cw = CGFloat(185)
        txtnm.frame = CGRect(x: cx, y: 150, width: cw, height: 30)
        tvadd.frame = CGRect(x: cx, y: txtnm.bottom + 10, width: cw, height: 50)
        pickcity.frame = CGRect(x: cx, y: tvadd.bottom + 10, width: cw, height: 50)
        
        switchgen.frame = CGRect(x: cx, y: pickcity.bottom + 10, width: 50, height: 20)
        lblgenv.frame = CGRect(x: cx + 60, y: pickcity.bottom + 10, width: cw, height: 30)
        
        datedob.frame = CGRect(x: cx, y: switchgen.bottom + 10, width: cw, height: 45)
        
        stepyear.frame = CGRect(x: cx, y: datedob.bottom + 15, width: cw, height: 45)
        lblyearv.frame = CGRect(x: cx + 110, y: datedob.bottom + 6, width: cw, height: 45)
        
        slidsal.frame = CGRect(x: cx, y: stepyear.bottom + 14, width: 110, height: 45)
        lblsalv.frame = CGRect(x: cx + 120, y: stepyear.bottom + 11, width: cw, height: 45)
        
        pro.frame = CGRect(x: 100, y: slidsal.bottom + 50, width: cw + 10, height: 100)
        btnregi.frame = CGRect(x: 150, y: pro.bottom + 40, width: 100, height: 35)
    }
}

/*extension Registration : UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 2) {
            let sc = Images()
            navigationController?.pushViewController(sc, animated: true)
        }
    }
}*/

extension Registration : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
