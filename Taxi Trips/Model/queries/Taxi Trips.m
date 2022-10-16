let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    data = Source{[Schema="dbo",Item=#"[SQL View]"]}[Data],
    #"Filtered Rows" = Table.SelectRows(data, each [Date] >= RangeStart and [Date] < RangeEnd),
    #"Select Columns" = Table.SelectColumns(#"Filtered Rows",{"vendorID", "passengerCount", "tripDistance", "rateCodeId", "paymentType", "fareAmount", "extra", "mtaTax", "improvementSurcharge", "tipAmount", "tollsAmount", "totalAmount", "Date"}),
    #"Renamed Columns" = Table.RenameColumns(#"Select Columns",{{"vendorID", "Vendor ID"}, {"passengerCount", "Passenger Count"}, {"tripDistance", "Trip Distance"}, {"rateCodeId", "Rate Code ID"}, {"paymentType", "Payment Type"}, {"fareAmount", "Fare Amount"}, {"extra", "Extra"}, {"mtaTax", "MTA Tax"}, {"improvementSurcharge", "Improvement Surcharge"}, {"tipAmount", "Tip Amount"}, {"tollsAmount", "Tolls Amount"}, {"totalAmount", "Total Amount"}})
in
    #"Renamed Columns"