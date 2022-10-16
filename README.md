# Blurhash-macos

Extensions of `NSImage` to encode and decode blur hashes, based on [Wolt's algorithm](https://github.com/woltapp/blurhas)

<img src="demo.png">

## Usage


```swift
    // scale down for performance + encode
    let blurHashString = image.small()?.blurHash(numberOfComponents: (4,4))
    
    // decoding
    let decoded = NSImage(blurHash: hash, size: CGSize(width: 32, height: 32)) // use small size and scale up in UI for performance
    
```
