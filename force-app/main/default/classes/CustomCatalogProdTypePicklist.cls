/**
 * @description: Product type picklist for custom catalog
 * @author: By Jayyum with Claude Sonnet
 */
global class CustomCatalogProdTypePicklist extends VisualEditor.DynamicPickList {
    global override VisualEditor.DataRow getDefaultValue() {
        return new VisualEditor.DataRow('All', 'All');
    }
    
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows picklistValues = new VisualEditor.DynamicPickListRows();
        picklistValues.addRow(new VisualEditor.DataRow('All', 'All'));
        
        Schema.DescribeFieldResult fieldResult = CustomProduct__c.producttype__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry f : ple) {
            picklistValues.addRow(new VisualEditor.DataRow(f.getLabel(), f.getValue()));
        }
        return picklistValues;
    }
}