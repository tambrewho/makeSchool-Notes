//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Tambre Hu on 7/3/17.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    var note: Note?
    
    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    //called every time a view controller is displayed
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // unwraps value in note property + stores it
        if let note = note {
            // executes if note !nil
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
