//
//  ViewController.swift
//  Challenge9
//
//  Created by Keith Crooc on 2022-02-04.
//

// CHALLENGE 9
// Create a Meme Creator app

// Prompt the user to import a photo from their photo library.

// Show an alert with a text field asking them to insert a line of text for the top of the meme.

// Show a second alert for the bottom of the meme.

// Render their image plus both pieces of text into one finished UIImage using Core Graphics.

// Let them share that result using UIActivityViewController.

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Meme Generator"
    }
    
    @IBAction func writeTopText(_ sender: Any) {
        
    }
    

    @IBAction func writeBottomText(_ sender: Any) {
    }
    
    @IBAction func uploadPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        
        imageView.image = image
        
        
    }
    
}

