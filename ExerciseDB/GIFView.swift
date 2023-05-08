//
//  GIFView.swift
//  ExerciseDB
//
//  Created by Алина Андрушок on 28.04.2023.
//


import SwiftUI
import FLAnimatedImage


struct GIFView: UIViewRepresentable {
    private var url: URL?
    
    init(url: URL) {
        self.url = url
    }
    
    private let imageView: FLAnimatedImageView = {
        let imageView = FLAnimatedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
}

extension GIFView {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        view.addSubview(activityIndicator)
        view.addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        activityIndicator.startAnimating()
        guard let url = url
        else
        { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = FLAnimatedImage(animatedGIFData: data)
                
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    imageView.animatedImage = image
                }
            }
        }
    }
}


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

//extension UIImage {
//    static func firstFrame(gif url: URL, completion: @escaping (UIImage?) -> Void) {
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, let source = CGImageSourceCreateWithData(data as CFData, nil),
//                  let cgimage = CGImageSourceCreateImageAtIndex(source, 0, nil) else {
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
//                return
//            }
//            let image = UIImage(cgImage: cgimage)
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//        task.resume()
//    }
//}


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

