//
//  UIImage+Extention.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 10.05.2023.
//

import UIKit

// first frame of gif
extension UIImage {
    static func firstFrame(gif url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) as CFData,
              let source = CGImageSourceCreateWithData(data, nil),
              let cgimage = CGImageSourceCreateImageAtIndex(source, 0, nil) else {
            return nil
        }
        let image = UIImage(cgImage: cgimage)
        return image
    }
}
