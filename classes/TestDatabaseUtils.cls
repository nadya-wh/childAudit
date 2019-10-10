@isTest
private class TestDatabaseUtils
{
	@isTest
	static void testCalculateRelationshipCount()
	{
		Account a = new Account(Name = 'Test Account');
		insert a;

		Opportunity opp = new Opportunity(Name = 'Test Opportunity', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = a.Id);
		insert opp;

		ChildRelationship relationship;
		for (ChildRelationship relation : SObjectType.Account.getChildRelationships())
		{
			if ('Opportunities'.equals(relation.getRelationshipName()))
			{
				relationship = relation;
				break;
			}
		}

		Integer count = DatabaseUtils.calculateRelationshipCount(a.Id, Account.SObjectType, relationship);
		System.assertEquals(1, count, 'We expect to receive 1');
	}

}