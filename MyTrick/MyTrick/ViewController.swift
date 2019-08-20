//
//  ViewController.swift
//  MyTrick
//
//  Created by RakeshPC on 27/06/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nestedArray()
        self.filterElement()
    }
    
}


//Handle nested Array
extension ViewController {
    
    fileprivate func nestedArray(){
        let simpleArray = flatteredArray(array: [1,2,3,4,5])
        print("simpleArray: \(simpleArray)")
        
        let nestedArray = flatteredArray(array: [1,2,3,4,5, [6,7,8,9]])
        print("nestedArray: \(nestedArray)")
    }
    
    func flatteredArray(array: [Any]) -> [Int] {
        var myArray = [Int]()
        
        for element in array {
            if element is Int {
                myArray.append(element as! Int)
                
            }else if element is [Any] {
                let recursiveElement = flatteredArray(array: element as! [Any])
                for num in recursiveElement {
                    myArray.append(num)
                }
            }
        }
        return myArray
    }
    
    
}


// Filter with clouser
extension ViewController {
    
    func filterElement(){
        let filter = self.filterWithPredicateClouser(clouesr: greterThan
            , numbers: [1,2,3,4,5,6])
        print("filter element: \(filter)")
    }
    
    func greterThan(value: Int) -> Bool {
        return value > 3
    }
    
    func filterWithPredicateClouser(clouesr: (Int) -> Bool, numbers: [Int]) -> [Int] {
        var filterNumberes = [Int]()
        for num in numbers {
            if clouesr(num) {
                filterNumberes.append(num)
            }
        }
        return filterNumberes
    }
    
}

//MARK: Show popup
extension ViewController {
    func showPopup(_ viewAlert: UIView, withBlackTransperentView viewblackTransperent: UIView, with isAlertShow: Bool) {
        if isAlertShow {
            viewAlert.isHidden = true
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                viewAlert.transform = CGAffineTransform.identity
                viewAlert.transform = CGAffineTransform(scaleX: 0, y: 0)
                viewblackTransperent.isHidden = true
            }, completion: {(_ finished: Bool) -> Void in
                viewAlert.isHidden = true
            })
        }
        if !isAlertShow {
            let window = UIApplication.shared.keyWindow!
            viewAlert.center = window.center
            window.addSubview(viewAlert)
            viewAlert.transform = CGAffineTransform(scaleX: 0, y: 0)
            viewAlert.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                viewAlert.transform = CGAffineTransform.identity
                viewblackTransperent.isHidden = false
            }, completion: {(_ finished: Bool) -> Void in
            })
        }
    }
}


extension ViewController {
    /**
     presents asimple UIAlertViewController with title message like android's toast.
     
     - Parameters:
     - title: title of alert.
     - message : message to be shown.
     - vc : object of ViewController where it should be presented.
     - time : time in second of showing.
     
     */
    class func toast(title: String, message: String, vc: UIViewController,time : Double, CompletionHandler : (()->Void)?) {
        let attributedString = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold), //your font here
            NSAttributedString.Key.foregroundColor : UIColor.orange
            ])
        let alert = UIAlertController(title:"", message:message, preferredStyle: UIAlertController.Style.alert)
        alert.setValue(attributedString, forKey: "attributedTitle")
        vc.present(alert, animated: true) {
            Timer.scheduledTimer(withTimeInterval:time , repeats: false, block: {_ in
                vc.dismiss(animated: true, completion: {
                    if let handler = CompletionHandler{
                        handler()
                    }
                })
            })
        }
        alert.view.tintColor = UIColor.orange
    }
}
