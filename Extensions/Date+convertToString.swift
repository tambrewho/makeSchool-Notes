//
//  Date+convertToString.swift
//  MakeSchoolNotes
//
//  Created by Tambre Hu on 7/3/17.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation

extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
