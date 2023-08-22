declare @strBD nvarchar(50);
set @strBD = N'ExamenMAQP';
select [Table Name] = OBJECT_NAME(STATSIDX.object_id, database_id)
    ,[Index ID] = STATSIDX.index_id
    ,[Index Name] = SYSIDX.name
    ,Index_Type = index_type_desc
    ,Percent_Frag = ROUND(avg_fragmentation_in_percent,2)
    ,Action = case
        when (avg_fragmentation_in_percent < 30.0 and avg_fragmentation_in_percent >= 10.0)
            then 'ALTER INDEX REORGANIZE'
        when avg_fragmentation_in_percent >= 30.0
            then 'ALTER INDEX REBUILD'
        else 'NOTHING'
     end
    ,avg_page_space_used_in_percent
    ,Date_Collected=CAST(GETDATE() AS DATE)
    ,Time_Collected=CAST(GETDATE() AS TIME)
    ,Partition_Number = partition_number
    ,page_count
  ,record_count
from sys.dm_db_index_physical_stats(DB_ID(@strBD), null, null, null, 'SAMPLED') AS STATSIDX
left outer join sys.indexes AS SYSIDX on STATSIDX.index_id = SYSIDX.index_id AND STATSIDX.object_id = SYSIDX.object_id
where alloc_unit_type_desc = 'IN_ROW_DATA' -- AND page_count >= 1000
order by avg_fragmentation_in_percent DESC;

ALTER INDEX OrderID ON [dbo].[Order Details] REBUILD
ALTER INDEX OrdersOrder_Details ON [dbo].[Order Details] REBUILD
ALTER INDEX ProductID ON [dbo].[Order Details] REBUILD
ALTER INDEX PK_Customers ON [dbo].[Customers] REBUILD
ALTER INDEX ProductsOrder_Details ON [dbo].[Order Details] REBUILD
ALTER INDEX PK_Order_Details ON [dbo].[Order Details] REBUILD
ALTER INDEX ShipPostalCode ON [dbo].[Orders] REBUILD
ALTER INDEX CustomerID ON [dbo].[Orders] REBUILD
ALTER INDEX CustomersOrders ON [dbo].[Orders] REBUILD
ALTER INDEX EmployeeID ON [dbo].[Orders] REBUILD
ALTER INDEX EmployeesOrders ON [dbo].[Orders] REBUILD
ALTER INDEX OrderDate ON [dbo].[Orders] REBUILD
ALTER INDEX ShippedDate ON [dbo].[Orders] REBUILD
ALTER INDEX ShippersOrders ON [dbo].[Orders] REBUILD
ALTER INDEX PK_Orders ON [dbo].[Orders] REORGANIZE



