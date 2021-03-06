let path = "/Users/holt/GitHub/MLP/MLP/data/"

func parseBias(_ file: String) -> [Double] {

    var bias: [Double] = []

    do {
        let content = try String(contentsOfFile: path + file)
        let parsedCSV = content.components(separatedBy: "\r\n")
        for item in parsedCSV {
            if let item = Double(item) {
                bias.append(item)
            }
        }
    } catch {}

    return bias

}

func parseWeight(_ file: String) -> [[Double]] {
    return parse(file: file, separator: ",")
}

func parseGaussian(_ file: String) -> [[Double]] {
    return parse(file: file, separator: " ")
}

private func parse(file: String, separator: String) -> [[Double]] {

    var weights: [[Double]] = []
    
    do {
        
        let content = try String(contentsOfFile: path + file)
        let rows = content.components(separatedBy: "\r\n")
        
        for row in rows {
            
            let columns = row.components(separatedBy: separator)
            
            var values: [Double] = []
            
            for column in columns {
                if let column = Double(column) {
                    values.append(column)
                }
            }
            
            if !values.isEmpty {
                weights.append(values)
            }
            
        }
        
    } catch {}
    
    return weights

}
