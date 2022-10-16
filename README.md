# Blurhash-macos

Extensions of `NSImage` to encode and decode blur hashes, based on [Wolt's algorithm](https://github.com/woltapp/blurhas)

[demo.png](demo)

## Usage


```swift
    let blurHashString = image.blurHash(numberOfComponents: (4,4))
    let decoded = NSImage(blurHash: hash, size: CGSize(width: 32, height: 32)) // use small size and scale up in UI for performance
```
