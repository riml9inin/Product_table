@isTest
private class buyPageController_Test { 
    @isTest static void buyPageController_Test1(){
        /*
Product_Table__c product = new Product_Table__c (Name = 'nokia', Unit_Price__c = 220, Units_Available__c = 347);
insert product;    

Product_Table__c products = [
SELECT  id  
FROM Product_Table__c
WHERE Units_Available__c = : product.Units_Available__c
];

buyPageController test = new buyPageController();

test.paramValue = product.id;

*/
        buyPageController controller = new buyPageController();        
    }  
    
    @isTest static void setEmailTest() {
        buyPageController test = new buyPageController();
        test.setEmail('roman@tyt.by');
        string set_test = test.getEmail();
        System.assertEquals('roman@tyt.by', set_test);
    }
    
    @isTest static void setFirstNameTest() {
        buyPageController test = new buyPageController();
        test.setFirstName('Roman');
        string set_test = test.getFirstName();
        System.assertEquals('Roman', set_test);
    }
    
    @isTest static void setLastNameTest() {
        buyPageController test = new buyPageController();
        test.setLastName('But-Husaim');
        string set_test = test.getLastName();
        System.assertEquals('But-Husaim', set_test);
    }
    
    @isTest static void setUnitsAvailableTest() {
        buyPageController test = new buyPageController();
        test.setUnitsAvailable(2);
        integer set_test = test.getUnitsAvailable();
        System.assertEquals(2, set_test);
    }
    
    @isTest static void redirectBack_Test() {
        buyPageController test = new buyPageController();
        test.redirectBack();
    }
    
    @isTest static void checkOutTest1() {
        Product_Table__c newCont = new Product_Table__c(name = 'roma', Unit_Price__c = 3300, Units_Available__c = 100);
        insert newCont;    
        
        List <Product_Table__c> product= [SELECT  id  
                                          FROM Product_Table__c
                                          WHERE name =:newCont.name];
        
        buyPageController test = new buyPageController();
        
        test.paramValue = product[0].id;
        
        Contact newContact = new Contact(LastName = 'Anton',Email ='roman@tyt.by');
        insert newContact;
        
        test.setEmail('roman@tyt.by');
        test.setFirstName('Roman');
        test.setLastName('But-Husaim');
        test.setUnitsAvailable(2); 
        test.checkOut();
    }
    @isTest static void checkOutTest1_1() {
        Product_Table__c newCont = new Product_Table__c(name = 'roma', Unit_Price__c = 3300, Units_Available__c = 100);
        insert newCont;    
        
        List <Product_Table__c> product= [SELECT  id  
                                          FROM Product_Table__c
                                          WHERE name =:newCont.name];
        
        buyPageController test = new buyPageController();
        
        test.paramValue = product[0].id;
        
        Contact newContact = new Contact(LastName = 'Anton',Email ='roman@tyt.by');
        insert newContact;
        
        test.setEmail('roman@tyt.by');
        test.setFirstName('');
        test.setLastName('');
        test.setUnitsAvailable(2); 
        test.checkOut();
    }
    @isTest static void checkOutTest2() {
        Product_Table__c newCont = new Product_Table__c(name = 'roma', Unit_Price__c = 3300, Units_Available__c = 100);
        insert newCont;    
        
        List <Product_Table__c> product= [SELECT  id  
                                          FROM Product_Table__c
                                          WHERE name =:newCont.name];
        
        buyPageController test = new buyPageController();
        
        test.paramValue = product[0].id;
        
        Contact newContact = new Contact(LastName = 'Anton',Email ='Anton@tyt.by');
        insert newContact;
        
        test.setEmail('roman@tyt.by');
        test.setFirstName('Roman');
        test.setLastName('But-Husaim');
        test.setUnitsAvailable(3301); 
        test.checkOut();
    } 
    @isTest static void checkOutTest2_1() {
        Product_Table__c newCont = new Product_Table__c(name = 'roma', Unit_Price__c = 3300, Units_Available__c = 100);
        insert newCont;    
        
        List <Product_Table__c> product= [SELECT  id  
                                          FROM Product_Table__c
                                          WHERE name =:newCont.name];
        
        buyPageController test = new buyPageController();
        
        test.paramValue = product[0].id;
        
        Contact newContact = new Contact(LastName = 'Anton',Email ='Anton@tyt.by');
        insert newContact;
        
        test.setEmail('');
        test.setFirstName('');
        test.setLastName('');
        test.setUnitsAvailable(3301); 
        test.checkOut();
    }
}
    /*
    
    @isTest static void checkOutTest2() {
        
        buyPageController test = new buyPageController();
        
        test.setEmail('roman@tyt.by');
        test.setFirstName('Roman');
        test.setLastName('But-Husaim');
        test.checkOut();
    }
    @isTest static void checkOutTest3() {
        Contact contact = new Contact(FirstName = 'Roman', LastName = 'But-Husaim', Email = 'roman@tyt.by');
        insert contact; 
        
        buyPageController test = new buyPageController();
        
        test.setEmail('roman@tyt.by');
        test.setFirstName('');
        test.setLastName('');
        test.checkOut();
    } 
    
    @isTest static void checkOutTest() {
        buyPageController test = new buyPageController();
        
        Contact contact = new Contact (FirstName = 'RomanS', LastName = 'But-HusaimS', Email = 'romanS@tyt.by');
        insert contact; 
        
        Product_Table__c product = new Product_Table__c (Name = 'nokia', Unit_Price__c = 220, Units_Available__c = 347);
        insert product;
        
        test.setEmail('roman@tyt.by');
        test.setFirstName('Roman');
        test.setLastName('But-Husaim');
        test.setUnitsAvailable(2);        
        test.checkOut();
        
        List <Contact> contactId = [SELECT id FROM Contact WHERE Email = : contact.Email];
        
        list <Product_Table__c> products = [SELECT Id, Name, Unit_Price__c, Units_Available__c FROM Product_Table__c WHERE Name = : product.Name];
        
        test.paramValue = products[0].id;
    }
    
}

/*
@isTest
private class buyPageController_Test { 
@isTest static void buyPageController_Test1(){

Product_Table__c product = new Product_Table__c (Name = 'nokia', Unit_Price__c = 220, Units_Available__c = 347);
insert product;    

Product_Table__c products = [
SELECT  id  
FROM Product_Table__c
WHERE Units_Available__c = : product.Units_Available__c
];

buyPageController test = new buyPageController();

test.paramValue = product.id;


buyPageController controller = new buyPageController();        
}  

@isTest static void setEmailTest() {
buyPageController test = new buyPageController();
test.setEmail('roman@tyt.by');
string set_test = test.getEmail();
System.assertEquals('roman@tyt.by', set_test);
}

@isTest static void setFirstNameTest() {
buyPageController test = new buyPageController();
test.setFirstName('Roman');
string set_test = test.getFirstName();
System.assertEquals('Roman', set_test);
}

@isTest static void setLastNameTest() {
buyPageController test = new buyPageController();
test.setLastName('But-Husaim');
string set_test = test.getLastName();
System.assertEquals('But-Husaim', set_test);
}

@isTest static void setUnitsAvailableTest() {
buyPageController test = new buyPageController();
test.setUnitsAvailable(2);
integer set_test = test.getUnitsAvailable();
System.assertEquals(2, set_test);
}

@isTest static void redirectBack_Test() {
buyPageController test = new buyPageController();
test.redirectBack();
}

@isTest static void checkOutTest1() {
Contact contact = new Contact(FirstName = 'Roman', LastName = 'But-Husaim', Email = 'roman@tyt.by');
insert contact; 

buyPageController test = new buyPageController();

test.setEmail('');
test.setFirstName('');
test.setLastName('');
test.checkOut();
}   
@isTest static void checkOutTest2() {

buyPageController test = new buyPageController();

test.setEmail('roman@tyt.by');
test.setFirstName('Roman');
test.setLastName('But-Husaim');
test.checkOut();
}
@isTest static void checkOutTest3() {
Contact contact = new Contact(FirstName = 'Roman', LastName = 'But-Husaim', Email = 'roman@tyt.by');
insert contact; 

buyPageController test = new buyPageController();

test.setEmail('roman@tyt.by');
test.setFirstName('');
test.setLastName('');
test.checkOut();
} 

@isTest static void checkOutTest() {
buyPageController test = new buyPageController();

Contact contact = new Contact (FirstName = 'RomanS', LastName = 'But-HusaimS', Email = 'romanS@tyt.by');
insert contact; 

Product_Table__c product = new Product_Table__c (Name = 'nokia', Unit_Price__c = 220, Units_Available__c = 347);
insert product;

test.setEmail('roman@tyt.by');
test.setFirstName('Roman');
test.setLastName('But-Husaim');
test.setUnitsAvailable(2);        
test.checkOut();

List <Contact> contactId = [SELECT id FROM Contact WHERE Email = : contact.Email];

list <Product_Table__c> products = [SELECT Id, Name, Unit_Price__c, Units_Available__c FROM Product_Table__c WHERE Name = : product.Name];

test.paramValue = products[0].id;
}
}
*/