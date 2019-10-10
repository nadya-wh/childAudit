public with sharing class DatabaseUtils
{
	public static Integer calculateRelationshipCount(Id recordId, Schema.SObjectType sObjectType, Schema.ChildRelationship childRelationship)
	{
		Integer result = 0;

		String queryString = 'SELECT Id, (SELECT Id FROM ' + childRelationship.getRelationshipName() + ') FROM ' + sObjectType.getDescribe().getName() +
				' WHERE Id ' + ' = \'' + recordId + '\'';
		List<SObject> sObjects = (List<SObject>)Database.query(queryString);

		List<SObject> relationships = (List<SObject>)sObjects.get(0).getSObjects(childRelationship.getRelationshipName());
		result = relationships != null ? relationships.size() : 0;
		return result;
	}
}