//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Tambre Hu on 7/3/17.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    var notes = [Note]() {
        //reloads data when notes property is changed
        didSet {
            tableView.reloadData()
        }
    }
    
    // how many cells it should display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    // which cell to display in table row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        // which row wants a cell
        let row = indexPath.row
        // gets cell in correct row
        let note = notes[row]
        // sets text of cell
        cell.noteTitleLabel.text = note.title
        // makes it the mod. time of the cell
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                // access cell's index path
                let indexPath = tableView.indexPathForSelectedRow!
                // retrieve correct note from notes
                let note = notes[indexPath.row]
                // getting access to displaynoteviewcontroller from segue
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                // set displaynoteviewcontroller note property to note
                displayNoteViewController.note = note
                
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    // adds swipe right editing option
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //deletes note from correct row from notes
            CoreDataHelper.delete(note: notes[indexPath.row])
            //updates notes to reflect changes
            notes = CoreDataHelper.retrieveNotes()
        }
    }
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        //update notes whenever ListNotesViewController is unwinded from another view controller
        self.notes = CoreDataHelper.retrieveNotes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updates notes properly
        notes = CoreDataHelper.retrieveNotes()
    }
    
}
