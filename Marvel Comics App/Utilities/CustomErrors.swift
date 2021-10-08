//
//  CustomErrors.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import Foundation

enum CustomErrors: String, Error{
case unableToComplete   = "Unable to complete your request. Please check your Internet connection."
case invalidResponse    = "Invalid response from the server. Please try again."
case invalidData        = "The data received from the server was invalid. Please try again."
}
