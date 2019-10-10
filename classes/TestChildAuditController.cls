@isTest
private class TestChildAuditController
{
	@isTest
	static void testCalculateRelationshipCount()
	{
		Account a = new Account(Name = 'Test Account');
		insert a;

		Opportunity opp = new Opportunity(Name = 'Test Opportunity', StageName = 'Closed Won', CloseDate = Date.today(), AccountId = a.Id);
		insert opp;

		List<ChildRelationshipWrapper> wrappers = ChildAuditController.getChildRelations(a.Id);

		for (ChildRelationshipWrapper wrapper : wrappers)
		{
			if ('Opportunities'.equals(wrapper.relationshipName))
			{
				System.assertEquals(1, wrapper.count, 'We expect to receive 1');
			}
		}
	}
}