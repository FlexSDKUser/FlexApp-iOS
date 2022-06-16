//
//  ServiceRequestParamModel.swift
//  MobileERP
//
//  Created by Om Prakash Shah on 9/5/18.
//  Copyright © 2018 Sunil Luitel. All rights reserved.
//

import Foundation
import ObjectMapper

class ServiceRequestParamModel: Mappable {
    
    var PaperType: Int?
    var NotiTitle: String?
    var NotiBody: String? // when saving value to db, this is used as paper title
    var CreatedBy: Int? // empSeq
    var CompanySeq: Int?
    var Receivers: [Int] = [] // (empSeq json array, will be sent as xml to sp)
    var MultiReceiver: Int?
    var LabelDeptSeq: Int?
    var OperationType: Int? // (1 -> Create , 2 - > Edit ) Optional
    var NotiYN: Int? // (0 -> no notify , 1 -> send notify)
    
    var Data: String?  //json object with properties like PaperKey, PgmSeq
    
    // Common params for Companity Paper/Vote (Non-noti type)
    var HashTagXml: String?
    
    // Params for Normal Paper
    var AttachmentXml: String?
    
    // Params for Vote Paper
    var VoteClosingTime: String?
    var isVoteClosed: Int?
    var VoteSelectionType: Int?
    var VoteVisibilityType: Int?
    var CanAddItem: Int?
    var HasVoteLimit: Int?
    var VoteItemType: Int?
    var isOfficial: Int?
    var VoteXml: String?
    
    var PaperId: Int?
    var NewAttachmentXml: String?
    var DeleteAttachmentXml: String?
    
    // For schedule type paper
    var OpinionEnabled: Int?
    var EventTitle: String?
    var EventBeginTime: String?
    var EventEndTime: String?
    var LocationName: String?
    var Latitude: Double?
    var Longitude: Double?
    var AllDayEvent: Int?
    var DsnBis: String?
    var DsnOper: String?
    var RemarkScript: String?

    func mapping(map: Map) {
        
        self.DsnBis <- map["DsnBis"]
        self.DsnOper <- map["DsnOper"]
        
        self.PaperType <- map["Type"]
        self.NotiTitle <- map["NotiTitle"]
        self.NotiBody <- map["NotiBody"]
        self.CreatedBy <- map["CreatedBy"]
        self.CompanySeq <- map["CompanySeq"]
        self.Receivers <- map["Receivers"]
        self.MultiReceiver <- map["MultiReceiver"]
        self.LabelDeptSeq <- map["LabelDeptSeq"]
        self.OperationType <- map["OperationType"]
        self.NotiYN <- map["NotiYN"]
        self.Data <- map["Data"]
        self.HashTagXml <- map["HashTagXml"]
        self.AttachmentXml <- map["AttachmentXml"]
        self.VoteClosingTime <- map["VoteClosingTime"]
        self.isVoteClosed <- map["VoteClosed"]
        self.VoteSelectionType <- map["VoteSelectionType"]
        self.VoteVisibilityType <- map["VoteVisibilityType"]
        self.CanAddItem <- map["CanAddItem"]
        self.HasVoteLimit <- map["HasVoteLimit"]
        self.VoteItemType <- map["VoteItemType"]
        self.VoteXml <- map["VoteXml"]
        self.PaperId <- map["PaperId"]
        self.NewAttachmentXml <- map["NewAttachmentXml"]
        self.DeleteAttachmentXml <- map["DeleteAttachmentXml"]
        self.isOfficial <- map["IsOfficial"]
        
        // For schedule type paper
        self.AllDayEvent <- map["AllDayEvent"]
        self.OpinionEnabled <- map["OpinionEnabled"]
        self.EventTitle <- map["EventTitle"]
        self.EventBeginTime <- map["EventBeginTime"]
        self.EventEndTime <- map["EventEndTime"]
        self.LocationName <- map["LocationName"]
        self.Latitude <- map["Latitude"]
        self.Longitude <- map["Longitude"]
        self.RemarkScript <- map["RemarkScript"]
        
    }
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
//    init(PaperType: String?, NotiTitle: String?, NotiBody: String?, CreatedBy: String?, CompanySeq: String?, Receivers: String?, OperationType: String?, NotiYN: String?, Data: String?, HashTagXml: String?, AttachmentXml: String?, VoteClosingTime: String?, VoteSelectionType: String?, VoteVisibilityType: String?, CanAddItem: String?, HasVoteLimit: String?, VoteItemType: String?, VoteXml: String?, PaperId: String?, NewAttachmentXml: String?, DeleteAttachmentXml: String?) {
//
//        self.PaperType = PaperType
//        self.NotiTitle = NotiTitle
//        self.NotiBody = NotiBody
//        self.CreatedBy = CreatedBy
//        self.CompanySeq = CompanySeq
//        self.Receivers = Receivers
//        self.OperationType = OperationType
//        self.NotiYN = NotiYN
//        self.Data = Data
//        self.HashTagXml = HashTagXml
//        self.AttachmentXml = AttachmentXml
//        self.VoteClosingTime = VoteClosingTime
//        self.VoteSelectionType = VoteSelectionType
//        self.VoteVisibilityType = VoteVisibilityType
//        self.CanAddItem = CanAddItem
//        self.HasVoteLimit = HasVoteLimit
//        self.VoteItemType = VoteItemType
//        self.VoteXml = VoteXml
//        self.PaperId = PaperId
//        self.NewAttachmentXml = NewAttachmentXml
//        self.DeleteAttachmentXml = DeleteAttachmentXml
//
//    }

}

