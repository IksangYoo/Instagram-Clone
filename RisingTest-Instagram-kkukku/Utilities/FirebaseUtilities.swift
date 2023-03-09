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
}
