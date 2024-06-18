//
//  EggButton.swift
//  Egg Time
//
//  Created by Tomas Sanni on 6/17/24.
//

import UIKit

class EggButton: UIButton {

    var eggType: EggType = .soft
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(eggType: EggType) {
        super.init(frame: .zero)
        self.eggType = eggType
        setImage(eggType.image, for: .normal)
        setTitle(eggType.title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}


enum EggType {
    case soft
    case medium
    case hard
    
    var title: String {
        switch self {
        case .soft: "Soft"
        case .medium: "Medium"
        case .hard: "Hard"
        }
    }
    
    var image: UIImage {
        switch self {
        case .soft: .softEgg
        case .medium: .mediumEgg
        case .hard: .hardEgg
        }
    }
    
    var time: Int {
        switch self {
        case .soft: 3
        case .medium: 5
        case .hard: 7
        }
    }
}
