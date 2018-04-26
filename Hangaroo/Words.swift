//
//  words.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

struct Question: Mappable {
    var text = [""]
    var level = ""
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        text <- map["text"]
        level <- map["level"]
    }
}

extension Question {
    static func fetchQuestions(level: String = "",text: String = "") -> [Question] {
        do {
            guard let path = Bundle.main.path(forResource: "words", ofType: "json") else { return [] }
            let fileUrl = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileUrl, options: .alwaysMapped)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
            guard let objects = json["questions"] as? [[String:Any]] else { return [] }
            let questions = Mapper<Question>().mapArray(JSONArray: objects)
            return questions
        }
        catch {
            return []
        }
    }
}
