/**
 * @description: Controller for custom catalog container component
 * @author: By Jayyum with Claude Sonnet
 */
({
    doInit : function(component, event, helper) {
        var selectedProductType = component.get("v.selectedProductType");
        helper.getProducts(component, selectedProductType);
        helper.setStaticItems(component);
    },
    
    handleProductTypeChange: function(component, event, helper) {
        var selectedProductType = component.get("v.selectedProductType");
        helper.getProducts(component, selectedProductType);
    },
    
    navigateToRecord : function(component, event, helper) {
        var productId = event.getSource().get("v.name");
        if (productId.startsWith("http")) {
            var navEvt = $A.get("e.force:navigateToURL");
            navEvt.setParams({
                "url": productId
            });
            navEvt.fire();
        } else {
            var navEvt = $A.get("e.force:navigateToSObject");
            navEvt.setParams({
                "recordId": productId,
                "slideDevName": "detail"
            });
            navEvt.fire();
        }
    }
})