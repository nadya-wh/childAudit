public with sharing class DatabaseUtils
{
	public static Integer calculateRelationshipCount(Id recordId, Schema.SObjectType sObjectType, Schema.ChildRelationship childRelationship)
	{
		Integer result = 0;

		String queryString = 'SELECT Id, (SELECT Id FROM ' + childRelationship.getRelationshipName() + ') FROM ' + sObjectType.getDescribe().getName() +
				' WHERE Id ' + ' = \'' + recordId + '\'';
		result = Database.query(queryString).size();

		return result;
	}
}