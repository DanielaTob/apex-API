
global global ProductsController {
    @HttpPost
    @RestResource(urlMapping = '/products/*')
    global static Product__c createProduct(String name, String description, Decimal price, Integer Stock){
        Product__c product = new Product__c();

        product.Name__c = name;
        product.Description__c = description;
        product.Price__c = price;
        product.Stock__c = stock;

        insert product;
        return product;
    }
}