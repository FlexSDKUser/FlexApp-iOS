//
//  Util.swift
//  MobileERP
//
//  Created by Sunil Luitel on 9/3/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import Foundation
import ObjectMapper

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
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
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


class Util {
    
    class func makeDefaultWhere(_ defaultArr:[[String]])-> String {
        let size = defaultArr.count;
        var result = "";
        if size > 0 {
            for i in 0 ..< size {
                var tmp:[String] = defaultArr[i];
                if (i == 0) {
                    result = tmp[0] + " = '" + tmp[1] + "'";
                } else {
                    result += " AND " + tmp[0] + " = '" + tmp[1] + "'";
                }
            }
        }
        return result;
    }
    
    class func trimString(_ originalString:String)->String {
        return  originalString.trimmingCharacters(in: CharacterSet.whitespaces);
    }
    
    //TRUE: show Lock FALSE: show LoginVC
    class func checkLock()->Bool{
        return (SharedPreferenceUtil.getValue(Const.IS_LOGIN, dftValue: 0) == 1 && !SharedPreferenceUtil.getValue(Const.IsERPDemo, dftValue: false) && !SharedPreferenceUtil.getValue(Const.IsDEMO, dftValue: false) && (SharedPreferenceUtil.getValue(Const.LOGIN_ISAUTO, dftValue: 0) == 0||SharedPreferenceUtil.getValue(Const.IsUseAutoLogin, dftValue: 0) == 0)) && !(Util.getEssStatus())
    }
    
    class func addDataRow(_ ds: DataSet?, dataBlockName: String?, addData: String?) -> DataSet? {
        print("testLog1", "150413 AddDataRow addData : \(String(describing: addData))")
        if addData == nil || ds == nil{
            return nil
        } else {
            let pattern: String = BaseUtil.SP
            var arrItems: [String?] = []
            // TODO: try catch
            if addData == "" {
                _  = addData?.components(separatedBy: pattern)
            } else {
                let compStrArr = (addData! as NSString).substring(with: NSRange(location: 0, length: addData!.count)).components(separatedBy: pattern)
                
                arrItems = [String?](repeating: nil, count: compStrArr.count)
                for i in 0..<compStrArr.count {
                    arrItems[i] = compStrArr[i] as String
                }
            }
//            if addData!.endsWith(pattern) {
//                var itemList: [String?] = []
//                itemList.appendContentsOf(arrItems)
//                itemList.append("") // 패턴으로 끝날 경우 마지막에 빈 값이 있기 때문
//                arrItems = itemList
//            }
            print("log1: 150413 AddDataRow aryItems.length : \(arrItems.count))")
            
            let table = ds?.m_Tables?.getValueByName(dataBlockName)
//            let types = table?.m_Type?.columnTypes
            _ = table?.m_rows?.addWithFieldTypeDictionary(arrItems, colData: table?.m_columns?.m_DicColumnName ?? [], arrType: table?.fieldTypeDictionary ?? Dictionary())
//            table?.m_rows?.addWithType(arrItems, arrType: types!)
            if let colCollection = table?.m_columns?.columns {
                print("log1: 150413 AddDataRow columnSize : \(colCollection.count)")
            }
            
        }
        print("log3: AddDataRow : \(String(describing: addData)) \nDataTable name : \(String(describing: dataBlockName))")
        logDataSet(ds!)
        return ds
    }
    class func logDataSet(_ ds:DataSet) {
        let logStringOfDs = getLogStringOfDs(ds)
        print("logDataSet: \(String(describing: logStringOfDs))")
    }
    class func getLogStringOfDs(_ ds: DataSet?) -> String?
    {
        if ds == nil {
            print("ds is nil.")
            return nil
        }
        var logStr = "\nDataSet Name: \(String(describing: ds!.dataSetName))\n"
        if let tableCollection = ds!.m_Tables {
            for i in 0 ..< tableCollection.tables.count
            {
                logStr += getLogStringOfDt(tableCollection.tables[i])
            }
        }
        
        return logStr
    }
    class func logDataTable(_ dt: DataTable?) {
        let logStringOfDt = getLogStringOfDt(dt)
        print("logDataTable: \(logStringOfDt)")
    }
    class func getLogStringOfDt(_ dt: DataTable?) -> String {
        if dt == nil {
            print("dt is nil.")
            return ""
        }
        var logStr = "\nDataTable Name: \(dt!.tableName!)\n"
        
        // print column
        if let colCount = dt!.m_columns?.columns.count {
            for i in 0..<colCount {
                if let columnStr = dt!.m_columns?.columns[i].ColumnName {
                    if columnStr.count < 3 {
                        logStr += "|   \(columnStr)   "
                    }else if columnStr.count < 5 {
                        logStr += "|  \(columnStr)  "
                    }else {
                        logStr += "| \(columnStr) "
                    }
                }
            }
            logStr += "|"
            logStr += "\n"
            for _ in 0..<50 {
                logStr += "_"
            }
            logStr += "\n"
        }
        
        // print rows
        if let rowCount = dt!.m_rows?.rows.count {
            for i in 0..<rowCount {
                if let colCount = dt!.m_columns?.columns.count {
                    for j in 0..<colCount {
                        let columnStr = dt!.m_columns?.columns[j].ColumnName
                        var valueStr = ""
                        // 값을 바로 넣을 경우 valueStr이 null 일 수 있음.
                        // valueStr = dt.m_Rows....... (X)
                        if let tmpValueStr = dt!.m_rows?.rows[i].getValueByColumnIndex(j)
                        {
                            valueStr = tmpValueStr
                        }
                        var columnLength = 0
                        if columnStr != nil {
                            columnLength = columnStr!.count
                        }
                        if columnLength < 3 {
                            columnLength += 6
                        } else if columnLength < 5 {
                            columnLength += 4
                        } else {
                            columnLength += 2
                        }
                        if valueStr.count > columnLength {
                            //substring
                            let myNSString = valueStr as NSString
                            valueStr = String(myNSString.substring(with: NSRange(location: 0, length: columnLength)))
                            
                        }
                        let blank = (columnLength - valueStr.count)/2
                        
                        logStr += "|"
                        
                        for _ in 0..<blank {
                            logStr += " "
                        }
                        logStr += valueStr
                        for _ in 0..<blank {
                            logStr += " "
                        }
                        logStr += "|"
                        //                        logStr += "\n"
                    }
                }
                logStr += "\n"
            }
        }
        return logStr
    }
    class func DataSetmerge(_ dsA: DataSet?, dsB: DataSet?) -> DataSet? {
        let data: Data? = Data()
        let returnDs: DataSet? = DataSet(master: data)
        var cntA = 0
        var cntB = 0
        if let tablesB = dsB?.m_Tables?.tables {
            cntB = tablesB.count
            if cntB == 0 {
                return dsA
            }
        } else {
            return dsA
        }
        if let tablesA = dsA?.m_Tables?.tables {
            cntA = tablesA.count
            if tablesA.count == 0 {
                return dsB
            }
        } else {
            return dsB
        }
        
        returnDs?.dataSetName = dsA?.dataSetName
        
        // 기준 dsA 로 추가.. dsB에 없는것들은 rtn 추가, 같으면 DataTableMerge 호출해서 하나로 만들어주기
        // if cntA, cntB is not 0, dsA, dsB is not nil.
        for a in 0..<cntA {
            let dtName: String? = dsA!.m_Tables!.tables[a].tableName
            if dsB!.m_Tables!.doesTableNameExist(dtName) == false {
                returnDs?.m_Tables?.add(dsA!.m_Tables!.tables[a])
            } else {
                let dtA: DataTable? = dsA!.m_Tables!.tables[a]
                returnDs?.m_Tables?.add(DataTableMerge(dtA, dtB: dsB!.m_Tables?.getValueByName(dtName)))
            }
        }
        for b in 0..<cntB {
            let dtB: DataTable? = dsB!.m_Tables!.tables[b]
            let dtBName: String? = dtB!.tableName
            
            if returnDs?.m_Tables?.doesTableNameExist(dtBName) == false {
                returnDs?.m_Tables?.add(dtB)
            }
        }
        
        if returnDs != nil {
            print("DataSetMerge: \n")
            logDataSet(returnDs!)
        }
        return returnDs
    }
    class func DataTableMerge(_ dtA: DataTable?, dtB: DataTable?) -> DataTable {
        let data: Data? = Data()
        let returnDt: DataTable = DataTable(master: data, tableName: dtA?.tableName)
        
        // A column Arr
        var AColumn: [String?] = [String?](repeating: nil, count: dtA!.m_columns!.columns.count)
        // B column Arr
        var BColumn: [String?] = [String?](repeating: nil, count: dtB!.m_columns!.columns.count)
        
        let AColumnSize: Int = dtA!.m_columns!.columns.count
        let BColumnSize: Int = dtB!.m_columns!.columns.count
        
        var mergeColumnCount = AColumnSize + BColumnSize
        
        for a in 0..<AColumnSize {
            let colNm: String? = dtA!.m_columns!.columns[a].ColumnName
            let col: DataColumn? = DataColumn(master: data, columnName: colNm)
            returnDt.m_columns?.add(col)
            AColumn[a] = colNm
        }
        
        for b in 0..<BColumnSize {
            BColumn[b] = dtB!.m_columns!.getValueByIndex(b)?.ColumnName
            if dtA!.m_columns!.doesColumnNameExist(BColumn[b]) == false {
                let dc: DataColumn? = DataColumn(master: data, columnName: BColumn[b])
                returnDt.m_columns?.add(dc)
            } else {
                // 이미 존재한다면 mergeColumnCount 에서 -1.
                mergeColumnCount -= 1
            }
        }
        
        for rA in 0..<dtA!.m_rows!.rows.count {
            let rowItemArr: [String?] = dtA!.m_rows!.rows[rA].ItemArr
            let row: DataRow = DataRow(master: data)
            row.Table = returnDt
            row.ItemArr = [String?](repeating: nil, count: mergeColumnCount)
            for a in 0..<AColumnSize {
                row.setValueByColumnName(AColumn[a], value: rowItemArr[a])
            }
            returnDt.m_rows?.add(row)
        }
        let doCompareIDX = dtA!.m_columns!.doesColumnNameExist("IDX_NO") && dtB!.m_columns!.doesColumnNameExist("IDX_NO")
        if returnDt.m_rows != nil
        {
            for rB in 0..<dtB!.m_rows!.rows.count
            {
                let rowItemArr: [String?] = dtB!.m_rows!.rows[rB].ItemArr
                if doCompareIDX == true && dtA!.m_rows!.rows.count > 0
                {
                    var isIDXmatched: Bool = false
                    let bIdx: String? = dtB!.m_rows!.getValueByIndex(rB)?.getValueByColumnName("IDX_NO")
                    
                    for rD in 0..<returnDt.m_rows!.rows.count {
                        if bIdx == dtA!.m_rows!.getValueByIndex(rD)?.getValueByColumnName("IDX_NO")
                        {
                            isIDXmatched = true
                            let row: DataRow? = returnDt.m_rows!.rows[rD]
                            for b in 0..<BColumnSize
                            {
                                row?.setValueByColumnName(BColumn[b], value: rowItemArr[b])
                            }
                            //                            returnDt.m_rows?.add(row)
                        }
                    }
                    if isIDXmatched == false {
                        let row: DataRow? = DataRow(master: data)
                        row?.Table = returnDt
                        row?.ItemArr = [String?](repeating: nil, count: mergeColumnCount)
                        for b in 0..<BColumnSize {
                            row?.setValueByColumnName(BColumn[b], value: rowItemArr[b])
                        }
                        returnDt.m_rows?.add(row)
                    }
                } else {
                    var row: DataRow
                    if dtA!.m_rows!.rows.count > rB {
                        row = returnDt.m_rows!.rows[rB]
                        for b in 0..<BColumnSize
                        {
                            row.setValueByColumnName(BColumn[b], value: rowItemArr[b])
                        }
                    } else {
                        row = DataRow(master: data)
                        row.Table = returnDt
                        row.ItemArr = [String?](repeating: nil, count: mergeColumnCount)
                        for b in 0..<BColumnSize {
                            row.setValueByColumnName(BColumn[b], value: rowItemArr[b])
                        }
                        returnDt.m_rows?.add(row)
                    }
                }
            }
        }
        
        for (name,type) in dtA!.fieldTypeDictionary {
            returnDt.fieldTypeDictionary[name] = type
        }
        
        for (name,type) in dtB!.fieldTypeDictionary {
            returnDt.fieldTypeDictionary[name] = type
        }
        
        return returnDt
    }
    class func DataSetRemoveRow(_ ds: DataSet?, tableName: String?, row: Int?) {
        if ds == nil || ds?.m_Tables == nil {
            return
        }
        
        if ds!.m_Tables!.tables.count == 0 {
            return
        }
        
        if tableName == nil || tableName == "" {
            return
        } else {
            let dt: DataTable = ds!.m_Tables!.getValueByName(tableName!)!
            
            for (index, value) in ds!.m_Tables!.tables.enumerated() {
                if value === dt && index > -1{
                    if ds!.m_Tables!.getValueByName(tableName!)!.m_rows!.rows.count > row {
                        //                        var dr: DataRow = ds!.m_Tables!.getValueByName(tableName!)!.m_rows!.rows[row!]
                        ds!.m_Tables!.getValueByName(tableName!)!.m_rows!.rows.remove(at: row!)
                    }
                }
            }
            
            //            ds!.m_Tables!.tables
        }
        print("DataSetRemoveRow : \(String(describing: row)) \nDataTable name : \(String(describing: tableName))")
        logDataSet(ds!)
    }
    class func SetDataSetValue(_ ds: DataSet?, tableName: String?, columnName: String?, row: Int, value: String?) -> DataSet? {
        if ds == nil {
            return ds
        }
        if columnName == nil || columnName == "" {
            return ds
        }
        
        var tableIndex = 0
        var columnIndex = 0
        if let dt = ds!.m_Tables?.getValueByName(tableName) {
            for (index ,val) in ds!.m_Tables!.tables.enumerated() {
                if val === dt{
                    tableIndex = index
                }
            }
            if tableIndex == -1 {
                return ds
            }
            
            if dt.m_columns != nil {
                columnIndex = dt.m_columns!.indexOf(columnName)!
                if columnIndex == -1 {
                    return ds
                }
                
                if dt.m_rows != nil {
                    if dt.m_rows!.rows.count <= row {
                        return ds
                    }
                    dt.m_rows!.rows[row].ItemArr[columnIndex] = value == nil ? "":value!
                }
            }
        }
        print("SetDataSetValue : \(String(describing: value)) \nDataTable name: \(String(describing: tableName))")
        logDataSet(ds!)
        return ds
    }
    
    class func getYYYYMMDDValue(_ text:String)->String {
        var rawValue: String?
        if (text.count == 16 || text.count == 14 ) {
            let inputDateFormat = DateFormatter()
            inputDateFormat.dateFormat = "yyyy-MM-dd (E)"
            inputDateFormat.locale = Locale.current
            inputDateFormat.timeZone = TimeZone(abbreviation: "GMT")
            
            let outputDateFormat = DateFormatter()
            outputDateFormat.dateFormat = "yyyyMMdd"
            outputDateFormat.locale = Locale.current
            rawValue = outputDateFormat.string(from: inputDateFormat.date(from: text)!)
        }
        
        if rawValue != nil {
            return rawValue!
        }else{
            return text
        }
        
    }
    
    class func getYYYYMMDDText(_ value:String)->String {
        // if value is in yyyyMMdd format (value comes from dataSet) then change
        // to yyyy-MM-dd (E) for displaying
        // else show as it is
        var rawValue: String?
        if value.count == 8 {
            let inputDateFormat = DateFormatter()
            inputDateFormat.dateFormat = "yyyyMMdd"
            inputDateFormat.locale = Locale.current
            inputDateFormat.timeZone = TimeZone(abbreviation: "GMT")
            
            // checked nil value because sometimes data has value like 20160230
            if inputDateFormat.date(from: value) != nil {
                let outputDateFormat = DateFormatter()
                outputDateFormat.dateFormat = "yyyy-MM-dd (E)"
                outputDateFormat.locale = Locale.current
                
                rawValue = outputDateFormat.string(from: inputDateFormat.date(from: value)!)
            }
        }
        //        return rawValue
        
        if rawValue != nil {
            return rawValue!
        }else{
            return value
        }
    }
    
    
    class func getYYYYMMValue(_ text:String)->String {
        var rawValue: String?
        if text.count == 7 {
            let inputDateFormat = DateFormatter()
            inputDateFormat.dateFormat = "yyyy-MM"
            inputDateFormat.locale = Locale.current
            inputDateFormat.timeZone = TimeZone(abbreviation: "GMT")
            
            let outputDateFormat = DateFormatter()
            outputDateFormat.dateFormat = "yyyyMM"
            outputDateFormat.locale = Locale.current
            rawValue = outputDateFormat.string(from: inputDateFormat.date(from: text)!)
        }
        if rawValue != nil {
            return rawValue!
        }else{
            return text
        }
        
    }
    
    class func getYYYYMMText(_ value:String)->String {
        // if value is in yyyyMM format (value comes from dataSet) then change
        // to yyyy-MM (E) for displaying
        // else show as it is
        var rawValue: String?
        if value.count == 6 {
            let inputDateFormat = DateFormatter()
            inputDateFormat.dateFormat = "yyyyMM"
            inputDateFormat.locale = Locale.current
            inputDateFormat.timeZone = TimeZone(abbreviation: "GMT")
            
            let outputDateFormat = DateFormatter()
            outputDateFormat.dateFormat = "yyyy-MM"
            outputDateFormat.locale = Locale.current
            rawValue = outputDateFormat.string(from: inputDateFormat.date(from: value)!)
        }
        if rawValue != nil {
            return rawValue!
        }else{
            return value
        }
    }
    class func getTodayWithFormat(format:String="yyyyMMdd")->String{
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let newDate = Date()
        let newDateString = dateFormatter.string(from: newDate)
        
        return newDateString
    }
    
    
    //180725 hwon.kim
    //앱코
    //    1. '수주주문조회(Web)'
    //    2. '수주조회'
    //    3. '출하의뢰조회'
    //    4. '판매보관품출고요청조회'
    //    5. '거래명세서조회' 화면의 '거래명세서번호'의 최종저장시간 컬럼 추가(YYYY-MM-DD HH:MM:ss) 된 것의 표시값이
    //    YYYY-MM-DD 'T' HH-MM-SS.SSS 의 방식으로 표시되고 있습니다.
    
    //WBS 수주조회
    //    YYYY-MM-DD 'T' HH-MM-SS 의 방식으로 표시되고 있습니다.
    class func getYYYYMMHHMMSSText(text:String) -> String {
        // if value is in yyyyMM format (value comes from dataSet) then change
        // else show as it is
        var rawValue: String?
        
        
        let inputDateFormat = DateFormatter()
        inputDateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        inputDateFormat.locale = Locale.current
        inputDateFormat.timeZone = TimeZone(abbreviation: "GMT")
        
        let outputDateFormat = DateFormatter()
        outputDateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        outputDateFormat.locale = Locale.current
        
        if let date = inputDateFormat.date(from: text) {
            rawValue = outputDateFormat.string(from: date )
        }
        else {
            inputDateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            if let date = inputDateFormat.date(from: text) {
                rawValue = outputDateFormat.string(from: date )
            }
        }
        
        if rawValue != nil {
            return rawValue!
        }else{
            return text
        }
    }
    
    //2016 01 18 Heewon.Kim add
    class func DataTableToString(_ dt: DataTable, intPageCnt: Int, intRowCnt: Int) -> String {
//        let row = 0
        var srow = 0
        var sb:String = ""
        if intPageCnt > 1 && dt.m_rows?.rows.count >= intRowCnt {
            srow = (intPageCnt - 1) * intRowCnt
        }
        if let dtRowCnt = dt.m_rows?.rows.count {
            for row in srow..<dtRowCnt - 1 {
//            for (row = srow; row < dtRowCnt - 1; row++) {
                if let dtColCnt = dt.m_columns?.columns.count {
                    for col in 0..<dtColCnt {
//                    for (var col = 0; col<dtColCnt ; col++) {
                        if let str = dt.m_rows?.getValueByIndex(row)?.getValueByColumnIndex(col){
                            sb += str + BaseUtil.SP
                        } else {
                            sb += BaseUtil.SP
                        }
                    }
                    sb += BaseUtil.SP_LF
                }
            }
            for i in (dtRowCnt - 1)..<dtRowCnt {
//            for (var i = row; i < dtRowCnt; i++) {
                //마지막 row 처리
                if let dtColCnt = dt.m_columns?.columns.count {
                    for col in 0..<dtColCnt {
//                    for (var col = 0; col<dtColCnt ; col++) {
                        if let str = dt.m_rows?.getValueByIndex(i)?.getValueByColumnIndex(col) {
                            sb += str + BaseUtil.SP
                        } else {
                            sb += BaseUtil.SP
                        }
                    }
                }
            }
            return StringUtils.replaceAll(sb, replace: "null", withStr: "")
        } else {
            return ""
        }
    }
    //2016 07 27 Heewon.Kim add
    class func DBTableToString(_ table : [[String:String]], isComboSource:Bool = false) -> String {
        //        let row = 0
        if table.count <= 0 {
            return ""
        }
        
        var sb:String = ""
        var count = 0
        for row in table {
//            for kv in row {
            if isComboSource {
//                sb = ((row["CodeHelpSeq"] ?? "") + BaseUtil.SP + (row["ControlName"] ?? "") + BaseUtil.SP + (row["CodeHelpParams"] ?? "") + BaseUtil.SP + (row["Dsn"] ?? "") + BaseUtil.SP + (row["SeqColumnName"] ?? "") + BaseUtil.SP + (row["CodeSecuSeq"] ?? "") + BaseUtil.SP + (row["IsCombo"] ?? "") + BaseUtil.SP)
                sb += "\(row["CodeHelpSeq"] ?? "")\(BaseUtil.SP)\(row["ControlName"] ?? "")\(BaseUtil.SP)\(row["CodeHelpParams"] ?? "")\(BaseUtil.SP)"
                sb += "\(row["Dsn"] ?? "")\(BaseUtil.SP)\(row["SeqColumnName"] ?? "")\(BaseUtil.SP)\(row["CodeSecuSeq"] ?? "")\(BaseUtil.SP)\(row["IsCombo"] ?? "")\(BaseUtil.SP)"
            }
            else {
                for (key,value) in row {
                    if !(key.contains("key_")) {
                        sb += value + BaseUtil.SP
                    }
                }
            }
//            }
            count += 1
            if count < table.count{
                sb += BaseUtil.SP_LF
            }
        }
        return StringUtils.replaceAll(sb, replace: "null", withStr: "")
    }
    class func GetDataRowString(_ dt: DataTable, columnName: String, findData: String, rtnColumnName: String) -> String {
    let columnIndex = dt.m_columns?.indexOf(columnName)
        let rCnt =  dt.m_rows?.rows.count ?? 0
        for i in 0..<rCnt {
//        for var i = 0; i < dt.m_rows?.rows.count; i++ {
            if dt.m_rows?.getValueByIndex(i)?.getValueByColumnIndex(columnIndex) == findData {
                return dt.m_rows!.getValueByIndex(i)!.getValueByColumnName(rtnColumnName)!
            }
        }
        return ""
    }

    class func DataStringToTable(_ tableName : String, tableStr: String, columnArr: [String]) -> DataTable {
        let data:Data = Data()
        let dtData:DataTable = DataTable(master: data, tableName: tableName)
        
        for c in 0..<columnArr.count {
            let col:DataColumn = DataColumn(master: data, columnName: columnArr[c])
            dtData.m_columns?.add(col)
        }

        var rowArr:[String] = []
        if (tableStr != "" && !tableStr.isEmpty){
            rowArr = tableStr.components(separatedBy: BaseUtil.SP_LF)
            for i in 0..<rowArr.count {
                var rowCellArr = rowArr[i].components(separatedBy: BaseUtil.SP)
                let drData:DataRow = DataRow()
                for j in 0..<rowCellArr.count {
                    drData.ItemArr.append(rowCellArr[j])
                }
                dtData.m_rows?.add(drData)
            }
        }
        return dtData
    }

    // 16.03.11 dpjang
    class func getFilteringCodeHelp(_ dsData: DataSet, subCondition: String) {
        
        // 18.10.01 dpjang =, OR, AND
        var sub1: [String] = []
        if(subCondition.contains("=")){
            sub1 = subCondition.components(separatedBy: "=")
        }else if(subCondition.contains("OR")){
            sub1 = subCondition.components(separatedBy: "OR")
        }else if(subCondition.contains("AND")){
            sub1 = subCondition.components(separatedBy: "AND")
        }else{
            return;
        }
        
        var deleteRowArr: [String] = []
        let table = dsData.m_Tables?.getValueByName("_SCACodeHelpQuery")
        for i in 0..<sub1.count {
            if StringUtils.contains(originalString: sub1[i], searchString: "=") {
                let columnName = sub1[i].components(separatedBy: "=")[0]
                let value = sub1[i].components(separatedBy: "=")[1]
                let cnt = table?.m_rows?.rows.count ?? 0
                for r in 0..<cnt {
                    let row = table?.m_rows?.getValueByIndex(r)
                    if row?.getValueByColumnName(columnName) == value {
                        if deleteRowArr.contains("\(r)") {
                            deleteRowArr = deleteRowArr.filter{ $0 != "\(r)" }
                        }
                    } else {
                        deleteRowArr.append("\(r)")
                    }
                }
            }
        }
        
        for d in 0..<deleteRowArr.count{
            _ = table?.m_rows?.getValueByIndex(Int(deleteRowArr[d]))?.Delete()
        }
    }
    
    //16.06.21 hwon.kim
    class func sizeSelectContentsCountInDsTb(_ table : DataTable, column : String, whereStr : String) -> Int{
        var count = 0
        for i in 0..<table.rowsCount() {
            if table.m_rows?.getValueByIndex(i)?.getValueByColumnName(column) == whereStr {
                count += 1
            }
        }
        return count
    }
    
    //170919
    class func MessageCheck(dsForCheck:DataSet?)->Bool{
        if let ds = dsForCheck {
            if let tables = ds.m_Tables {
                if !tables.doesTableNameExist("ErrorMessage") {
                    return true
                }
            }
        }
        return false
    }
    class func getPWExpiredDayCount(_ userPwdChgDate:String) -> Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        let chgDate = dateFormatter.date(from: userPwdChgDate)
        let currDate = Date()
        
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: chgDate!)
        let date2 = calendar.startOfDay(for: currDate)
        let components = calendar.dateComponents([.day], from: date1, to:date2)
        return components.day ?? 0
//        return 90
    }
    // Firebase Companity
    class func encodeAsFirebaseKey(_ encodeStr : String) -> String{
        return encodeStr.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "%2E").replacingOccurrences(of: "$", with: "%24").replacingOccurrences(of: "[", with: "%5B").replacingOccurrences(of: "]", with: "%5D").replacingOccurrences(of: "/", with: "%2F")
    }
    class func decodeAsFirebaseKey(_ decodeStr : String) -> String {
        return decodeStr.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "%2E", with: ".").replacingOccurrences(of: "%24", with: "$").replacingOccurrences(of: "%5B", with: "[").replacingOccurrences(of: "%5D", with: "]").replacingOccurrences(of: "%2F", with: "/")
    }
    
    //180209 hwon.kim
    //xml내에 xml을 넣기 위해서 <,>기호를 바꿔준다
    class func changeXmlString( _ xmlString:String)->String{
        
        //http://aker.tistory.com/259
        //http://m.blog.naver.com/ytj0116/220690489454
        var xmlString = xmlString
        
        xmlString = xmlString.replacingOccurrences(of: "&", with: "&#38;")
        
        xmlString = xmlString.replacingOccurrences(of: "<", with: "&#60;")
        
        xmlString = xmlString.replacingOccurrences(of: ">", with: "&#62;")
        
        xmlString = xmlString.replacingOccurrences(of: ",", with: "&#44;")
        
//        xmlString = xmlString.replacingOccurrences(of: ".", with: "&#46;")
        
        return xmlString
    }
    
    class func makeFormOfXmlParam(VariableValues: [[String]],DataBlockName: String,  WorkingTagValue: String) -> String {
        
        var combineBaseAndDynamicValues: [[String]] = []
        combineBaseAndDynamicValues.append(["WorkingTag", WorkingTagValue])// @workingTag
        combineBaseAndDynamicValues.append(["IDX_NO", "1"])
        combineBaseAndDynamicValues.append(["Status", "0"])
        combineBaseAndDynamicValues.append(["DataSeq", "1"])
        combineBaseAndDynamicValues.append(["Selected", "1"])
        combineBaseAndDynamicValues.append(["TABLE_NAME", DataBlockName])
        combineBaseAndDynamicValues.append(["IsChangedMst", "0"])
        combineBaseAndDynamicValues.append(contentsOf: VariableValues)
        
        var testString = ""
        for keyData in combineBaseAndDynamicValues {
            testString = testString + makeXmlForm(keyName: keyData[0], isOpen: true) + keyData[1] + makeXmlForm(keyName: keyData[0], isOpen: false)
        }
        
        var xmlDocString = ""
        xmlDocString = makeXmlForm(keyName: "ROOT", isOpen: true)
        xmlDocString = xmlDocString + makeXmlForm(keyName: DataBlockName, isOpen: true)
        xmlDocString = xmlDocString + testString
        xmlDocString = xmlDocString + makeXmlForm(keyName: DataBlockName, isOpen: false)
        xmlDocString = xmlDocString + makeXmlForm(keyName: "ROOT", isOpen: false)
        
        
        return xmlDocString
        
    }
    
   class func makeXmlForm( keyName: String, isOpen: Bool) -> String {
        var xmlKey = ""
        
        if (isOpen) {
            xmlKey = "<\(keyName)>"
        } else {
            xmlKey = "</\(keyName)>"
        }
        return xmlKey
        
    }
    
    class func erpServiceArrList(XmlDoc: String,companySeq: Int, LanguageSeq: Int, UserSeq: Int) -> [String] {
        
        var serviceArrList: [String] = []
        
        serviceArrList.append(XmlDoc)
        serviceArrList.append("")// @xmlFlags
        serviceArrList.append("")// @ServiceSeq
        serviceArrList.append("")// @WorkingTag
        serviceArrList.append(String(companySeq))// @CompanySeq
        serviceArrList.append(String(LanguageSeq))// @LanguageSeq
        serviceArrList.append(String(UserSeq))// @UserSeq
        serviceArrList.append("")// @PgmSeq
        
        return serviceArrList;
        
    }
    
    //190225 hwonkim
    //add loginSvcDTO for MobileERPLite
    class func getEssStatus(loginSvcDTO:LoginSvcDTO)->Bool {

        let isESS = loginSvcDTO.login_IsESS
//        let isESSUser = SharedPreferenceUtil.getValue(Const.IsESSUser, dftValue: "0")
//        let licenseType = SharedPreferenceUtil.getValue(Const.LicenseType, dftValue: "")
//        let productType = SharedPreferenceUtil.getValue(Const.ProductType, dftValue: "")
//
//        var isESSStatus = false
//
//        if productType == Const.PT_Ever {
//            isESSStatus = (isESS && isESSUser == "1")
//        }
//        else {
//            isESSStatus = (isESS && licenseType == Const.LT_ESS_USER)
//        }
        return isESS && Util.getEssAble(loginSvcDTO:loginSvcDTO)
    }
    class func getEssStatus()->Bool {
        
        let isESS = SharedPreferenceUtil.getValue(Const.LOGIN_ISESS, dftValue: false)
        //        let isESSUser = SharedPreferenceUtil.getValue(Const.IsESSUser, dftValue: "0")
        //        let licenseType = SharedPreferenceUtil.getValue(Const.LicenseType, dftValue: "")
        //        let productType = SharedPreferenceUtil.getValue(Const.ProductType, dftValue: "")
        //
        //        var isESSStatus = false
        //
        //        if productType == Const.PT_Ever {
        //            isESSStatus = (isESS && isESSUser == "1")
        //        }
        //        else {
        //            isESSStatus = (isESS && licenseType == Const.LT_ESS_USER)
        //        }
        
        return isESS && Util.getEssAble()
    }
    class func getEssAble()->Bool {
        
        //let isESS = SharedPreferenceUtil.getValue(Const.LOGIN_ISESS, dftValue: false)
        let isESSUser = SharedPreferenceUtil.getValue(Const.IsESSUser, dftValue: "0")
        let licenseType = SharedPreferenceUtil.getValue(Const.LicenseType, dftValue: "")
        let productType = SharedPreferenceUtil.getValue(Const.ProductType, dftValue: "")
        
        var isEssAble = false
        
        if productType == Const.PT_Ever {
            isEssAble = (isESSUser == "1") || (licenseType == Const.LT_ESS_USER)
        }
        else {
            isEssAble = (licenseType == Const.LT_ESS_USER)
        }
        
        return isEssAble
    }
    //190225 hwonkim
    //add loginSvcDTO for MobileERPLite
    class func getEssAble(loginSvcDTO:LoginSvcDTO)->Bool {
        
        //let isESS = SharedPreferenceUtil.getValue(Const.LOGIN_ISESS, dftValue: false)
        let isESSUser = loginSvcDTO.isEssUser
            //SharedPreferenceUtil.getValue(Const.IsESSUser, dftValue: "0")
        let licenseType = loginSvcDTO.licenseType
//            SharedPreferenceUtil.getValue(Const.LicenseType, dftValue: "")
        let productType = loginSvcDTO.productType
//            SharedPreferenceUtil.getValue(Const.ProductType, dftValue: "")
        
        var isEssAble = false
        
        if productType == Const.PT_Ever {
            isEssAble = (isESSUser == "1") || (licenseType == Const.LT_ESS_USER)
        }
        else {
            isEssAble = (licenseType == Const.LT_ESS_USER)
        }
        
        return isEssAble
    }
    //180509 hwon.kim ess
    class func removeLoginOptionSharedPreference(){
        SharedPreferenceUtil.remove(Const.IsESSUser)
        SharedPreferenceUtil.remove(Const.LOGIN_ISESS)
        SharedPreferenceUtil.remove(Const.LicenseType)
        SharedPreferenceUtil.remove(Const.ProductType)
        SharedPreferenceUtil.remove(Const.LOGIN_ISAUTO)
        SharedPreferenceUtil.remove(Const.IsUseAutoLogin)
    }
    
    //180516 hwon.kim
    class func getFileServerDir() -> String {
        var returnValue = ""
        let paths = NSString(string: (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] ))
        let devicePath = paths.appendingPathComponent("BaseFormClass.txt")
        let checkValidation = FileManager.default
        if checkValidation.fileExists(atPath: devicePath) {
            let fileContent1: Foundation.Data? = checkValidation.contents(atPath: devicePath)
            let str = NSString(data: fileContent1!, encoding: String.Encoding.utf8.rawValue)!
            let tempBase = Mapper<BaseFormClass>().map(JSONString: str as String)
            
            if tempBase != nil {
                returnValue = tempBase!.getFileServerDir()
            }
        }
        return returnValue
    }
    
    //180528 hwon.kim
    //get file path (org)
    //orgFileType : one of bottom three values
    //Const.ORG_FILE_TYPE.BACKGROUND(THUMB,PROFILE)
    //fileName(name+ext) ex) coffee.png
    class func getDownloadImageURL(orgFileType:String,fileName:String) -> String {
        var path = Util.getFileServerDir()
        switch orgFileType {
        case Const.ORG_FILE_TYPE.PROFILE:
            path += Const.FILESERVICE_ORG_PROFILE_UPLOAD_PATH
        case Const.ORG_FILE_TYPE.THUMB:
            path += Const.FILESERVICE_ORG_THUMB_UPLOAD_PATH
        case Const.ORG_FILE_TYPE.BACKGROUND:
            path += Const.FILESERVICE_ORG_BACKGROUND_UPLOAD_PATH
        case Const.COMPANITY_BACKGROUND:
            path += Const.FILESERVICE_COMPANITY_BACKGROUND_DOWNLOAD_PATH
        break;
        default:
            print(orgFileType)
        }
        path = path + fileName
        if let fp = path.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            var url = SharedPreferenceUtil.getValue(Const.FileServiceURL, dftValue: "")
            url = url + "downloadImage?filePath=" + fp
            return url
        }
        else {
            return WebConst.FileServiceURL_CREATE_ERROR
        }
    }
    
    class func readFromFile(_ fileName: String) -> String? {
        let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            return inString
        }
        return nil
    }
}

extension String {
    func beginsWith (_ str: String) -> Bool {
        if let range = self.range(of: str) {
            return range.lowerBound == self.startIndex
        }
        return false
    }
    func endsWith (_ str: String) -> Bool {
        if let range = self.range(of: str, options: NSString.CompareOptions.backwards) {
            return range.upperBound == self.endIndex
        }
        return false
    }
    subscript(integerIndex: Int) -> Character {
        let index = self.index(startIndex, offsetBy: integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: integerRange.lowerBound)
        let end = index(startIndex, offsetBy: integerRange.upperBound)
        let range = start..<end
        return String(self[range])
    }
    
    //0919 change password
    func filledLeftWith(_ filledWith:String = "0") -> String{
        var str = self
        while str.count < 5 {
            str = filledWith + str
        }
        return str
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func isEmptyOrWhitespace() -> Bool {
        
        if(self.isEmpty) {
            return true
        }
        
        return (self.trimmingCharacters(in: .whitespacesAndNewlines) == "")
    }
    
    func stringHeightWithFontSize(_ fontSize: CGFloat,width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping;
        let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font):font,
                          convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle):paragraphStyle.copy()]
        
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: convertToOptionalNSAttributedStringKeyDictionary(attributes), context:nil)
        return rect.size.height
    }
}

class LoginUtil {
//    class func setPolicy(pDic:Dictionary<String,String>){
//        SharedPreferenceUtil.put(Const.BEACON_UpdateTime, value: WebServiceUtil.convertDateTime(pDic["BeaconUpdateTime"] ?? ""))
//        let beaconUpdateTime = SharedPreferenceUtil.getValue(Const.BEACON_UpdateTime, dftValue: "")
//        //180403 hwon.kim
//        //창 뜨고 선택안했는데 바로 사라짐
//        if !beaconUpdateTime.isEmpty {
//            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//                appDelegate.checkPermission()
//                appDelegate.beaconManager.requestAlwaysAuthorization()
//            }
//        }
//        SharedPreferenceUtil.put(Const.AUTO_LOGOUT_TIME, value: Int(pDic["AutoLogOutTime"] ?? "10") ?? 10)
//        SharedPreferenceUtil.put(Const.IsPatternEnabled, value: pDic["Pattern"] ?? "N")
//        SharedPreferenceUtil.put(Const.IsSearchBlock, value: Int(pDic[Const.IsSearchBlock] ?? "0") ?? 0)
//        //                            SharedPreferenceUtil.put(Const.PARSING_VERSION, value: "0")
//        //hwon.kim 180322
//        //remove auto login
//        SharedPreferenceUtil.put(Const.IsUseAutoLogin, value: Int(pDic[Const.IsUseAutoLogin] ?? "1") ?? 1)
////        SharedPreferenceUtil.put(Const.IsUseAutoLogin, value: 0)
//
//        SharedPreferenceUtil.put(Const.PARSING_VERSION, value: pDic["ParsingVersion"] ?? "0")
//
//        SharedPreferenceUtil.put(Const.IsUsePattern, value: pDic[Const.IsUsePattern] ?? "0")
//        // 17.01.23 dpjang - added column on mobileSecurity
//        SharedPreferenceUtil.put(Const.IS_USE_PGM_SETTING_BLOCK, value: pDic[Const.IS_USE_PGM_SETTING_BLOCK] ?? "0")
//
//        // 17.09.22 osbaek - ServerDllVersion: version up when add feature
//        SharedPreferenceUtil.put(Const.SERVER_DLL_VERSION, value: pDic["ServerDllVersion"] ?? "0")
////        SharedPreferenceUtil.put(Const.SERVER_DLL_VERSION, value: "0")
//
//        // 17.09.22 osbaek - IsUsePwdChange:1-enable change pw on mobile
//        if (pDic["ServerDllVersion"] ?? "0") > "0" {
//            SharedPreferenceUtil.put(Const.IsUsePwdChange, value: pDic["IsUsePwdChange"] ?? "0")
//        } else {
//            SharedPreferenceUtil.put(Const.IsUsePwdChange, value: "0")
//        }
//
//        //17.10.10 hwon.kim - Board & Companity 0:no use 1:use
//        SharedPreferenceUtil.put(Const.IsUseBoard, value: pDic[Const.IsUseBoard] ?? "0")
//        SharedPreferenceUtil.put(Const.IsUseCompanity, value: pDic[Const.IsUseCompanity] ?? "0")
//        SharedPreferenceUtil.put(Const.IsUseOrgChart, value: pDic[Const.IsUseOrgChart] ?? "0")
//        SharedPreferenceUtil.put(Const.IsUseAttendance, value: pDic[Const.IsUseAttendance] ?? "0")
//
//        //17.12.13 hwon.kim - File Service - file server url
//        SharedPreferenceUtil.put(Const.FileServiceURL, value: pDic[Const.FileServiceURL] ?? "")
//
//        //18.10.17 hwon.kim - Noti Service - noti server url
//        SharedPreferenceUtil.put(Const.NotiServiceURL, value: pDic[Const.NotiServiceURL] ?? "")
//        
//        SharedPreferenceUtil.put(Const.COMPANITY_SERVER_ID, value: pDic["ServerID"] ?? "")
//        
//        //DllVersion 3부터 생체 인증 사용 가능
//        //LockScreen Version (3)
//        if (pDic["ServerDllVersion"] ?? "0") >= "2" {
//            SharedPreferenceUtil.put(Const.IsUseBio, value: pDic[Const.IsUseBio] ?? "0")
//            SharedPreferenceUtil.put(Const.IsBioEnabled, value: pDic["BIO"] ?? "N")
//        } else {
//            SharedPreferenceUtil.put(Const.IsUseBio, value: "0")
//            SharedPreferenceUtil.put(Const.IsBioEnabled, value: "N")
//        }
//
//        //180611
//
//        SharedPreferenceUtil.put(Const.IS_USE_FB_AUTH, value: pDic[Const.IS_USE_FB_AUTH] ?? "0")
//
//        //20181023 Sunil added
//        SharedPreferenceUtil.put(Const.FIRST_VISIBLE_PGMSEQ, value: pDic["FirstVisiblePgmSeq"] ?? "")
//
//    }
//    class func checkPolicy(view:UIView,tcaCompany1:Dictionary<String,Dictionary<String,String>>,policyDic:Dictionary<String,Dictionary<String,String>>)->String{
////        Util.removeLoginOptionSharedPreference()
//
//        var loginType = "1"
//
//        if let dic = tcaCompany1["_TCACompany1"] {
//            if (dic["UserLoginType"] == "4") {
//                print("login type 4 -- certification \n")
//                // exe Certification.class
//
//            } else {
//                // check _TCAMobileSecurityPolicy
//                //                [180201 multi policy]
//                SharedPreferenceUtil.put(Const.IsESSUser, value: dic[Const.IsESSUser] ?? "0")
//
//                let licenseType = dic[Const.LicenseType] ?? ""
//                SharedPreferenceUtil.put(Const.LicenseType, value: licenseType)
//                if licenseType == Const.LT_ESS_USER {
//                    SharedPreferenceUtil.put(Const.LOGIN_ISESS, value: true)
//                }
//
//                let policyCount = policyDic.count
//                if policyCount > 0 {
//                    var companyPolicyDic = policyDic[String(BaseUserValue.CompanySeq)]
//                    if companyPolicyDic == nil {
//                        for (_,policy) in policyDic {
//                            companyPolicyDic = policy
//                        }
//                    }
//                    let pDic = companyPolicyDic!
//                    let app_version = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? ""
//                    //버전체크(MobileVersion_ios)
//                    let limit_version = pDic["MobileVersion_ios"] ?? ""
//
//                    //180813 크린토피아 강제업데이트 문제
//                    //"2.1.10" < "2.1.5" => true
//                    let willUpdate = compareAppVersion(basic_version: app_version,compare_version: limit_version)
//
//                    if willUpdate {
//                        let ForciblyApply = pDic["ForciblyApply_ios"] ?? ""
//                        if ForciblyApply == "1" {
//                            let erpURL = "https://itunes.apple.com/app/id1130920848"
//                            if let url = URL(string: erpURL) {
//                                if UIApplication.shared.canOpenURL(url) {
//                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                                }
//                            }
//                            //강제종료(ForciblyApply_ios : "1")
//                            exit(0)
//                        }
//                        else {
//                            //toast
//                            //limit_version 버전 이상으로 업데이트 진행해주세요.
//                            DispatchQueue.main.async {
//                                let SCREEN_SIZE = UIScreen.main.bounds.size
//                                let lblFrameX = (SCREEN_SIZE.width - DimenConstants.toast_lbl_width2)/2
//                                let lblFrameY = (SCREEN_SIZE.height - DimenConstants.toast_lbl_height - DimenConstants.toast_padding)
//                                let lbl = UILabel()
//                                lbl.frame = CGRect(x: lblFrameX, y: lblFrameY, width: DimenConstants.toast_lbl_width2, height: DimenConstants.toast_lbl_height)
//                                lbl.text = "\(limit_version) 버전 이상으로 업데이트 진행해주세요."//NSLocalizedString("NewForm Text", comment: "New Form ")
//                                lbl.textAlignment = .center
//                                lbl.textColor = UIColor.white
//                                lbl.backgroundColor = UIColor.black
//                                lbl.font = UIFont(name: "Times New Roman", size: 13)
//                                lbl.alpha = 0
//                                lbl.tag = -999999
//                                view.addSubview(lbl)
//                                UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
//                                    lbl.alpha = 1.0
//                                },completion:nil)
//
//                                //                self.showShortToast(message:NSLocalizedString("NewForm Text", comment: "New Form "))
//                            }
//                        }
//                    }
//                    
//                    LoginUtil.setPolicy(pDic: pDic)
//
//                    //hwon.kim 180322
//                    //잠금화면 추가 - 기존 로그인 화면에서는 비밀번호 로그인만 하게 될 것.
//                    
//                    switch pDic["LastLoginType"] ?? ""
//                    {
////                    case "1" :
////                        if pDic["Pattern"] == "N" {
////                            print("login type 1 -- password \n")
////                            loginType = "1"
////                        }
////                        else if pDic["Pattern"] == "Y" {
////                            if pDic["IsUsePattern"] == "1" {
////                                print("login type 3 -- pattern \n")
////                                loginType = "3"
////                            }
////                            else if pDic["IsUsePattern"] == "0" {
////                                print("login type 1 -- password \n")
////                                loginType = "1"
////                            }
////                        }
//                    case "2" :
//                        print("login type 2 -- auto \n")
//                        loginType = "2"
//
//                        //hwon.kim 180322
//                        //remove auto login
//                        if SharedPreferenceUtil.getValue(Const.IsUseAutoLogin, dftValue: 1) == 0 {
//                            loginType = "1"
//                        }
//
////                        if pDic["Pattern"] == "Y" {
////                            if pDic["IsUsePattern"] == "1" {
////                                print("login type 3 -- pattern \n")
////                                loginType = "3"
////                            }
////                            else if pDic["IsUsePattern"] == "0" {
////                                print("login type 1 -- password \n")
////                                loginType = "1"
////                            }
////                        }
////                    case "3" :
////                        print("login type 3 -- pattern \n")
////                        if pDic["IsUsePattern"] == "1" {
////                            print("login type 3 -- pattern \n")
////                            loginType = "3"
////                        }
////                        else if pDic["IsUsePattern"] == "0" {
////                            print("login type 1 -- password \n")
////                            loginType = "1"
////                        }
////                    case "4" :
////                        print("login type 4 -- certification \n")
//                    default :
//                        print("No LastLoginType \n")
//                    }
//                    
////                    loginType = "1"
//                    if SharedPreferenceUtil.getValue(Const.LoginType, dftValue: "") == "-1" {
//                        SharedPreferenceUtil.put(Const.LoginType, value: "1")
//                        loginType = "1"
//                    }
//                    else {
//                        SharedPreferenceUtil.put(Const.LoginType, value: loginType)
//                    }
//                }
//                else {
//                    SharedPreferenceUtil.put(Const.AUTO_LOGOUT_TIME, value: 10)
////                    SharedPreferenceUtil.put(Const.PatternYN, value:"N")
//                    SharedPreferenceUtil.put(Const.IsPatternEnabled, value:"N")
//                    SharedPreferenceUtil.put(Const.IsBioEnabled, value:"N")
//                    SharedPreferenceUtil.put(Const.IsSearchBlock, value: 0)
//                    //                            SharedPreferenceUtil.put(Const.PARSING_VERSION, value: "0")
//                    //hwon.kim 180322
//                    //remove auto login
////                    SharedPreferenceUtil.put(Const.IsUseAutoLogin, value: 1)
//
//                    SharedPreferenceUtil.put(Const.IsUseAutoLogin, value: 0)
//
//                    SharedPreferenceUtil.put(Const.PARSING_VERSION, value: "0")
//                    loginType = "1"
//                    SharedPreferenceUtil.put(Const.LoginType, value: "1")
//                    SharedPreferenceUtil.put(Const.IS_USE_FB_AUTH, value: "0")
//                }
//            }
//        }
//        return loginType
//    }
    
    class func compareAppVersion(basic_version:String,compare_version:String)->Bool{
        guard basic_version != "-1" else {
            return true
        }
        var isSmaller = false
        //. split -> 하나씩 비교
        let basic_version_arr = basic_version.components(separatedBy: ".")
        let compare_version_arr = compare_version.components(separatedBy: ".")

        guard compare_version_arr.count > 2 else {
            return false
        }
        
        if basic_version_arr.count > 2 {
            var i = 0
            repeat {
                if let basic_version_first = Int(basic_version_arr[i]) {
                    if let compare_version_first = Int(compare_version_arr[i]) {
                        if basic_version_first < compare_version_first {
                            isSmaller = true
                        }
                        else if basic_version_first > compare_version_first {
                            break;
                        }
                    }
                }
                i += 1
            } while (i < 3) && !isSmaller
        }
        return isSmaller
    }
    class func checkBizroad()->Bool{
        let loginServer = SharedPreferenceUtil.getValue(Const.LOGIN_SERVER, dftValue:"")

        let isBizRoad = loginServer.contains(Const.SK_cloudz_domain) || loginServer.contains(Const.SK_cloudz_dev_ip) || loginServer.contains(Const.SK_cloudz_live_ip)
        
        return isBizRoad
    }
    
    //앱 버전을 체크하여 디비 스크립트를 실행한다.
//    class func checkVersion(){
//        let loginUtil = LoginUtil()
//        let sqlHandler = YLWSqlHandler()
//        var sqlArr:[String] = []
//
//        let app_version = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? ""
//        let check_version = SharedPreferenceUtil.getValue(Const.CHECK_VERSION, dftValue: "-1")
//        
//        //이 전에 check한 버전이 app_version보다 작으면 실행시킨다.
//        if  compareAppVersion(basic_version: check_version, compare_version: app_version) {
////            var tableNames:[String] = []
//            //초기 컬럼
////            if check_version < "0" {
////
////                let tableNamesResult = sqlHandler.excuteQueryByString("SELECT name FROM sqlite_master WHERE type='table'")
////                for row in tableNamesResult {
////                    if let name = row["name"]{//row[0]["name"] {
////                        tableNames.append(name)
////                    }
////                }
////
////                loginUtil.dbVersion0(tableNames: tableNames,sqlArr:&sqlArr)
////            }
////            
////            //2.0.20 : FormManagement에 isFromMenu 컬럼 추가
////            if compareAppVersion(basic_version: check_version, compare_version: "2.0.20")
////            {
////                loginUtil.dbVersion1(sqlArr: &sqlArr)
////            }
////
////            //2.0.27 : FormManagement에 InitializeDate 컬럼 추가
////            if compareAppVersion(basic_version: check_version, compare_version: "2.0.27") {
////                loginUtil.dbVersion2(sqlArr: &sqlArr)
////            }
////
////            //2.0.40 : RecentlyUsedCodehelpMode
////            if compareAppVersion(basic_version: check_version, compare_version: "2.0.40")
////            {
////                if tableNames.index(of: TableConstants.RecentlyUsedCodehelpMode) == nil {
////                    loginUtil.dbVersion3(sqlArr: &sqlArr)
////                }
////            }
////
////            //2.0.43 : ApiSeq
////            if compareAppVersion(basic_version: check_version, compare_version: "2.0.43") {
////                loginUtil.dbVersion4(sqlArr: &sqlArr)
////            }
////
////            //2.0.48 : beacon
////            if compareAppVersion(basic_version: check_version, compare_version: "2.0.48") {
////                loginUtil.dbVersion5(sqlArr: &sqlArr)
////            }
////
////            //2.0.51 : add column pgmFavName
////            if compareAppVersion(basic_version: check_version, compare_version: "2.0.51") {
////                loginUtil.dbVersion6(sqlArr: &sqlArr)
////            }
////
////            //2.1.5 : delete all data from Message, MessageControl
////            if compareAppVersion(basic_version: check_version, compare_version: "2.1.5") {
////                loginUtil.dbVersion7(sqlArr: &sqlArr)
////            }
////            //2.1.7 : add the data for codehelp user selected wild card type
////            if compareAppVersion(basic_version: check_version, compare_version: "2.1.7") {
////                loginUtil.dbVersion8(sqlArr: &sqlArr)
////            }
//            
//            //2.1.13 : create table for companity recent receiver groups
//            if compareAppVersion(basic_version: check_version, compare_version: "2.1.13") {
//                loginUtil.dbVersion9(sqlArr: &sqlArr)
//            }
//            
//            //2.1.19 : add column 'IsOn' to CMPTYUsers
//            if compareAppVersion(basic_version: check_version, compare_version: "2.1.19") {
//                loginUtil.dbVersion10(sqlArr: &sqlArr)
//            }
//
//            //execute sql create
//            if sqlArr.count > 0 {
//                sqlHandler.excuteQueryByArray(sqlArr)
//            }
//        }
//            loginUtil.dbVersion11(sqlArr: &sqlArr)
//        
//        //execute sql create
//        if sqlArr.count > 0 {
//            sqlHandler.excuteQueryByArray(sqlArr)
//        }
//        
//        SharedPreferenceUtil.put(Const.CHECK_VERSION, value: app_version)
//    }
//    func dbVersion0(tableNames:[String], sqlArr:inout [String]){
//
//
//        if tableNames.index(of: CommonConstants.barchartTable) == nil {
//            sqlArr.append("CREATE TABLE BarSelectionTable (SetSeq INTEGER, GroupingControlSeq VARCHAR, QuantityControlSeq VARCHAR, GroupingValues VARCHAR)")
//        }
//        if tableNames.index(of: CommonConstants.bubblechartTable) == nil {
//            sqlArr.append("CREATE TABLE BubbleSelectionTable (SetSeq INTEGER, GroupingControlSeq VARCHAR, QuantityX VARCHAR, QuantityY VARCHAR, QuantityZ VARCHAR, GroupingValues VARCHAR)")
//        }
//        if tableNames.index(of: CommonConstants.linechartTable) == nil {
//            sqlArr.append("CREATE TABLE LineSelectionTable (SetSeq INTEGER, GroupingControlSeq VARCHAR, GroupingDateSeq VARCHAR, QuantityControlSeq VARCHAR, GroupingValues VARCHAR)")
//        }
//        if tableNames.index(of: CommonConstants.piechartTable) == nil {
//            sqlArr.append("CREATE TABLE PieSelectionTable (SetSeq INTEGER, GroupingControlSeq VARCHAR, QuantityControlSeq VARCHAR, GroupingValues VARCHAR)")
//        }
//        if tableNames.index(of: TableConstants.ConnectionInfoTable) == nil {
//            sqlArr.append("CREATE TABLE ConnectionInfoTable (bis VARCHAR, oper VARCHAR, conn VARCHAR)")
//        }
//
//        //        if tableNames.index(of: TableConstants.RecentlyUsedCodehelpMode) == nil {
//        //            sqlArr.append("CREATE TABLE RecentlyUsedCodehelpMode (serverIP VARCHAR, dsn VARCHAR, userSeq VARCHAR, languageSeq VARCHAR, CompanySeq INTEGER, CodeHelpSeq INTEGER, ControlSeq INTEGER, pgmSeq VARCHAR, recentInputMode INTEGER)")
//        //        }
//
//        let columnSearchResult = YLWSqlHandler().excuteQueryByString("SELECT sql FROM sqlite_master WHERE name='\(TableConstants.FormInfoTable)' AND sql LIKE '%formInfoData%'")
//
//        print(columnSearchResult)
//
//        if columnSearchResult.count < 1 {
//            sqlArr.append("alter table \(TableConstants.FormInfoTable) add column formInfoData VARCHAR")
//        }
//    }
//    func dbVersion1(sqlArr: inout [String]){
//        let columnSearchResult = YLWSqlHandler().excuteQueryByString("SELECT sql FROM sqlite_master WHERE name='FormManagement' AND sql LIKE '%isFromMenu%'")
//        
//        print(columnSearchResult)
//
//        if columnSearchResult.count < 1 {
//            sqlArr.append("alter table FormManagement add column isFromMenu VARCHAR")
//        }
//    }
//    func dbVersion2(sqlArr: inout [String]){
//        let columnSearchResult = YLWSqlHandler().excuteQueryByString("SELECT sql FROM sqlite_master WHERE name='FormManagement' AND sql LIKE '%InitializeDate%'")
//        
//        print(columnSearchResult)
//
//        if columnSearchResult.count < 1 {
//            sqlArr.append("alter table FormManagement add column InitializeDate VARCHAR")
//        }
//    }
//    func dbVersion3(sqlArr:inout [String]){
//
//        sqlArr.append("CREATE TABLE RecentlyUsedCodehelpMode (serverIP VARCHAR, dsn VARCHAR, userSeq VARCHAR, languageSeq VARCHAR, CompanySeq INTEGER, CodeHelpSeq INTEGER, ControlSeq INTEGER, pgmSeq VARCHAR, recentInputMode INTEGER)")
//
//        let columnSearchResult = YLWSqlHandler().excuteQueryByString("SELECT sql FROM sqlite_master WHERE name='RecentlyUsedCodehelp' AND sql LIKE '%pgmSeq%'")
//        
//        print(columnSearchResult)
//
//        if columnSearchResult.count < 1 {
//            sqlArr.append("alter table RecentlyUsedCodehelp add column pgmSeq VARCHAR")
//            sqlArr.append("alter table RecentlyUsedCodehelp add column favOrder INTEGER")
//            sqlArr.append("alter table RecentlyUsedCodehelp add column isFavourite INTEGER")
//        }
//
//    }
//    func dbVersion4(sqlArr:inout [String]){
//
//        let columnSearchResult = YLWSqlHandler().excuteQueryByString("SELECT sql FROM sqlite_master WHERE name='\(TableConstants.FormControlTable)' AND sql LIKE '%ApiSeq%'")
//        
//        print(columnSearchResult)
//
//        if columnSearchResult.count < 1 {
//            sqlArr.append("alter table \(TableConstants.FormControlTable) add column ApiSeq VARCHAR")
//        }
//    }
//    func dbVersion5(sqlArr:inout [String]){
//        sqlArr.append("drop table BeaconEventManagement")
//        //dsn = bis
//        
//        //conn info 빼도 됨.
//        //        sqlArr.append("CREATE TABLE \(TableConstants.BeaconEventManagement) (serverIP VARCHAR, dsn VARCHAR, languageSeq INTEGER, CompanySeq INTEGER, BeaconSeq INTEGER, BeaconValueSeq INTEGER, BeaconId VARCHAR, BeaconType INTEGER, EventSeq INTEGER, TypeSeq VARCHAR, PgmSeq INTEGER, ExecuteMethod VARCHAR, NotiMessage VARCHAR, UsingYn INTEGER, NotiYn INTEGER, EventValidityTime VARCHAR)")
//        sqlArr.append("CREATE TABLE \(TableConstants.BeaconEventManagement) (BeaconSeq INTEGER, BeaconValueSeq INTEGER, BeaconId VARCHAR, BeaconType INTEGER, EventSeq INTEGER, TypeSeq VARCHAR, PgmSeq INTEGER, ExecuteMethod VARCHAR, NotiMessage VARCHAR, UsingYn INTEGER, NotiYn INTEGER, EventValidityTime VARCHAR)")
//        
//    }
//
//    func dbVersion6(sqlArr: inout [String]){
//        let columnSearchResult = YLWSqlHandler().excuteQueryByString("SELECT sql FROM sqlite_master WHERE name='FormManagement' AND sql LIKE '%pgmFavName%'")
//
//        print(columnSearchResult)
//
//        if columnSearchResult.count < 1 {
//            sqlArr.append("alter table FormManagement add column pgmFavName VARCHAR")
//        }
//    }
//
//    //180620 hwon.kim
//    //앱코 - App의 총판주문입력(Web) 화면에서 확정 체크시 1133 확정 메시지 출력됩니다.
//    //Message 관련 데이터를 oper로 저장하여 값을 가져올 수 있도록 변경
//    //기존에는 bis와 함께 저장하여 다른 법인을 선택한 경우 값을 가져오지 못함 (법인 선택 전에 저장되기 때문)
//    func dbVersion7(sqlArr: inout [String]){
//        sqlArr.append("delete from Message")
//        sqlArr.append("delete from MessageControl")
//    }
//
//
//    func dbVersion8(sqlArr: inout [String]) {
//        sqlArr.append("CREATE TABLE CodehelpPercentMode (ServerIP VARCHAR, Dsn VARCHAR, UserSeq VARCHAR, CompanySeq INTEGER, CodeHelpSeq INTEGER, ControlSeq INTEGER, PgmSeq VARCHAR, Mode VARCHAR, PRIMARY KEY(ServerIP, Dsn, UserSeq, CompanySeq, CodeHelpSeq, ControlSeq, PgmSeq))")
//    }
    
    func dbVersion9(sqlArr: inout [String]){
       sqlArr.append("CREATE TABLE CMPTYRecentReceivers (CompanySeq INTEGER, dsn VARCHAR, UserSeq INTEGER, GroupEmpSeq VARCHAR, LanguageSeq INTEGER, Timestamp INTEGER, PRIMARY KEY(CompanySeq, dsn, UserSeq, GroupEmpSeq, LanguageSeq))")
        
        sqlArr.append("CREATE TABLE CMPTYUsers (CompanySeq INTEGER, dsn VARCHAR, UserSeq INTEGER, EmpSeq INTEGER, EmpName VARCHAR, LanguageSeq INTEGER, PRIMARY KEY(CompanySeq, dsn, UserSeq, EmpSeq, LanguageSeq))")
        
        sqlArr.append("CREATE TABLE CMPTYUserSyncTable (CompanySeq INTEGER, dsn VARCHAR, UserSeq INTEGER, LanguageSeq INTEGER, SyncDate VARCHAR, PRIMARY KEY(dsn, LanguageSeq, CompanySeq, UserSeq))")
    }

    func dbVersion10(sqlArr: inout [String]){
        sqlArr.append("alter table CMPTYUsers add column IsOn INTEGER")
        sqlArr.append("alter table CMPTYUsers add column DeptSeq INTEGER")
        sqlArr.append("alter table CMPTYUsers add column DeptName VARCHAR")
        sqlArr.append("alter table CMPTYUsers add column UserNameInitialSound VARCHAR")
        sqlArr.append("alter table CMPTYUsers add column DeptNameInitialSound VARCHAR")
        //2018.12.04 Sunil, since we are adding different columns , but there can be previous values without the values in above columns. So we delete values from CMPTYUserSyncTable, so that all new data is fetched again.
        sqlArr.append("DELETE FROM CMPTYUserSyncTable")
    }
    
    func dbVersion11(sqlArr: inout [String]){
        sqlArr.append("CREATE TABLE ServerSettingTable (ServerSettingId INTEGER  PRIMARY KEY  AUTOINCREMENT NOT NULL UNIQUE, bis VARCHAR, oper VARCHAR, conn VARCHAR)")
        sqlArr.append("CREATE TABLE CompanyInfoTable (CompanyInfoID INTEGER PRIMARY KEY  AUTOINCREMENT NOT NULL UNIQUE, CompanySeq INTEGER, CompanyName VARCHAR,ServerSettingId INTEGER,  FOREIGN KEY(ServerSettingId) REFERENCES ServerSettingTable(ServerSettingId))")
        sqlArr.append("CREATE TABLE UserInfoTable (CompanyInfoID INTEGER, UserSeq INTEGER , UserName VARCHAR, PRIMARY KEY(UserSeq, CompanyInfoID), FOREIGN KEY(CompanyInfoID) REFERENCES CompanyInfoTable(CompanyInfoID))")
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}









