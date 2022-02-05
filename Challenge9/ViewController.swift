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
    
    @IBOutlet var topTextDisplay: UIImageView!
    @IBOutlet var bottomTextDisplay: UIImageView!
    
    var topText: String = ""
    var bottomText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Meme Generator"
        
        displayTopText(topCaption: topText)
    }
    
    @IBAction func writeTopText(_ sender: Any) {
        let ac = UIAlertController(title: "Enter Top Text", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned ac] _ in
            let message = ac.textFields![0]
            
            self.topText = message.text!
            
            
            self.displayTopText(topCaption: message.text!)
            
            
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    

    @IBAction func writeBottomText(_ sender: Any) {
        let ac = UIAlertController(title: "Enter bottom text", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned ac] _ in
            let message = ac.textFields![0]
            
            self.bottomText = message.text!
            
            self.displayBottomText(bottomCaption: message.text!)
            
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
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
    
    func displayTopText(topCaption: String) {
        
        print(topCaption)
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 375, height: 100))
        
        let msg = renderer.image {
            ctx in
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 25),
                .paragraphStyle: paragraphStyle,
                .strokeWidth: 8.5,
                .strokeColor: UIColor.white.cgColor,
                .backgroundColor: UIColor.black.cgColor
                
            ]
            
            let string = topCaption
            let attributedString = NSAttributedString(string: string, attributes: attrs)
            
            attributedString.draw(with: CGRect(x: 0, y: 0, width: 370, height: 100), options: .usesLineFragmentOrigin, context: nil)
        }
        
        topTextDisplay.image = msg
        
    }
    
    func displayBottomText(bottomCaption: String) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 375, height: 100))
        
        let msg = renderer.image {
            ctx in
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 25),
                .paragraphStyle: paragraphStyle,
                .strokeWidth: 8.5,
                .strokeColor: UIColor.white.cgColor,
                .backgroundColor: UIColor.black.cgColor
                
            ]
            
            let string = bottomCaption
            let attributedString = NSAttributedString(string: string, attributes: attrs)
            
            attributedString.draw(with: CGRect(x: 0, y: 0, width: 370, height: 100), options: .usesLineFragmentOrigin, context: nil)
        }
        
        bottomTextDisplay.image = msg
        
    }
    
}

