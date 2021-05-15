//
//  NetworkServiceError.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

/// Enum for decoding errors
enum ErrorService: Error {
    case noDataAvailable
    case noProcessData
    case noValidError
}
