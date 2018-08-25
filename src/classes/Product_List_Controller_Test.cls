@isTest
private class Product_List_Controller_Test { 
    @isTest static void Product_List_Controller_Test1(){
        Product_List_Controller controller = new Product_List_Controller();        
    }  
    @isTest static void buy_Test(){
        Product_List_Controller test = new Product_List_Controller();
        test.buy();
    }
    @isTest static void redirectBack_Test(){
        Product_List_Controller test = new Product_List_Controller();
        test.redirectBack();
    }
}