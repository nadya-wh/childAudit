public class ChildRelationshipWrapper
{
	@AuraEnabled
	public String relationshipName {get; set;}
	@AuraEnabled
	public Integer count {get; set;}

	public ChildRelationshipWrapper(String relationshipName, Integer count)
	{
		this.relationshipName = relationshipName;
		this.count = count;
	}
}