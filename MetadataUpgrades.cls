MetadataService.MetadataPort service = MetadataUtils.createService();


List<String> layoutNames = new List<String>{
	MetadataUtils.addNamespace('Contact-Household Contact Layout'),
	MetadataUtils.addNamespace('Contact-Organization Contact Layout'),
	MetadataUtils.addNamespace('Account-Organization Account Layout')};

List<MetadataService.Layout> requestedLayouts = (List<MetadataService.Layout>)
service.readMetadata('Layout', layoutNames).getRecords();

MetadataService.QuickAction addRelationshipForContact = MobileUpgrades.getAddRelationshipAction('Contact.Add_Relationship_From_Contact', 'MobileAddRelationshipFromContact');

MetadataService.QuickAction addRelationshipForAccount = MobileUpgrades.getAddRelationshipAction('Account.Add_Relationship_From_Account', 'MobileAddRelationshipFromAccount');

service.upsertMetadata(new List<MetadataService.QuickAction> {addRelationshipForAccount, addRelationshipForContact});
//List<MetadataService.QuickAction> requestedActions = (List<MetadataService.QuickAction>)
//service.readMetadata('QuickAction',new List<String>{'Account.Add_Relationship_From_Account'}).getRecords();

//System.debug(requestedActions[0]);

//<quickActionList>
//       <quickActionListItems>
//           <quickActionName>FeedItem.MobileSmartActions</quickActionName>
//       </quickActionListItems>
//       <quickActionListItems>
//           <quickActionName>Contact.Add_Relationship_From_Contact</quickActionName>
//       </quickActionListItems>
//   </quickActionList>

MetadataService.Layout hhLayout = requestedLayouts[1];
MetadataService.QuickActionList qaList = new MetadataService.QuickActionList();
MetadataService.QuickActionListItem mobileSmartActions = new MetadataService.QuickActionListItem();
	mobileSmartActions.quickActionName = 'FeedItem.MobileSmartActions';
MetadataService.QuickActionListItem addContactButton = new MetadataService.QuickActionListItem();
	addContactButton.quickActionName = 'Contact.Add_Relationship_From_Contact';

qaList.quickActionListItems = new List<MetadataService.QuickActionListItem> {mobileSmartActions, addContactButton};
hhLayout.quickActionList = qaList;
service.updateMetadata(new List<MetadataService.Layout>{hhLayout});