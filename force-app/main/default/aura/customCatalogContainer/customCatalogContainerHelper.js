/**
 * @description: Helper for custom catalog container component
 * @author: By Jayyum with Claude Sonnet
 */
({  
    getProducts : function(component, productType) {
        var action = component.get("c.getProducts");
        action.setParams({ productType : productType });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var dynamicProducts = response.getReturnValue();
                var staticProducts = component.get("v.staticProducts") || [];
                var allProducts = dynamicProducts.concat(staticProducts);
                component.set("v.products", allProducts);
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    
    setStaticItems : function(component) {
        var staticProducts = [];
        for (var i = 1; i <= 6; i++) {
            var name = component.get("v.item" + i + "Name");
            var desc = component.get("v.item" + i + "Desc");
            var image = component.get("v.item" + i + "Image");
            var url = component.get("v.item" + i + "Url");
            
            if (name || desc || image || url) {
                staticProducts.push({
                    Name: name,
                    shortdesc__c: desc,
                    imageUrl__c: image,
                    Id: url
                });
            }
        }
        component.set("v.staticProducts", staticProducts);
        
        var dynamicProducts = component.get("v.products") || [];
        var allProducts = dynamicProducts.concat(staticProducts);
        component.set("v.products", allProducts);
    }
})