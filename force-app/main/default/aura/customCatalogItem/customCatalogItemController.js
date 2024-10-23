/**
 * @description: Controller for custom catalog item component
 * @author: By Jayyum with Claude Sonnet
 */
({
    navigateToRecord : function(component, event, helper) {
        var productId = component.get("v.product").Id;
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": productId,
            "slideDevName": "detail"
        });
        navEvt.fire();
    }
})