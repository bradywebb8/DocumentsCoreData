//
//  DocumentsCoreDataViewController.swift
//  Documents Core Data
//
//  Created by Brady Webb on 9/20/19.
//  Copyright © 2019 Brady Webb. All rights reserved.
//

import UIKit

class DocumentsCoreDataViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var documentTextView: UITextView!
    
    var document: document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let document = document {
            let name = document.name
            nameField.text = name
            documentTextView.text = document.content
            title = name
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func nameChanged(_ sender: Any) {
        title = nameField.text
    }
    @IBAction func saveDocument(_ sender: Any) {
        guard let name = nameField.text else {
            return
        }
        let content = documentTextView.text
        
        if document == nil {
            document = document(name: name, content: content)
        } else {
            document?.update(name: name, content: content)
        }
        if let document = document {
            do {
                let managedContext = document.managedObjectContext
                try managedContext?.save()
            } catch {
                print("Document could not be saved")
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}
