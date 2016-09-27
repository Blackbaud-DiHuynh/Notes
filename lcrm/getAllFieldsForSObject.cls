//for the Account object, you can replact that with any object you have, standard or custom
Schema.DescribeSObjectResult a_desc = Opportunity.sObjectType.getDescribe(); 
Map<String, Schema.SObjectField> a_fields = a_desc.fields.getMap();

for(Schema.sObjectField fld:a_fields.values()){ 
     System.debug(fld);
}
