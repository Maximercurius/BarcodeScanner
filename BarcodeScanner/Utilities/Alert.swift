//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Makarov_Maxim on 20.05.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the Camera. We unable to capture the input.",
                                              dismissButton: .default(Text ("OK")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type",
                                              message: "The value scanned is not valid. This app can scan EAN-8 and EAN-13.",
                                              dismissButton: .default(Text ("OK")))
}
