//
//  extensions.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func takeLetter(x: Int) -> String {
        
        let letters : NSString = "аеқпфәёлрхбжмсһвзнтцгиңучғйоұшдкөүщыіьэюя"//жнфбзохвипцгйрчдксшелтщёмуъыьэюяәіңғүұқөһ"
        
        var letter = ""
        var nextChar = letters.character(at: Int(x))
        letter += NSString(characters: &nextChar, length: 1) as String
        
        return letter
    }

    func fromStringToList(question: String) -> [String] {
        
        var word_list = [String]()
        let letters : NSString = question as NSString
        let len = UInt32(letters.length)
        
        for i in 0...len-1 {
            var nextChar = letters.character(at: Int(i))
            word_list.append(NSString(characters: &nextChar, length: 1) as String)
        }
        
        return word_list
    }
}
