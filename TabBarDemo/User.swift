//
//  User.swift
//  TabBarDemo
//
//  Created by Rachana Pandit on 29/11/22.
//

import Foundation

struct User{
    var page:Int
    var perPage:Int
    var total:Int
    var totalPages:Int
    var data:[[String:Any]]
    var support:[String:Any]
}

struct dataOfUser{
    var id:Int
    var email:String
    var FirstName:String
    var lastName:String
    var avatar:String
}
