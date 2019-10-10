/**
 * Created by napo on 10/10/19.
 */
({
    loadRelations: function(component, recordId) {
		var action = component.get("c.getChildRelations");
		action.setParams({
			"recordId": recordId
		});
		console.log(recordId);

		component.find('refreshButton').set('v.disabled', true);

		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === "SUCCESS") {
			    console.log('success');
				component.set("v.relations", response.getReturnValue());
			}
			else
			{
				console.log('fail');
  			}
  			component.find('refreshButton').set('v.disabled', false);
		});


		$A.enqueueAction(action);
    }
})