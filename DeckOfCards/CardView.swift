//
//  CardView.swift
//  DeckOfCards
//
//  Created by Jim Campagno on 11/4/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit



class CardView: UIView {
    
    weak var card: Card! {
        didSet {
            updateViewToReflectNewCard()
        }
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.constrainEdges(to: self)
        backgroundColor = UIColor.clear
        setupGestureRecognizer()
    }
    
 
    
}


// MARK: - Card Methods
extension CardView {
    
    fileprivate func updateViewToReflectNewCard() {
        
        if self.card.image == nil {
            guard let unwrappedURL = card.url else { return }
           CardAPIClient.shared.downloadImage(at: unwrappedURL, completion: { (true, image) in
            self.card.image = image
           })
        } else { print("error in updateViewToReflect") }
        // TODO: Update the view accordingly
       //look at card stored property - have an image that not's nil?' if it's nil then we haven't downloaded image yet.
        // if cards. image property is nil then call then call on download image and then you'll hve an image. 
        //once have image - imageview.image  = that image.
    }

}


// MARK: - Pan Gestures
extension CardView {
    
     func setupGestureRecognizer() {
        
        // TODO: Setup Pan Gesture Recognizer
        // should be added to self.(current instance of card view. 
        //add end . self.add pangesture.
        
        
        
    }
    
     func viewMoved(_ gesture: UIPanGestureRecognizer) {
        
        // TODO: Update self.center to reflect the new center
        //update self's  center . the new center we should find the through pan gesture
    }
    
}




// MARK: - UIView Extension
extension UIView {
    
    func constrainEdges(to view: UIView) {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}
