//
//  PhotoListViewModel.swift
//  PhotosApp
//

import UIKit

protocol PhotoListViewModelDelegate: AnyObject {
    func photosLoaded()
}

final class PhotoListViewModel {
    var photos = [Photo]()
    
    weak var delegate: PhotoListViewModelDelegate?
    
    private let pexelsClient: PexelsClient
    private let imageLoader: ImageLoader
    
    var currentPage = 0
    
    init() {
        pexelsClient = PexelsClient()
        imageLoader = ImageLoader()
        
        loadPhotos()
    }
    
    var count: Int {
        return photos.count
    }
    
    func getPhoto(at idx: Int) -> Photo {
        return photos[idx]
    }
    
    func loadPhotos() {
        currentPage += 1
        let feed = PhotoFeed.curated(currentPage: currentPage, perPage: 20)
        pexelsClient.getPhotos(from: feed) {[weak self] (result) in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let photoFeedResult) :
                guard let photoResult = photoFeedResult else {
                    return
                }
                strongSelf.photos.append(contentsOf: photoResult.photos)
                strongSelf.delegate?.photosLoaded()
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func loadImage(url: URL, _ completion: @escaping (UIImage?) -> Void) -> UUID? {
        let token = imageLoader.loadImage(url) { (result) in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
        return token
    }
    
    func cancel(_ token: UUID?) {
        if let token = token {
            imageLoader.cancel(token)
        }
    }
}
