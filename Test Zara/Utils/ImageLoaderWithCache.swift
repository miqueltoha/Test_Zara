//
//  ImageLoaderWithCache.swift
//  Test Alten
//
//  Created by Miquel Toha Perera on 11/9/23.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloadImage(with url: URL) {
        if var image = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = image
            return
        }
        
        Task {
            do {
                var image = try await Networking.downloadImage(url: url)
                self.image = image
            } catch {
                //TODO Error
            }
        }
    }
}

final class Networking: NSObject {
    
    enum Result<T> {
        case success(T)
        case failure(Error)
    }
        
    @discardableResult
    static func downloadImage(url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let image = UIImage(data: data) {
            imageCache.setObject(image, forKey: url.absoluteString as NSString)
            return image
        } else {
            throw URLError(.cannotDecodeContentData)
        }
    }
}
