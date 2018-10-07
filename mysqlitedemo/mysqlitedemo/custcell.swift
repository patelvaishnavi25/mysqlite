//
//  custcell.swift
//  mysqlitedemo
//
//  Created by Vaishnavi Patel on 07/10/18.
//  Copyright © 2018 Vaishnavi Patel. All rights reserved.
//

import UIKit

class custcell: NSObject {
    
    func dml(str : String) -> Bool {
        
        var status = false;
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        
        let fullpath = path[0];
        
        let finalpath = fullpath.appending("/iosdb.db");
        
        print(finalpath);
        
        var op : OpaquePointer? = nil;
        
        if sqlite3_open(finalpath, &op) == SQLITE_OK {
            var stmt : OpaquePointer? = nil;
            
            if sqlite3_prepare_v2(op, str, -1, &stmt, nil) == SQLITE_OK
            {
                sqlite3_step(stmt);
                status = true;
            }
            
            sqlite3_finalize(stmt);
            sqlite3_close(op);
            
        }
        return status;
        
        
    }

    func GetData(str : String) -> [Any] {
        var arr : [Any] = [];
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        
        let fullpath = path[0];
        
        let finalpath = fullpath.appending("/iosdb.db");
        
        print(finalpath);
        
        var op : OpaquePointer? = nil;
        
        if sqlite3_open(finalpath, &op) == SQLITE_OK {
            var stmt : OpaquePointer? = nil;
            
            if sqlite3_prepare_v2(op, str, -1, &stmt, nil) == SQLITE_OK
            {
                while sqlite3_step(stmt) == SQLITE_ROW
                {
                    var temp : [String] = [];
                    
                    let emp_id = String(cString: sqlite3_column_text(stmt, 0));
                    
                    let emp_name = String(cString: sqlite3_column_text(stmt, 1));
                    
                    let emp_add = String(cString: sqlite3_column_text(stmt, 2));
                    
                    temp.append(emp_id);
                    temp.append(emp_name);
                    temp.append(emp_add);
                    
                    arr.append(temp);
                }
                sqlite3_finalize(stmt);
                sqlite3_close(op);
        
    }
}
        return arr;
}
}
