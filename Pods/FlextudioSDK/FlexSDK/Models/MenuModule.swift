//
//  MenuModule.swift
//  Companity
//
//  Created by Om Prakash Shah on 7/12/19.
//

import Foundation

class MenuModule: Equatable {
    
    internal var seq: String?
    internal var menuOrder: String?
    internal var title: String?
    internal var link: String?
    internal var iconName: String?
    
    
    static func == (lhs: MenuModule, rhs: MenuModule) -> Bool {
        return lhs === rhs // === returns true when both references point to the same object
    }
    
    init(){
        self.seq = nil
        self.menuOrder = nil
        self.title = nil
        self.link = nil
        self.iconName = nil
    }
    
    init(seq: String?, menuOrder: String?, title: String?, link: String?, iconName: String?){
        self.seq = seq
        self.menuOrder = menuOrder
        self.title = title
        self.link = link
        self.iconName = iconName
    }
    
}
