//
//  Meetup.swift
//  MeetMeUpSwift
//
//  Created by Matt Deuschle on 2/1/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class Meetup: NSObject
{
    // declare vars
    var name:String
    var rsvp:NSInteger
    var info:String
    var desc:String

    override init()
    {
        self.name = ""
        self.rsvp = 0
        self.info = ""
        self.desc = ""
    }

    init(name:String, rsvp:NSInteger, info:String, desc:String)
    {
        self.name = name
        self.rsvp = rsvp
        self.info = info
        self.desc = desc
    }

}




//class MyClass {
//
//    // you may need to set the proper types in accordance with your dictionarty's content
//    var title: String?
//    var shortDescription: String?
//    var newsDescription: String?
//    var link: NSURL?
//    var pubDate: NSDate?
//
//    //
//
//    init () {
//        // uncomment this line if your class has been inherited from any other class
//        //super.init()
//    }
//
//    //
//
//    convenience init(_ dictionary: Dictionary<String, AnyObject>) {
//        self.init()
//
//        title = dictionary["title"] as? NSString
//        shortDescription = dictionary["shortDescription"] as? NSString
//        newsDescription = dictionary["newsDescription"] as? NSString
//        link = dictionary["link"] as? NSURL
//        pubDate = self.getDate(dictionary["pubDate"])
//
//    }
//
//    //
//
//    func getDate(object: AnyObject?) -> NSDate? {
//        // parse the object as a date here and replace the next line for your wish...
//        return object as? NSDate
//    }
//    
//}