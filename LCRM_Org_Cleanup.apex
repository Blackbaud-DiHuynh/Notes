List<TeamRaiser_Registration__c> regs = [select Id from TeamRaiser_Registration__c];
delete regs;

List<TeamRaiser_Team__c> teams = [select Id from TeamRaiser_Team__c];
delete teams;

List<Opportunity> opps = [select Id from Opportunity];
delete opps;

List<Recurring_Gift__c> recgifts = [select Id, Convio_ID__c from Recurring_Gift__c];
for (Recurring_Gift__c recgift : recgifts) {
	recgift.Convio_ID__c = null;
}
update recgifts;
delete recgifts;

List<Pledge__c> pledges = [select Id from Pledge__c];
delete pledges;

List<Campaign> campaigns = [select Id from Campaign];
delete campaigns;

List<Case> cases = [select Id from Case];
delete cases;

List<Contact> contacts = [select Id, Convio_ID__c, External_Revision_ID__c, External_Revision_ID_Activity__c, External_Revision_ID_Address__c, External_Revision_ID_Biographical__c, External_Revision_ID_Email__c, External_Revision_ID_Employer__c, External_Revision_ID_Membership__c, External_Revision_ID_Other__c, External_Revision_ID_Phone__c from Contact];

for (Contact con : contacts) {
	con.Convio_ID__c = null;
	con.External_Revision_ID__c = null;
	con.External_Revision_ID_Activity__c = null;
	con.External_Revision_ID_Address__c = null;
	con.External_Revision_ID_Biographical__c = null;
	con.External_Revision_ID_Email__c = null;
	con.External_Revision_ID_Employer__c = null;
	con.External_Revision_ID_Membership__c = null;
	con.External_Revision_ID_Other__c = null;
	con.External_Revision_ID_Phone__c = null;
}

update contacts;
