public with sharing class buyPageController {
    
    public List <Product_Table__c> product {get; set;} 
    public String paramValue {get;set;}
    
    String LastName, FirstName, Email;
    Integer UnitsAvailable;
    
    public buyPageController() {
        paramValue = ApexPages.currentPage().getParameters().get('Id');
        
        product = [
            SELECT id, Name, Unit_Price__c
            FROM Product_Table__c 
            WHERE Id = : paramValue
        ];       
    }  
    
    Public String getEmail() {
        return Email;
    }
    Public void setEmail(String value) {
        Email = value;
    }
    
    Public String getFirstName() {
        return FirstName;
    }
    Public void setFirstName(String value) {
        FirstName = value;
    }
    
    Public String getLastName() {
        return LastName;
    }
    Public void setLastName(String value) {
        LastName = value;
    }
    
    Public Integer getUnitsAvailable() {
        return UnitsAvailable;
    }
    Public void setUnitsAvailable(Integer value) {
        UnitsAvailable = value;
    }
    
    public PageReference redirectBack() { 
        PageReference actFuncPage = Page.Product_List;     
        actFuncPage.setRedirect(true);
        return actFuncPage;
    }  
    
    public string checkOut() {
        
        List <Contact> contacts = [
            SELECT Email, FirstName, LastName 
            FROM Contact 
            WHERE Email = : Email
        ];
        
        List <Product_Table__c> product = [
            SELECT Unit_Price__c 
            FROM Product_Table__c
            WHERE id = : paramValue
        ];
        
        if(contacts.size() == 0) {
            Contact contact_new = new Contact(FirstName = FirstName, LastName = LastName, Email = Email);
            try {
                insert contact_new;
            }
            catch (DmlException ex) {
                return null;
            } 
        }
        else {        		
            for (Integer i = 0; i < contacts.size(); i++) {			
                contacts[i].FirstName = FirstName;
                contacts[i].LastName = LastName;		
                try {
                    update contacts;
                }
                catch (DmlException ex) {
                    return null;
                } 			
            }    			
        }
   
        List <Contact> contactId = [
            SELECT id 
            FROM Contact 
            WHERE Email = : Email
        ];
        
        
        
        //decimal Order_Amount = (UnitsAvailable * product.Unit_Price__c);
        decimal Order_Amount = (UnitsAvailable * product[0].Unit_Price__c);
        
        //Order_Table__c  orderTables = new Order_Table__c (Contact__c = contactId.Id, Product__c = paramValue, Units__c = UnitsAvailable, Order_Amount__c = Order_Amount); 
        Order_Table__c  orderTables = new Order_Table__c (Contact__c = contactId[0].Id, Product__c = paramValue,
                                                          Units__c = UnitsAvailable, Order_Amount__c = Order_Amount); 
        insert orderTables;
        
        List <Product_Table__c> productUnits = [SELECT Units_Available__c FROM Product_Table__c WHERE id =:paramValue];
        //product.Units_Available__c = product.Units_Available__c - decimal.valueOf(UnitsAvailable);
        productUnits[0].Units_Available__c = productUnits[0].Units_Available__c - decimal.valueOf(UnitsAvailable);
        
        //if(product.Units_Available__c > 0) {
        if(productUnits[0].Units_Available__c > 0) {
            // insert orderTables;
            update productUnits;    
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Заказ принят'));             
        }
        else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Не достаточно товара'));
        } 
        return null;
    }
}

/*
global with sharing class buyPageController {

public Product_Table__c product {get; set;}  
public String paramValue {get;set;}

String LastName, FirstName, Email;
Integer UnitsAvailable;

public buyPageController() {
paramValue = ApexPages.currentPage().getParameters().get('Id');

product = [
SELECT id, Name, Unit_Price__c, Units_Available__c
FROM Product_Table__c 
WHERE Id = : paramValue
];       
}  

Public String getEmail() {return Email;}
Public void setEmail(String value) {Email = value;}

Public String getFirstName() {return FirstName;}
Public void setFirstName(String value) {FirstName = value;}

Public String getLastName() {return LastName;}
Public void setLastName(String value) {LastName = value;}

Public Integer getUnitsAvailable() {return UnitsAvailable;}
Public void setUnitsAvailable(Integer value) {UnitsAvailable = value ;}

public PageReference redirectBack() { 
PageReference actFuncPage = Page.Product_List;     
actFuncPage.setRedirect(true);

return actFuncPage;
}  
public PageReference checkOut() {
List <Contact> contacts = [SELECT id, Email FROM Contact WHERE Email = : Email];

if(contacts.size() == 0) {
Contact contact_new = new Contact(FirstName = FirstName, LastName = LastName, Email = Email);
try {
insert contact_new;
}
catch(DmlException ex) {
return null;
}   
}
else {        		
for (Integer i = 0; i < contacts.size(); i++) {			
contacts[i].FirstName = FirstName;
contacts[i].LastName = LastName;		
}	
try {
update contacts;
}
catch(DmlException ex) {
return null;
} 			
}

Contact contactId = [
SELECT id 
FROM Contact 
WHERE Email = : Email
];

decimal Order_Amount = (UnitsAvailable * product.Unit_Price__c);

Order_Table__c  orderTables = new Order_Table__c (Contact__c = contactId.Id, Product__c = paramValue, Units__c = UnitsAvailable, Order_Amount__c = Order_Amount); 

product.Units_Available__c = product.Units_Available__c - decimal.valueOf(UnitsAvailable);

if(product.Units_Available__c > 0) {  
insert orderTables;
update product;

ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Заказ принят'));
return null;
}
else{
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Не достаточно товара'));
return null;
}   
}
}
*/