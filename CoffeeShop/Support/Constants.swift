//
//  Color.swift
//  CoffeeShop
//
//  Created by TuanVi Phan on 3/21/17.
//  Copyright © 2017 TuanVi Phan. All rights reserved.
//

import UIKit
import Foundation

// Callbacks
// Typealias for callbacks used in Data Service
typealias callback = (_ success: Bool) -> ()
typealias messageCallback = (_ message: String, _ success: Bool) -> ()

let WHITE = UIColor.white
let MYGREEN = UIColor(red: 20/255, green: 125/255, blue: 71/255, alpha: 1)
let COFFEECOLOR = UIColor(red: 211/255, green: 187/255, blue: 151/255, alpha: 1)
let FACEBOOKCOLOR = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
let GOOGLECOLOR = UIColor(red: 197/255, green: 57/255, blue: 41/255, alpha: 1)

let DEFAULTS_REGISTERED = "isRegistered"
let DEFAULTS_FIRST_TIME = "isFirstTime"
let DEFAULTS_AUTHENTICATED = "isAuthenticated"
let DEFAULTS_TOKEN = "authToken"
let DEFAULTS_EMAIL = "email"
