

import Foundation
import AppKit

public extension NSImage {
     func pngSize() -> Int? {
        guard let tiffRepresentation,
              let bitmap = NSBitmapImageRep(data: tiffRepresentation),
              let rep = bitmap.representation(using: .png, properties: [:])
                
        else { return nil }
        
        return rep.count
    }
    
     func small() -> NSImage? {
        resized(to: NSSize(width: 32, height: 32))
    }
    
    
     func resized(to newSize:NSSize) -> NSImage? {
        guard let bitmapRep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(newSize.width), pixelsHigh: Int(newSize.width), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .calibratedRGB, bitmapFormat: .alphaFirst, bytesPerRow: 0, bitsPerPixel: 0) else {
            return nil
        }
        
        bitmapRep.size = newSize
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmapRep)
        draw(in: NSRect(origin: .zero, size: newSize), from: .zero, operation: .copy, fraction: 1.0)
        NSGraphicsContext.restoreGraphicsState()
        
        let resizedImage = NSImage(size: newSize)
        resizedImage.addRepresentation(bitmapRep)
        return resizedImage
    }
}
