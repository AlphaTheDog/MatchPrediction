use Inventory;
describe Products;
insert into CustomerOrderLineItems
values(1002,100,'kavagara',300,20),
(1003,100,"menengai soap",230,90),
(1004,104,"pishori",300,100),
(1002,104,"pishori",300,22),
(1002,102,"sugar",220,110),
(1001,103,"ginger",10,1000);
delimiter //
create trigger TotalCost
after insert
on CustomerOrderLineItems
for each row
update CustomerOrder
set CustomerOrder.CustomerOrderCost=CustomerOrder.CustomerOrderCost+new.CustomerOrderLineItemPrice*CustomerOrderLineItemquantity
where CustomerOrder.CustomerOrderID=new.CustomerOrderID;
delimiter;

show triggers;
insert into CustomerOrderLineItems
values(1002,102,'sugar',220,250);
select * from CustomerOrderLineItems;
 create trigger TotalCost
    -> after insert
    -> on CustomerOrderLineItems
    -> for each row
    -> update CustomerOrder
    -> set CustomerOrder.CustomerOrderCost=CustomerOrder.CustomerOrderCost+new.CustomerOrderLineItemPrice*CustomerOrderLineItemquantity
    -> where CustomerOrder.CustomerOrderID=new.CustomerOrderID//
select * from CustomerOrder;
use Inventory;
select co.CustomerOrderID,co.CustomerOrderCost,co.CustomerID,li.CustomerOrderID,li.ProductID,
li.CustomerOrderLineItemName,li.CustomerOrderLineItemPrice,li.CustomerOrderLineItemquantity
from CustomerOrder co
join CustomerOrderLineItems li
on  co.CustomerOrderID=li.CustomerOrderID;


update CustomerOrder 
join CustomerOrderLineItems li
on  CustomerOrder.CustomerOrderID=li.CustomerOrderID
set  CustomerOrder.CustomerOrderCost=li.CustomerOrderLineItemPrice*li.CustomerOrderLineItemquantity
where CustomerOrder.CustomerOrderID=li.CustomerOrderID;

select * from CustomerOrderLineItems;


create trigger TotalCost
after insert
on CustomerOrderLineItems
for each row
update CustomerOrder 
join CustomerOrderLineItems li
on  CustomerOrder.CustomerOrderID=li.CustomerOrderID
set  CustomerOrder.CustomerOrderCost=CustomerOrder.CustomerOrderCost+li.CustomerOrderLineItemPrice*li.CustomerOrderLineItemquantity
where CustomerOrder.CustomerOrderID=li.CustomerOrderID;

delimiter //
create trigger C2
before insert
on CustomerOrderLineItems 
for each row
begin
update CustomerOrder
set  CustomerOrder.CustomerOrderCost=CustomerOrder.CustomerOrderCost+
new.CustomerOrderLineItemPrice*new.CustomerOrderLineItemquantity
where CustomerOrder.CustomerOrderID=new.CustomerOrderID;
end//
delimiter ;