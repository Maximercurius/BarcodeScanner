//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Makarov_Maxim on 13.05.2024.
//

import SwiftUI

struct BarcodeSacannerView: View {
    
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer() .frame(height: 70)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text (scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode )
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green )
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeSacannerView()
}
