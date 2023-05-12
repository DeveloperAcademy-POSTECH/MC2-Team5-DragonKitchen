//
//  Extension+UIImage.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/12.
//

import SwiftUI

extension UIImage {
    // 화면에 표시된 캐릭터를 사진에 병합시키는 부분
    // 카메라 화면에는 ZStack으로 캐릭터를 표시했기 때문에, 촬영한 이미지를 저장하기 위해 오버레이 이미지를 사진에 입혀줍니다
    func mergeWith(image: UIImage) -> UIImage {
        let canvasSize = CGSize(width: max(self.size.width, image.size.width), height: max(self.size.height, image.size.height))

        UIGraphicsBeginImageContextWithOptions(canvasSize, false, self.scale)
        self.draw(in: CGRect(origin: CGPoint(x: (canvasSize.width - self.size.width) / 2, y: (canvasSize.height - self.size.height) / 2), size: self.size))

        let width: CGFloat = 1700
        let height: CGFloat = 1750
        let x = (canvasSize.width - image.size.width) / 2 - width + 130
        let y = (canvasSize.height - image.size.height) / 2 - height / 2 + 130
        let size = CGSize(width: width, height: height)
        image.draw(in: CGRect(origin: CGPoint(x: x, y: y), size: size))

        let mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return mergedImage ?? self
    }

    // 사진 촬영, 저장시에 AspectFill(), ignoreSafeArea()로 설정되어 있어서
    // 사진을 저장할 때 같은 비율로 맞춰주기 위해 이미지를 크롭할 때 사용
    func cropImage(toRect rect: CGRect) -> UIImage {
        if let cgImage = self.cgImage?.cropping(to: rect) {
            return UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation)
        }
        return self
    }
}
