/**
 * @description: Apex controller for custom catalog container component
 * @author: By Jayyum with Claude Sonnet
 */
public with sharing class CustomCatalogContainerController {
    @AuraEnabled(cacheable=true)
    public static List<CustomProduct__c> getProducts(String productType) {
        String query = 'SELECT Id, Name, imageUrl__c, shortdesc__c, producttype__c ' +
                       'FROM CustomProduct__c ';
        
        if (String.isNotBlank(productType) && productType != 'All') {
            query += 'WHERE producttype__c = :productType ';
        }
        
        query += 'ORDER BY CreatedDate DESC LIMIT 6';
        return Database.query(query);
    }

    @AuraEnabled(cacheable=true)
    public static List<String> getProductTypes() {
        List<String> picklistValues = new List<String>();
        picklistValues.add('All');
        
        Schema.DescribeFieldResult fieldResult = CustomProduct__c.producttype__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry f : ple) {
            picklistValues.add(f.getLabel());
        }
        return picklistValues;
    }
}