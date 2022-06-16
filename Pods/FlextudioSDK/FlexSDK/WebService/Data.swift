//
//  Data.swift
//  ExecuteMothodSyncTest
//
//  Created by osbaek on 2015. 8. 7..
//  Copyright (c) 2015년 osbaek. All rights reserved.
//

import Foundation
import UIKit
import JavaScriptCore
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


@objc
protocol DataSetJSDelegate:JSExport {
    func getData() -> Data?
}

@objc
protocol DataTableJSDelegate:JSExport {
    func GetColumnIDX(_ strChkColumn: String?) -> Int
    func rowsCount()->Int
    func columnsCount()->Int
}

class Data :NSObject{
    
    override init() {
        
    }
}
class DataSet :NSObject, DataSetJSDelegate {
    var d: Data?
    var m_Tables: DataTableCollection?
    var dataSetName: String?

    override init(){
        //            d = Data()
        //            m_Tables = DataTableCollection()
    }
    init(master: Data?)
    {
        super.init()
        d = master
        m_Tables = DataTableCollection()
        m_Tables?.dataSet = self
    }
    func getData() -> Data?{
        return d
    }
    func copyDataSet() -> DataSet? {
        let newData = Data()
        let newDataSet = DataSet(master: newData)
        
        newDataSet.dataSetName = dataSetName
        let cnt = m_Tables?.tables.count ?? 0
        for i in 0..<cnt {
//        for var i = 0; i < m_Tables?.tables.count; i++ {
            let oldDtTable = m_Tables?.getValueByIndex(i)
            let newDtTable = DataTable(master: newData, tableName: oldDtTable?.tableName)
            newDtTable.fieldTypeDictionary = oldDtTable?.fieldTypeDictionary ?? Dictionary()
            let oldColCnt = oldDtTable?.m_columns?.columns.count ?? 0
            for c in 0..<oldColCnt {
//            for var c = 0 ; c < oldDtTable?.m_columns?.columns.count ; c++ {
                let columnName = oldDtTable?.m_columns?.getValueByIndex(c)?.ColumnName
                let newCol = DataColumn(master: newData, columnName: columnName)
                newDtTable.m_columns?.add(newCol)
            }
            let oldRowCnt = oldDtTable?.m_rows?.rows.count ?? 0
                for r in 0..<oldRowCnt {
//            for var r = 0 ; r < oldDtTable?.m_rows?.rows.count ; r++ {
                let newRow = DataRow(master: newData)
                newRow.Table = newDtTable
                if let colCount = oldDtTable?.columnsCount() {
                    if oldDtTable?.m_rows?.getValueByIndex(r) != nil {
                        newRow.ItemArr = [String?](repeating: nil, count: colCount)
                        newRow.ItemArr = oldDtTable!.m_rows!.getValueByIndex(r)!.ItemArr
                        newDtTable.m_rows?.add(newRow)
                    }
                }
            }
            newDataSet.m_Tables?.add(newDtTable)
        }
        
        return newDataSet
    }
    deinit{
        print("DataSet deinit()")
    }
}

class DataTable :NSObject, DataTableJSDelegate  {
    var m_columns: DataColumnCollection?
    var m_rows: DataRowCollection?
    var d: Data?
    var tableName: String?
//    var m_Type: DataColumnTypeCollection?
    var fieldTypeDictionary:Dictionary<String,String> = Dictionary()
    override init()
    {
    }
    init(master: Data?, tableName: String?)
    {
        super.init()
        d = master
        self.tableName = tableName
        m_columns = DataColumnCollection(table: self)
        m_rows = DataRowCollection(table: self)
//        m_Type = DataColumnTypeCollection()
//        m_Type?.Table = self
    }
    
    func GetColumnIDX(_ strChkColumn: String?) -> Int
    {
        if m_columns == nil {
            return -1
        } else {
            return m_columns!.indexOf(strChkColumn) ?? -1
        }
        
    }
    
    //************************20160212 hwon.kim **************************
    
    func rowsCount()->Int{
        if let count = self.m_rows?.rows.count {
            return count
        } else {
            return 0
        }
    }
    func columnsCount()->Int{
        if let count = self.m_columns?.columns.count {
            return count
        } else {
            return 0
        }
    }
}

struct DataTableCollection {
    var m_DicTableName: [String]? = []
    var tables: [DataTable] = []
    var dataSet: DataSet?
    
    init() {
        
    }
    init(dataSet: DataSet?)
    {
        self.dataSet = dataSet
    }
    func getValueByIndex(_ index: Int) -> DataTable? {
        if tables.count <= index {
            return nil
        }
        else {
            return tables[index]
        }
    }
    
    func getValueByName(_ name: String?) -> DataTable? {
        if name == nil {
            return nil
        } else {
            var idx = 0
            if m_DicTableName != nil {
                if (m_DicTableName!).contains((name!)) == false {
                    // TODO: try catch
                    print("해당 테이블은 존재하지 않는 테이블입니다.\n TableName: \(name!)")
                    return nil
                } else {
                    idx = (m_DicTableName!).firstIndex(of: (name!))!
                }
                
                return tables[idx]
            } else {
                return nil
            }
        }
        
    }
    
    mutating func add(_ item: DataTable?)
    {
        if item != nil {
            tables.append(item!)
            if item!.tableName == "" {
                //190118 hwon.kim swift4 issue
                //170622 dpjang
                let count = String(dataSet?.m_Tables?.tables.count ?? 1)
                item!.tableName = "DataBlock" + count
            }
            m_DicTableName?.append(item!.tableName!)
        }
        else {
            print("--DataTableCollection--parameter is nil.")
        }
    }
    
    
    //Add necessary to check whether column name or Table exist or not
    func doesTableNameExist(_ name: String?) -> Bool
    {
        if name != nil && m_DicTableName != nil{
            return (m_DicTableName!).contains((name!))
        } else {
            print("--doesTableNameExist--parameter or collection is nil.")
            return false
        }
    }
    //delete table
    mutating func remove(_ tableName: String?)
    {
        if tableName != nil && m_DicTableName != nil {
            print("YlwCodehelpKbFrag - Acti ds size : \(String(describing: (m_DicTableName!).firstIndex(of: (tableName!))))")
            
            if let idx = (m_DicTableName!).firstIndex(of: (tableName!)) {
                tables.remove(at: idx)
                m_DicTableName!.remove(at: idx)
            }
        }
    }
    func size() -> Int{
        return tables.count
    }
}

struct DataColumnCollection {
    var Table: DataTable?
    var columns: Array<DataColumn> = Array<DataColumn>()
    var m_DicColumnName: [String] = [String]()
    init() {
    }
    init(table:DataTable)
    {
        Table = table
    }
    
    func getValueByIndex(_ index: Int) -> DataColumn?
    {
        if index == -1
        {
            return nil
        }
        if index >= 0 && index < columns.count {
            return columns[index]
        } else {
            return nil
        }
    }
    func getValueByName(_ name: String?) -> DataColumn?
    {
        if name != nil {
            return getValueByIndex(indexOf(name!)!)
        } else {
            return nil
        }
        
    }
    func indexOf(_ columnName: String?) -> Int?
    {
        if columnName != nil {
            if m_DicColumnName.contains((columnName!)) {
                return m_DicColumnName.firstIndex(of: (columnName!))
            }
            else {
                for a in 0..<m_DicColumnName.count {
                    if m_DicColumnName[a].caseInsensitiveCompare(columnName!) == ComparisonResult.orderedSame {
                        return a
                    }
                }
                return -1 //no such column
            }
        } else {
            print("--indexOf--parameter is nil.")
            return -1
        }
    }
    mutating func add(_ item: DataColumn?) {
        if item == nil {
            return
        }
        if let colName = item!.ColumnName {
            if m_DicColumnName.contains(colName) {
                return
            }
            columns.append(item!)
            
            if item!.ColumnName == "" {
                item!.ColumnName = "Column\(columns.count)"
            }
            m_DicColumnName.append(item!.ColumnName!)
        }
        else {
            print("--add--parameter is nil.")
        }
        
    }
    mutating func addWithDataRow(_ item: DataColumn?, dtData: DataTable?) {
        
        self.add(item)
        let cnt = dtData?.m_rows?.rows.count ?? 0
        for i in 0..<cnt {
//        for var i = 0; i < dtData?.m_rows?.rows.count; i++ {
            if let strArr = dtData?.m_rows?.getValueByIndex(i)?.ItemArr {
                let colCount = self.columns.count
                    var newStrArr:[String?] = Array(repeating: nil, count: colCount)
                    for c in 0..<newStrArr.count {
//                    for var c = 0; c < newStrArr.count ; c++ {
                        if c < strArr.count {
                            newStrArr[c] = strArr[c]
                        } else {
                            newStrArr[c] = ""
                        }
                    }
                    dtData?.m_rows?.getValueByIndex(i)?.ItemArr = newStrArr
                
            }
        }
    }
    mutating func changeColumnName(_ deletedColumn: String?, newColumnName: String?) {
        if deletedColumn == nil {
            return
        }
        if newColumnName == nil {
            print("--changeColumnName--parameter is nil.")
            return
        }
        if let idx = m_DicColumnName.firstIndex(of: (deletedColumn!)) {
            m_DicColumnName[idx] = newColumnName!
            columns[idx].ColumnName = newColumnName!
        }
    }
    //Add necessary to check whether column name or Table exist or not
    func doesColumnNameExist(_ name: String?) -> Bool
    {
        if name == nil {
            print("--doesColumnNameExist--parameter is nil.")
            return false
        }
        if m_DicColumnName.contains((name!)) == false {
            for a in 0..<m_DicColumnName.count{
                if m_DicColumnName[a].caseInsensitiveCompare(name!) == ComparisonResult.orderedSame {
                    return true
                }
            }
            return false
        }
        else { return true }
    }
    
    func size() -> Int{
        return columns.count
    }
}
class DataColumn
{
    var d:Data?
    var DataType: String?
    var ColumnName: String?
    var Table: DataTable?
    
    init(columnName: String?)
    {
        ColumnName = columnName
    }
    init(columnName: String?, colType: String?)
    {
        ColumnName = columnName
        DataType = colType
        
        // TODO: (type->string 변경 후 중복 호출.)
        //            type = NSStringFromClass(Int)
        
    }
    init(master: Data?, columnName: String?) {
        d = master
        ColumnName = columnName
    }
}
struct DataColumnTypeCollection {
    var Table: DataTable?
    var m_DicColumnTypeIDX: [String]?
    var columnTypes: [String] = []
    
    init()
    {
        m_DicColumnTypeIDX = []
    }
    func getValueByIndex(_ index: Int?) -> String? {
        if index != nil && index < m_DicColumnTypeIDX?.count
        {
            return m_DicColumnTypeIDX?[index!]
        }
        else {
            print("--getValueByIndex--parameter is nil.")
            return nil
        }
        
    }
    mutating func Add(_ type: String?) {
        if type == nil {
            print("--Add--parameter is nil.")
            return
        }
        columnTypes.append(type!)
        m_DicColumnTypeIDX?.append(type!)
    }
    
    func size() -> Int{
        return columnTypes.count
    }
}

struct DataRowCollection {
    
    var Table: DataTable?
    var rows: [DataRow] = []
    
    init()
    {
        //            Table = DataTable()
    }
    init(table: DataTable?)
    {
        Table = table
    }
    // TODO: override append -> structor
    mutating func add(_ item: DataRow?)
    {
        add(item, IsAdd: true)
    }
    mutating func add(_ item: DataRow?, IsAdd: Bool)
    {
        if item == nil {
            print("--add--parameter is nil.")
            return
        }
        if IsAdd && item!.workingTag == Const.WT_DEF
        {
            item!.workingTag = Const.WT_ADD
        }
        item!.Table = Table
        rows.append(item!)
    }
    mutating func add(_ arrData: [String?]) -> DataRow?
    {
        return add(arrData, IsAdd: false)
    }
    mutating func add(_ arrData: [String?], IsAdd: Bool) -> DataRow?
    {
        let item:DataRow = DataRow()
        
        if IsAdd {
            item.workingTag = Const.WT_ADD
        }
        item.ItemArr = arrData
        item.Table = Table
        rows.append(item)
        
        return item
    }
    mutating func addWithType(_ arrData: [String?], arrType: [String]) -> DataRow?
    {
        var arrData = arrData
        var arrType = arrType
        let item: DataRow? = DataRow()
        
        //            item.workingTag = Const.WT_ADD
        for i in 0..<arrData.count
        {
            var tmpStr: String = arrData[i] ?? ""
            let type: String = arrType[i]
            
            if type == "string" {
                
            } else if (type == "int"){
                // TODO: try catch finally
                var s:Int = 0
                if let m = Int(tmpStr) {
                    s = m
                } else {
                    print("int exception")
                }
                //Finally
                tmpStr = String(s)
            } else if (type == "float") {
                // TODO: try catch finally
                var s:Float = 0.0
                if let _ = tmpStr.toDouble() {
                    s = (tmpStr as NSString).floatValue
                } else {
                    print("double exception")
                }
                // TODO: check float length?
                tmpStr = String(NSString(format: "%f", s))
            } else if (type == "double") {
                var s:Double = 0.0
                if let m = tmpStr.toDouble() {
                    s = m
                } else {
                    print("double exception")
                }
                // TODO: check float length?
                tmpStr = String(NSString(format: "%f", s))
            } else if (type == "decimal") {
                
            } else {
                
            }
            arrData[i] = tmpStr
        }
        item?.ItemArr = arrData
        item?.Table = Table
        add(item)
        return item
        
    }
    mutating func addWithFieldTypeDictionary(_ arrData: [String?], colData:[String],arrType: Dictionary<String,String>) -> DataRow?
    {
        var arrData = arrData
        var arrType = arrType
        let item: DataRow? = DataRow()
        
        //            item.workingTag = Const.WT_ADD
        for i in 0..<arrData.count
        {
            var tmpStr: String = arrData[i] ?? ""
            var type: String
            
            //17.02.14 erp1demo 구매발주입력 시트 index error 
            if i >= colData.count {
                type = "string"
            }
            else {
                type = arrType[colData[i]] ?? "string"
            }
            
            if type == "string" {
                
            } else if (type == "int"){
                // TODO: try catch finally
                var s:Int = 0
                if let m = Int(tmpStr) {
                    s = m
                } else {
                    print("int exception")
                }
                //Finally
                tmpStr = String(s)
            } else if (type == "float") {
                // TODO: try catch finally
                var s:Float = 0.0
                if let _ = tmpStr.toDouble() {
                    s = (tmpStr as NSString).floatValue
                } else {
                    print("double exception")
                }
                // TODO: check float length?
                tmpStr = String(NSString(format: "%f", s))
            } else if (type == "double") {
                var s:Double = 0.0
                if let m = tmpStr.toDouble() {
                    s = m
                } else {
                    print("double exception")
                }
                // TODO: check float length?
                tmpStr = String(NSString(format: "%f", s))
            } else if (type == "decimal") {
                
            } else {
                
            }
            arrData[i] = tmpStr
        }
        item?.ItemArr = arrData
        item?.Table = Table
        add(item)
        return item
        
    }
    func getValueByIndex(_ index: Int?) -> DataRow?
    {
        if index == nil {
            print("--getValueByIndex--parameter is nil.")
            return nil
        }
        if index < rows.count {
            return rows[index!]
        } else {
            return nil
        }
    }
    // TODO: go on
    func getValueByName(_ name: String?) -> DataRow?
    {
        if name == nil {
            print("--getValueByName--parameter is nil.")
            return nil
        }
        let idx = Table?.m_columns?.indexOf(name!)
        if idx >= 0 && idx < rows.count {
            return rows[idx!]
        } else {
            return nil
        }
    }
}

class DataRow:NSObject {
    
    var Table: DataTable?
    var ItemArr: [String?] = []
    var m_WorkingTag: String = ""
    var workingTag: String = ""
    var buffer: String?
    var d: Data?
    override init()
    {
        super.init()
        setWorkingTag()
    }
    init(table: DataTable?)
    {
        super.init()
        Table = table
        setWorkingTag()
    }
    init(master: Data?)
    {
        super.init()
        d = master
        setWorkingTag()
    }
    
    func setWorkingTag(){
        workingTag = m_WorkingTag
    }
    //삭제요청
    func Delete(_ isRemove: Bool) -> DataRow?
    {
        if isRemove {
            workingTag = Const.WT_ADD
        }
        return Delete()
    }
    
    func Delete() -> DataRow?
    {
        /*
        * public const string WT_ADD = "A"; // WorkingTag : Add public
        * const string WT_UPT = "U"; // WorkingTag : Update public const
        * string WT_DEL = "D"; // WorkingTag : Delete public const string
        * WT_EXT = "E"; // WorkingTag : Except public const string WT_DEF =
        * ""; // WorkingTag : Default
        */
        
        // System.Diagnostics.Debug.WriteLine("test_" + this.WorkingTag);
        
        print("\(workingTag)")
        //            WorkingTag 에 따른 삭제 처리
        if workingTag == Const.WT_ADD
        {
            //추가 모드였다 삭제시는 DB에 적용할 필요 없으므로 바로 제거한다.
            //                for (index, obj) in enumerate(Table?.m_rows?.rows)
            //                {
            //                    if obj === self {
            //                        Table?.m_rows?.getValueByName(obj?)
            //                    }
            //                }
        }
        return self
    }
    /**
    :param: columnIndex
    :returns:
    */
    func getValueByColumnIndex(_ columnIndex: Int?) -> String?
    {
        if columnIndex == nil {
            print("--getValueByColumnIndex--parameter is nil.")
            return nil
        }
        if columnIndex! >= 0 && columnIndex! < ItemArr.count {
            return ItemArr[columnIndex!]
        }
        
        return nil
        
    }
    func setValueByColumIndex(_ columnIndex: Int?, value: String?)
    {
        var value = value
        if columnIndex == nil {
//            print("--setValueByColumIndex--parameter is nil.")
            return
        }
        if value == nil {
//            print("--setValueByColumIndex--parameter is nil.Change to empty String.")
//            value = ""
            value = nil
        }
        if workingTag == Const.WT_DEF {
            workingTag = Const.WT_UPT
        } else { }
        
        ItemArr[columnIndex!] = value
    }
    /**
    :param: columnName
    :returns:
    */
    func getValueByColumnName(_ columnName: String?) -> String? {
        if columnName == nil {
            print("--getValueByColumnName--parameter is nil.")
            return ""
        }
        let idx = self.Table?.m_columns?.indexOf(columnName)

        if idx! >= 0 && idx! < ItemArr.count {
            
            return ItemArr[idx!] ?? ""
        }
        
        return ""
    }
    func setValueByColumnName(_ columnName: String?, value: String?) {
        var value = value
        if columnName == nil {
            print("--setValueByColumnName--parameter is nil.")
            return
        }
        if value == nil {
            print("--setValueByColumnName--parameter is nil.Change to empty String.")
            value = ""
        }
        let idx = self.Table?.m_columns?.indexOf(columnName)
        if idx >= 0 && idx < ItemArr.count {
            if workingTag == Const.WT_DEF {
                workingTag = Const.WT_UPT
            } else { }
            ItemArr[idx!] = value!
        }
    }
    func SetValue(_ columnName: String?, strValue: String?, IsChange: Bool) {
        var strOldWorkingTag  = ""
        
        if IsChange == false {
            strOldWorkingTag = workingTag
        }
        setValueByColumnName(columnName, value: strValue)
        
        if IsChange == false {
            workingTag = strOldWorkingTag
        }
    }
    func Replace(_ columnName: String?, strOld: String?, strNew: String?) -> DataRow? {
        var strOld = strOld
        var strNew = strNew
        if columnName == nil {
            print("--Replace--parameter is nil.")
            return nil
        }
        if strOld == nil { strOld = "" }
        if strNew == nil { strNew = "" }
        
        if strOld != "" {
            setValueByColumnName(columnName!, value: getValueByColumnName(columnName!)?.replacingOccurrences(of: strOld!, with: strNew!, options: [], range: nil))
        }
        return self
    }
    //DataRow에 해당 컬럼의 위치를 리턴한다.
    func GetColumnIDX(_ strChkColumn: String?) -> Int? {
        if strChkColumn == nil {
            print("--GetColumnIDX--parameter is nil.")
            return -1
        }
        if let idx = Table?.GetColumnIDX(strChkColumn!)
        {
            return idx
        }
        else {
            return -1
        }
    }
}

class TestClass {
    
    func Test()
    {
        Swift.print("TestClass")
        
        let dt:Data = Data()
        
        let dsData:DataSet = DataSet()
        dsData.dataSetName = "TestDataSet"
        
        let dtData:DataTable = DataTable(master: dt, tableName: "TestTable")
        
        let col1:DataColumn = DataColumn(columnName: "col1")
        dtData.m_columns?.add(col1)
        
        let col2:DataColumn = DataColumn(columnName: "col2")
        dtData.m_columns?.add(col2)
        
        let drData:DataRow = DataRow()
        let a:[String?] = ["col1-data", "col2-data"]
        drData.ItemArr = a
        
        dtData.m_rows?.add(drData)
        dtData.m_rows?.add(drData)
        dtData.m_rows?.add(drData)
        
        dsData.m_Tables?.add(dtData)
        
        let print = dtData.m_rows?.getValueByName("col1")!.ItemArr
        Swift.print("testLog1 : \(String(describing: print))")
        
        //            var cols:DataColumnCollection = DataColumnCollection()
        Swift.print("testLog2")
        
        //            print(Util.getLogStringOfDt(dtData))
    }
}













        
