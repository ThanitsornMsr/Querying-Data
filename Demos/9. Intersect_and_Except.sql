SELECT ProductID 
FROM Production.Product  
INTERSECT  
SELECT ProductID
FROM Production.WorkOrder 
order by ProductID;  

SELECT ProductID   
FROM Production.Product  
Except  
SELECT ProductID   
FROM Production.WorkOrder
order by ProductID;  

SELECT ProductID   
FROM Production.WorkOrder  
EXCEPT  
SELECT ProductID   
FROM Production.Product ;  