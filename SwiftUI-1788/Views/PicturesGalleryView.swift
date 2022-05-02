//
//  PicturesGalleryView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 01.05.2022.
//

import SwiftUI

struct PicturesGalleryView: View {
    
    var pictures: [ImageModel] = ImagesList.images
    var body: some View {
        HStack {
            ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 5)], spacing: 5) {
                ForEach(pictures) { image in
                    Image(image.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .shadow(color: .black, radius: 7, x: 2, y: 2)
                }
                }
            }
        }
    }
}

struct PicturesGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PicturesGalleryView()
    }
}
