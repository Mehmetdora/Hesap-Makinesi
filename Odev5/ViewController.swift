//
//  ViewController.swift
//  Odev5
//
//  Created by Mehmet Dora on 12.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var acOL: UIButton!
    @IBOutlet weak var bölüOL: UIButton!
    @IBOutlet weak var yediOL: UIButton!
    @IBOutlet weak var sekizOL: UIButton!
    @IBOutlet weak var dokuzOL: UIButton!
    @IBOutlet weak var çarpıOL: UIButton!
    @IBOutlet weak var dörtOL: UIButton!
    @IBOutlet weak var beşOL: UIButton!
    @IBOutlet weak var altıOL: UIButton!
    @IBOutlet weak var eksiOL: UIButton!
    @IBOutlet weak var birOL: UIButton!
    @IBOutlet weak var ikiOL: UIButton!
    @IBOutlet weak var üçOL: UIButton!
    @IBOutlet weak var artıOL: UIButton!
    @IBOutlet weak var sıfırOL: UIButton!
    @IBOutlet weak var eşittirOL: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteOL: UIButton!
    
    var işlemSeçildiMi = false
    var işlemString = ""
    var işlem = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
        
        
    }

    func setView(){
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "\t\(işlemString)\t"
        
        acOL.backgroundColor = .lightGray
        acOL.tintColor = .black
        acOL.layer.cornerRadius = 40
        deleteOL.backgroundColor = .lightGray
        deleteOL.tintColor = .black
        deleteOL.layer.cornerRadius = 40
        
        setSubView(sender: bölüOL)
        setSubView(sender: yediOL)
        setSubView(sender: sekizOL)
        setSubView(sender: dokuzOL)
        setSubView(sender: çarpıOL)
        setSubView(sender: dörtOL)
        setSubView(sender: beşOL)
        setSubView(sender: altıOL)
        setSubView(sender: eksiOL)
        setSubView(sender: birOL)
        setSubView(sender: ikiOL)
        setSubView(sender: üçOL)
        setSubView(sender: artıOL)
        setSubView(sender: sıfırOL)
        setSubView(sender: eşittirOL)

        birOL.alpha = 0
        ikiOL.alpha = 0
        üçOL.alpha = 0
        dörtOL.alpha = 0
        beşOL.alpha = 0
        altıOL.alpha = 0
        yediOL.alpha = 0
        sekizOL.alpha = 0
        dokuzOL.alpha = 0

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.yediOL.alpha = 1.0
        }, completion: {_ in
            UIView.animate(withDuration: 0.3, animations: {
                self.dörtOL.alpha = 1.0
                self.sekizOL.alpha = 1.0
            }, completion: {_ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.birOL.alpha = 1.0
                    self.beşOL.alpha = 1.0
                    self.dokuzOL.alpha = 1.0
                }, completion: {_ in 
                    UIView.animate(withDuration: 0.3, animations: {
                        self.ikiOL.alpha = 1.0
                        self.altıOL.alpha = 1.0
                    }, completion: {_ in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.üçOL.alpha = 1.0
                        })
                    })
                })
            })
        })
    }
    
    
    func parseString(string : String) -> String{
        // 234/45
        // 234/
        // 234
        
        var sonuç = ""
        var parsedData = string.components(separatedBy: işlem)
        
        if parsedData.count == 1{  // ekranda sadece sayı varsa
            // sayıları temizle
        }else if parsedData.count > 1 && parsedData[1] == ""{
            switch işlem {
            case "+":
                sonuç = String(Double(parsedData[0])! + Double(parsedData[0])!)
            case "-":
                sonuç = String(Double(parsedData[0])! - Double(parsedData[0])!)
            case "x":
                sonuç = String(Double(parsedData[0])! * Double(parsedData[0])!)
            case "÷":
                sonuç = String(Double(parsedData[0])! / Double(parsedData[0])!)
            default:
                label.text = "Error!\t"
            }
        }else if parsedData.count > 1 && parsedData[1] != ""{
            switch işlem {
            case "+":
                sonuç = String(Double(parsedData[0])! + Double(parsedData[1])!)
            case "-":
                sonuç = String(Double(parsedData[0])! - Double(parsedData[1])!)
            case "x":
                sonuç = String(Double(parsedData[0])! * Double(parsedData[1])!)
            case "÷":
                sonuç = String(Double(parsedData[0])! / Double(parsedData[1])!)
            default:
                label.text = "Error!\t"
            }
        }
        
        işlemString = sonuç
        if sonuç == ""{
            işlemString = ""
            return "0"
        }else{
            return sonuç
        }
    }
    
    
    func setSubView(sender:UIButton){
        sender.tintColor = .white
        sender.layer.cornerRadius = 40
        sender.backgroundColor = .darkGray
        let t = sender.titleLabel?.text
        if t == "÷" || t == "x" || t == "+" || t == "-" || t == "=" {
            sender.backgroundColor = .orange
        }
    }
    
    func setAnimation(button:UIButton){
        UIView.animate(withDuration: 0.5, animations: {
            button.backgroundColor = .white
            button.tintColor = .orange
        })
    }
    
    func resetAnimation(sender:UIButton){
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .orange
            sender.tintColor = .white
        })
    }
    
    
    
    
    

    @IBAction func bölmeButton(_ sender:UIButton){
        
        if !işlemString.isEmpty{
            
            setAnimation(button:sender)
            
            if artıOL.tintColor == .orange{
                resetAnimation(sender: artıOL)
            }else if eksiOL.tintColor == .orange{
                resetAnimation(sender: eksiOL)
            }else if çarpıOL.tintColor == .orange{
                resetAnimation(sender: çarpıOL)
            }
            
            if işlemString != ""{
                var işlemler = işlemString.components(separatedBy: işlem)
                if işlemler.count > 1 && işlemler[1] != ""{
                    
                    let sonuc = Double(parseString(string: işlemString))!
                    if sonuc >= 1000000000000.0{
                        label.text = "\tİşlem Limitine Ulaşıldı!\t"
                    }else{
                        label.text = "\t\(String(sonuc))\t"
                    }
                }
            }
            
            işlem = "÷"
            if işlemString.last != "+" && işlemString.last != "-" && işlemString.last != "x" && işlemString.last != "÷" && işlemString.last != ","{
                
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }else if işlemString.last == "÷"{
                // hiçbir şey yapma
            }else{
                
                işlemString.removeLast()
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }
        }
    }
    @IBAction func çıkarmaButton(_ sender:UIButton){
        
        if !işlemString.isEmpty{
            
            setAnimation(button: sender)
            
            if bölüOL.tintColor == .orange{
                resetAnimation(sender: bölüOL)
            }else if artıOL.tintColor == .orange{
                resetAnimation(sender: artıOL)
            }else if çarpıOL.tintColor == .orange{
                resetAnimation(sender: çarpıOL)
            }
            
            if işlemString != ""{
                var işlemler = işlemString.components(separatedBy: işlem)
                if işlemler.count > 1 && işlemler[1] != ""{
                    
                    let sonuc = Double(parseString(string: işlemString))!
                    if sonuc >= 1000000000000.0{
                        label.text = "\tİşlem Limitine Ulaşıldı!\t"
                    }else{
                        label.text = "\t\(String(sonuc))\t"
                    }
                }
            }
            
            işlem = "-"
            if işlemString.last != "+" && işlemString.last != "-" && işlemString.last != "x" && işlemString.last != "÷" && işlemString.last != ","{
                
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }else if işlemString.last == "-"{
                // hiçbir şey yapma
            }else{
                
                işlemString.removeLast()
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }
        }
    }
    @IBAction func toplamaButton(_ sender:UIButton){
      
        if !işlemString.isEmpty{
            
            setAnimation(button: sender)
            
            if bölüOL.tintColor == .orange{
                resetAnimation(sender: bölüOL)
            }else if eksiOL.tintColor == .orange{
                resetAnimation(sender: eksiOL)
            }else if çarpıOL.tintColor == .orange{
                resetAnimation(sender: çarpıOL)
            }
            
            if işlemString != ""{
                var işlemler = işlemString.components(separatedBy: işlem)
                if işlemler.count > 1 && işlemler[1] != ""{
                    
                    let sonuc = Double(parseString(string: işlemString))!
                    if sonuc >= 1000000000000.0{
                        label.text = "\tİşlem Limitine Ulaşıldı!\t"
                    }else{
                        label.text = "\t\(String(sonuc))\t"
                    }
                }
            }
            
            işlem = "+"
            if işlemString.last != "+" && işlemString.last != "-" && işlemString.last != "x" && işlemString.last != "÷" && işlemString.last != ","{
                
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }else if işlemString.last == "+"{
                // hiçbir şey yapma
            }else{
                
                işlemString.removeLast()
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }
        }
    }
    
    
    
    
    
    
    
    @IBAction func eşittirButton(_ sender:UIButton){
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .white
            sender.tintColor = .orange
        })
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .orange
            sender.tintColor = .white
        })
        
        if işlemString != ""{
            let sonuc = Double(parseString(string: işlemString))!
            if sonuc >= 1000000000000.0{
                label.text = "\tİşlem Limitine Ulaşıldı!\t"
            }else{
                label.text = "\t\(String(sonuc))\t"
            }
        }
    }
    
 
    @IBAction func ACButton(_ sender:UIButton){
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .white
        })
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .lightGray
        })
        işlemString = ""
        label.text = ""
    }
    
    @IBAction func rakamlarButton(_ sender:UIButton){
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .white
        })
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .darkGray
        })
        switch sender.titleLabel?.text {
        case "0":
            işlemString.append("0")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "1":
            işlemString.append("1")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "2":
            işlemString.append("2")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "3":
            işlemString.append("3")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "4":
            işlemString.append("4")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "5":
            işlemString.append("5")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "6":
            işlemString.append("6")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "7":
            işlemString.append("7")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "8":
            işlemString.append("8")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        case "9":
            işlemString.append("9")
            label.text = "\t\(işlemString)\t"
            resetAnimation(sender: artıOL)
            resetAnimation(sender: eksiOL)
            resetAnimation(sender: çarpıOL)
            resetAnimation(sender: bölüOL)
        default:
            label.text = "Error!\t"
        }
    }
    
    
    
    
    
    @IBAction func çarpmaButton(_ sender: UIButton) {
        
        if !işlemString.isEmpty{
            
            setAnimation(button: sender)
            
            if bölüOL.tintColor == .orange{
                resetAnimation(sender: bölüOL)
            }else if eksiOL.tintColor == .orange{
                resetAnimation(sender: eksiOL)
            }else if artıOL.tintColor == .orange{
                resetAnimation(sender: artıOL)
            }
            
            if işlemString != ""{
                var işlemler = işlemString.components(separatedBy: işlem)
                if işlemler.count > 1 && işlemler[1] != ""{
                    
                    let sonuc = Double(parseString(string: işlemString))!
                    if sonuc >= 1000000000000.0{
                        label.text = "\tİşlem Limitine Ulaşıldı!\t"
                    }else{
                        label.text = "\t\(String(sonuc))\t"
                    }
                }
            }
            
            işlem = "x"
            if işlemString.last != "+" && işlemString.last != "-" && işlemString.last != "x" && işlemString.last != "÷" && işlemString.last != ","{
                
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }else if işlemString.last == "x"{
                // hiçbir şey yapma
            }else{
                
                işlemString.removeLast()
                işlemString.append((sender.titleLabel?.text)!)
                label.text = "\t\(işlemString)\t"
            }
        }
        
    }
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .white
        })
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = .lightGray
        })
        
        if !işlemString.isEmpty{
            işlemString.removeLast()
            label.text = "\t\(işlemString)\t"
        }
        
    }
    
    
    
    
    
    
    
}

