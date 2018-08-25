Public with sharing class Product_List_Controller {	 
    
    public List <Product_Table__c> product_tbl {get; set;} 
    public List <Product_Table__c> product_info {get; set;}
    
    public string paramValue {get;set;}
    
    public Product_List_Controller() {
        paramValue = ApexPages.currentPage().getParameters().get('Id'); 
        product_tbl = [
            SELECT id, Name, Title__c, Image_Url__c, Product_Description__c, Unit_Price__c
            FROM Product_Table__c 
        ];     
        product_info = [
            SELECT id, Name, Title__c, Image_Url__c, Product_Description__c, Unit_Price__c, Units_Available__c
            FROM Product_Table__c 
            WHERE Id = : paramValue
        ];
    }
   
    public PageReference buy() {    
        PageReference page = Page.buyPage;     
        page.getParameters().put('Id', paramValue);
        page.setRedirect(true);
	
        return page;
    }
    	
    public PageReference redirectBack() {     
        PageReference actFuncPage = Page.Product_List;     
        actFuncPage.setRedirect(true);
        
        return actFuncPage;
    }
}