/**
 * Created by napo on 10/10/19.
 */
({
	doInit: function(component, event, helper) {
	    var recordId = component.get("v.recordId");
		helper.loadRelations(component, recordId);
	},

	refresh: function(component, event, helper) {
		var recordId = component.get("v.recordId");
		helper.loadRelations(component, recordId);
	}
})