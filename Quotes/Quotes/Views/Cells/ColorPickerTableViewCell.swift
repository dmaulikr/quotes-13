//
//  ColorPickerTableViewCell.swift
//  Quotes
//
//  Created by Jaime Paulo on 11/09/16.
//  Copyright © 2016 Doist. All rights reserved.
//

import UIKit
import Foundation

class ColorPickerTableViewCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.backgroundColor = nil
        textLabel?.text = nil
    }

    // MARK: - Public API
    func configure(color aColor: UIColor, colorName aName: String) {
        imageView?.backgroundColor = aColor
        textLabel?.text = aName
    }
}
