//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Makarov_Maxim on 13.05.2024.
//

import UIKit
import AVFoundation

protocol ScannerVCDelegate: class {
    func didFind(barcode: String)
}

final class ScannerVC: UIViewController {
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        let videoIntput: AVCaptureDeviceInput
        
        do {
            try videoIntput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        if captureSession.canAddInput(videoIntput) {
            captureSession.addInput(videoIntput)
        } else {
            return
        }
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
    
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            return
        }
        guard let   machineReadebleObject = object as? AVMetadataMachineReadableCodeObject else {
            return
        }
        guard let barcode = machineReadebleObject.stringValue else {
            return
        }
        scannerDelegate?.didFind(barcode: barcode)
    }
}
