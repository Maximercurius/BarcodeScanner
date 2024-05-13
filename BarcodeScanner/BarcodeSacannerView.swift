//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Makarov_Maxim on 13.05.2024.
//

import SwiftUI

struct BarcodeSacannerView: View {
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer() .frame(height: 70)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text ("Not Yet Scanned)")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeSacannerView()
}
