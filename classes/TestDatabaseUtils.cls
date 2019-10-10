@isTest
private class TestDatabaseUtils
{
	@isTest
	static void testCalculateRelationshipCount()
	{
		Account a = new Account(Name = 'Test Account');
		insert a;

		Opportunity opp1 = new Opportunity(Name = 'Test Opportunity1', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = a.Id);
		Opportunity opp2 = new Opportunity(Name = 'Test Opportunity2', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = a.Id);

		insert new List<Opportunity> {opp1, opp2};

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
		System.assertEquals(2, count, 'We expect to receive 2');
	}

}