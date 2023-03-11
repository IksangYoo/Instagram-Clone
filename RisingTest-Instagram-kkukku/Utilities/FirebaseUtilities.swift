//
//  FirebaseUtilities.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/09.
//

import Foundation
import Firebase
import FirebaseStorage

extension Storage {
    
    func uploadUserProfileImage(profileImage: UIImage?, uid: String, completion: @escaping (String?, Error?) -> ()) {
        guard let image = profileImage else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        
        let storageRef = Storage.storage().reference().child("userProfileImages").child(uid)
        
        storageRef.putData(imageData, metadata: nil) { metaData, error in
            if let e = error { completion(nil, e); return }
            
            storageRef.downloadURL { downloadURL, error in
                if let e = error { completion(nil, e); return }
                
                guard let profileImageURL = downloadURL?.absoluteString else { return }
                completion(profileImageURL, nil)
            }
        }
    }
    
    func uploadPostDownloadURL(postImages: [UIImage], completion: @escaping ([String]?, Error?) -> ()) {
        
        
        let storageRef = Storage.storage().reference()
        var urlStrings = [String]()
        
        for image in postImages {
            let filename = NSUUID().uuidString
            guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
            storageRef.child(filename).putData(imageData) { result, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    print("게시물 파이어베이스에 저장 성공")
                    
                    storageRef.child(filename).downloadURL { url, error in
                        if let e = error { completion(nil, e); return }
                        
                        guard let postURLString = url?.absoluteString else { return }
                        print("게시물 url 가져오기 ----> \(postURLString)")
                        
                        urlStrings.append(postURLString)
                        if postImages.count == urlStrings.count {
                            completion(urlStrings, nil)
                        }
                    }
                }
            }
        }
    }
}
