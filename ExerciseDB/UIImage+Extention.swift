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

//
//extension UIImage {
//    static func firstFrame(gif url: URL, completion: @escaping (UIImage?) -> Void) {
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, error == nil else {
//                completion(nil)
//                return
//            }
//
//            guard let source = CGImageSourceCreateWithData(data as CFData, nil),
//                  let cgimage = CGImageSourceCreateImageAtIndex(source, 0, nil) else {
//                completion(nil)
//                return
//            }
//
//            let image = UIImage(cgImage: cgimage)
//            completion(image)
//        }.resume()
//    }
//}

