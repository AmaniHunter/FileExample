//
//  ViewController.swift
//  FileExample
//
//  Created by Amani Hunter on 12/9/19.
//  Copyright © 2019 Amani Hunter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextField!
    
    var fileMgr: FileManager = FileManager.default
    var docsDir: String?
    var dataFile: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        let filemgr = FileManager.default
        
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        
        dataFile = dirPaths[0].appendingPathComponent("datafile.dat").path
        
        if fileMgr.fileExists(atPath: dataFile!){
            let databuffer = fileMgr.contents(atPath: dataFile!)
            let datastring = NSString(data: databuffer!, encoding: String.Encoding.utf8.rawValue)
            
            textBox.text = datastring as? String
        }
    }

    @IBAction func saveText(_ sender: Any) {
        let databuffer = (textBox.text)!.data(using: String.Encoding.utf8)
        
        fileMgr.createFile(atPath: dataFile!, contents: databuffer, attributes: nil)
        
    }
    
}

