//
//  BRPageControl.swift
//  BRPageControl
//
//  Created by anho on 01/05/2018.
//  Copyright © 2018 Andrei Hogea. All rights reserved.
//

import UIKit

@IBDesignable
class BRPageControl: UIView {

    // MARK: - Number Of Pages

    @IBInspectable var numberOfPages: Int = 0 {
        didSet {
            if numberOfPages != oldValue && numberOfPages > 0 {
                createPageControl()
            }
        }
    }

    // MARK: - Curent Page

    @IBInspectable var currentPage: Int = 0 {
        didSet {
            if currentPage != oldValue {
                refreshControl()
            }
        }
    }

    // MARK: - Allingment

    var contentHorizontalAlignment: UIControlContentHorizontalAlignment = .center

    // MARK: - Colors

    @IBInspectable var currentPageTintColor: UIColor = .white
    @IBInspectable var pageTintColor: UIColor = .gray
    @IBInspectable var currentPageBorderColor: UIColor = .black
    @IBInspectable var pageBorderColor: UIColor = .black

    // MARK: - Sizes

    @IBInspectable var diameter: CGFloat = 7.5
    @IBInspectable var spacing: CGFloat = 7
    private let screenWidth = UIScreen.main.bounds.width

    // MARK: - Controls

    private var controls: [UIView] = []

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        controls.removeAll()
        createPageControl()
    }

    // MARK: - Create PageControls

    private func createPageControl() {
        for subview in self.controls {
            subview.removeFromSuperview()
        }

        controls.removeAll()

        for i in 0..<numberOfPages {
            let pageControlView = makePageControlView(at: i)
            controls.append(pageControlView)
        }

    }

    // MARK: - Create PageControl

    private func makePageControlView(at position: Int) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = diameter/2
        view.layer.borderWidth = 0.5

        if position == currentPage {
            view.backgroundColor = currentPageTintColor
            view.layer.borderColor = currentPageBorderColor.cgColor
        } else {
            view.backgroundColor = pageTintColor
            view.layer.borderColor = pageBorderColor.cgColor
        }

        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant: diameter).isActive = true
        view.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        view.leadingAnchor.constraint(equalTo: getEquatToContraint(), constant: getLeadingConstant(at: CGFloat(position))).isActive = true
        return view
    }

    private func getEquatToContraint() -> NSLayoutXAxisAnchor {
        switch contentHorizontalAlignment {
        case .left, .leading, .center, .fill:
            return leadingAnchor
        case .right, .trailing:
            return trailingAnchor
        }
    }

    private func getLeadingConstant(at position: CGFloat) -> CGFloat {
        switch contentHorizontalAlignment {
        case .left, .leading:
            return position * spacing + position * diameter
        case .center, .fill:
            let spaceOccupied = diameter * CGFloat(numberOfPages) + CGFloat(numberOfPages - 1) * spacing
            return screenWidth/2 - spaceOccupied/2 + CGFloat(position)*spacing + CGFloat(position)*diameter

        case .right, .trailing:
            let spaceOccupied = diameter * CGFloat(numberOfPages) + CGFloat(numberOfPages - 1) * spacing
            return -spaceOccupied + position*spacing + position*diameter
        }
    }

    // MARK: - Refresh PageControls

    private func refreshControl() {
        for (index, view) in controls.enumerated() {
            if index == currentPage {
                view.backgroundColor = currentPageTintColor
                view.layer.borderColor = currentPageBorderColor.cgColor
            } else {
                view.backgroundColor = pageTintColor
                view.layer.borderColor = pageBorderColor.cgColor
            }
        }
    }
}
