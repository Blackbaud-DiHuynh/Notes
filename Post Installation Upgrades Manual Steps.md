Post Installation Upgrades Manual Steps

12.7.2 - Sustainer Upgrade
- For all layouts on Account, Contact, Batch__c, Tribute__c:
	- If the layout has a "Recurring Gift" related list, remove Next_Payment_Date__c, add Next_Due_Date__c

- For all layouts on Recurring_Gift__c:
	- Add related list for Forgiveness.  Use the following fields:  Name, CreatedByUser, Amount__c, Date__c, Notes__c, Initiated_By__c
	- Add related list for Commitments.  Use these fields:  Name, Amount__c, Date__c
	- Add fields below Next_Payment_Date__c:
		- Next_Due_Date__c (Edit)
		- Paid_Through__c (Edit)
 
	- Add below Amount_Received__c:
		- Balance__c (Readonly)
		- Total_Committed__c (Readonly)
		- Total_Forgiven__c (Readonly)
 
	- Remove Next_Payment_Date__c
 
- Below the existing Designation S-Control, add the following VF pages.  Set the height to the corresponding number:
	- Recurring_Gift_Set_Schedule' => 200
	- Recurring_Gift_Set_Designation' => 415
	- Remove Recurring_Gift_Set_Designation_Widget from the layout

- Recurring Gift List Views:
	- Go to the Recurring Gifts tab
		- There will be a drop-down list of views at the top.  For each view, click "Edit", then make the following change in the "Select Fields To Display" section:
		- Remove Next_Payment_Date__c, add Next_Due_Date__c
 
- On the Recurring Gift Forgiveness layouts:
	- Add the following related lists:  Notes & Attachments, Open Activities, Activity History
	- Add field Notes__c in the 'Information' section
 
- Assign Custom Help Links:
 	- Setup -> Create -> Objects -> Recurring Gift Commitment
	- Click "Edit"
	- Under "Context-Sensitive Help Setting", select the radio button for "Open a window using a VF page".
	- In the drop-down, choose Recurring_Gift_Commitment_HelpPage.
	- Click Save.

	- Setup -> Create -> Objects -> Recurring Gift Forgiveness
	- Click "Edit"
	- Under "Context-Sensitive Help Setting", select the radio button for "Open a window using a VF page".
	- In the drop-down, choose Recurring_Gift_Forgiveness_HelpPage.
	- Click Save.

12.9
- Update Account Dupe Check page
	- Setup -> Customize -> Accounts -> Buttons, Links, and Actions
	- On the action "New", the content source should say "Account Dupe Check Widget (Custom S-Control)".
		- if it says "Account_Dupe_Check(Visualforce Page)", you can skip this step. 
	- Click Edit
	- Choose Visualforce Page
	- Select "Account_Dupe_Check[cv__Account_Dupe_Check]"
	- Click Save

- Update Campaign Create Button page
	- Setup -> Customize -> Campaigns -> Buttons, Links, and Actions
	- On the action "New", the content source should say "Campaign Create Button (Custom S-Control)".
		- if it says "CampaignCreateButton(Visualforce Page)", you can skip this step. 
	- Click Edit
	- Choose Visualforce Page
	- Select "CampaignCreateButton[cv__CampaignCreateButton]"
	- Click Save

12.10 (Mobile)
- Add the “Contact Summary” Visualforce page to contact layouts:
	- Setup -> Customize -> Contacts -> Page Layouts
	- The following steps will need to be repeated for each layout where you want to “Contact Summary” box to appear:
		- Click “Edit” next to the layout that you wish to modify.
		- In the field chooser at the top of the screen, click on the button marked “Section”, and drag that section on to the layout, placing it as high on the page as possible.
		- This will pop up a dialog box.  Fill in the section name with “Contact Summary Section”.  Uncheck the boxes for “Detail Page” and “Edit Page”.  In the Layout box, choose “1-Column”.  Click “OK”.  This creates the section at the top of your layout.
		- In the field chooser at the top, click on “Visualforce Pages” in the left-hand box.
		- Click on the “Contact Summary” page in that list, and drag it and drop it into the section you just created.
		- This adds the the Visualforce page to the layout.  Move your mouse over the page you added, then click on the wrench icon in the top-right corner.
		- In the box called “Height (in pixels)”, type the value “140”.  This value has worked well for Blackbaud’s testing team, but if you find that another value works better for your devices, feel free to change this.
		- Click “OK”.
		- In the field chooser at the top of the screen, click “Save” to save your layout.
	- If you wish to add this page to another layout, start over with step 3a.

- Override the “New Contact” button to use our mobile-optimized record type selection:
	- Setup -> Customize -> Contacts -> Buttons, Links, Actions
	- On the action with a label of "New" and a name of “NewContact”, click on the Edit link for this entry.
	- On the following page, in the section called “Override With”, choose “Visualforce Page”.
	- In the drop-down list next to this radio button, look for an entry that says “Contact Select Record Type [cv__Contact_Select_Record_Type]”, and select that entry.
	- Click “Save” at the bottom.

12.12.1 (12.11 in the code)
- Update Matching Gift Create Button 
	- Setup -> Customize -> Opportunity -> Page Layouts
	- For each of the layout that has an existing Matching Gift Button, perform the following steps:
		- Click Edit
		- Scroll down to the Matching Gift section. 
		- Hover over the Donation_Matching_Gift_Create_Button, click on the Remove icon to remove the deprecated button
		- In the field choose at the top of the screen, click on Visualforce Pages, drag the Donation_Matching_Gift_Create_Button to where the deprecated button was
		- Click on the wrench icon, change the height to 25. 
		- Click Save

