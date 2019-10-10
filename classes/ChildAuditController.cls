public with sharing class ChildAuditController
{
	@AuraEnabled
	public static List<ChildRelationshipWrapper> getChildRelations(Id recordId) {
		Schema.SObjectType token = recordId.getSObjectType();

		List<ChildRelationshipWrapper> relationships = new List<ChildRelationshipWrapper>();

		Schema.DescribeSObjectResult describeSObjectResult = token.getDescribe();
		for (Schema.ChildRelationship childRelationship: describeSObjectResult.getChildRelationships())
		{
			if (childRelationship.getChildSObject().getDescribe().isQueryable() && String.isNotEmpty(childRelationship.getRelationshipName()))
			{
				System.debug(childRelationship.getField());
				relationships.add(new ChildRelationshipWrapper(childRelationship.getChildSObject().getDescribe().getLabel(),
						DatabaseUtils.calculateRelationshipCount(recordId, token, childRelationship)));
			}
		}

		return relationships;
	}
}