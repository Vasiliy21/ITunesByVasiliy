//
//  UIApplications.swift
//  ITunesByVasiliy
//
//  Created by Vasiliy on 29.05.2023.
//

import Foundation
import SwiftUI

extension UIApplication {

    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
