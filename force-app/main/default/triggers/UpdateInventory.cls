trigger UpdateInventory on Product__c (after insert, after update){
    List<Product__c> products = new List<Product__c>();

    for (Product__c product : Trigger.new) {
        Integer availableStock = product.availableStock__c;

        List<Order__c> orders = [SELECT Id, Quantity__c, Product__c FROM Order__c WHERE Product__c = :product.Id];

        for (Order__c line : orderlines) {
            //recuperamos la cantidad de pedidos y le restamos la cantidad de ordenes que se han pedido.
            availableStock -= line.Quantity__c;
        }

        product.availableStock__c = availableStock;
        products.add(product);
    }

    update products;
}