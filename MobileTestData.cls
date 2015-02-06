// Script to generate donations to test the Find Nearby Donors page.
// Assuming a lot of contacts exist in the system.

Campaign camp = getCampaign();
Contact[] contactsInZip = [SELECT Id, MailingPostalCode, AccountId FROM Contact WHERE MailingPostalCode LIKE '100%' LIMIT 30];
Contact[] contactsOutsideZip = [SELECT Id, MailingPostalCode, AccountId FROM Contact WHERE MailingPostalCode LIKE '20%' LIMIT 10];
List<Decimal> amounts = new List<Decimal>{10000.00,25000.00,50000.00,100000.00,500000.00};

System.debug('10 donations per giving levels');
printDonationList(getDonationsForContacts(contactsInZip,11, amounts));

System.debug('10 donations outside of zip');
printDonationList(getDonationsForContacts(contactsOutsideZip, 10, new List<Decimal>{101001.2}));

//NOTE: RUN THESE TWO COMMANDS SEPARATELY! 1000 lines of debug statements is about 1.74 MB 
// which is really close to SF debug log limit (2MB)
System.debug('1k donations for contact ' + contactsInZip[0].Name);
printDonationList(getDonationsForContacts(new List<Contact>{contactsInZip[0]}, 1000, new List<Decimal>{122}));

// helpers
// returns a random integer strictly less than upperBound
public static Integer getRandomInt(Integer upperBound){
	return Math.mod(Integer.valueOf(Math.roundToLong(Math.random()*upperBound)),upperBound);
}

public static void printDonationList(List<Opportunity> opps){
	String csv = 'Contact__c,Amount,CampaignId,CloseDate,RecordTypeId,Name,AccountId,StageName,Type' + '\n';

	for (Opportunity opp : opps){
		csv += opp.cv__Contact__c + ',' +
				opp.Amount + ',' +
				opp.CampaignId + ',' +
				opp.CloseDate + ',' +
				opp.RecordTypeId + ',' +
				opp.Name + ',' +
				opp.AccountId + ',' +
				opp.StageName + ',' +
				opp.Type +'~';
	}
	System.debug(csv);
}

public static Opportunity createDonation(Id contactId, Decimal amount, Id campaignId, Id accountId){
	Opportunity donation = new Opportunity(
		cv__Contact__c = contactId,
		Amount = amount,
		CampaignId = campaignId,
		CloseDate = Date.today(),
		RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Single Donation').getRecordTypeId(),
		Name = '1',
		AccountId = accountId, 
		StageName = 'Received',
		Type = 'Individual Gift'
	);
	return donation;
}

public static Campaign getCampaign(){
	Campaign campTemp = new Campaign(
		Name='Default Campaign',
		IsActive = true);
		insert campTemp;
	Campaign camp = [SELECT Id, Name FROM Campaign WHERE Name='Default Campaign'][0];
	return camp;
}

public static List<Opportunity> getDonationsForContacts(Contact[] contacts, Integer numDonations, List<Decimal> amounts){
	List<Opportunity> donations = new List<Opportunity>();
	for (Decimal amount : amounts){
		for (Integer donationCount = 0; donationCount < numDonations; donationCount++){
			Contact randomContact = contacts[getRandomInt(contacts.size())];
			donations.add(createDonation(randomContact.Id, amount, camp.Id, randomContact.AccountId));
		}
	}
	return donations;
}