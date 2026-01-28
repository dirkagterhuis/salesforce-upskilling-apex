# Salesforce Upskilling - Apex

This repository is part of a Salesforce Upskilling program, specifically about Apex. It contains
a hands-on assignment that covers: 
- Basic DML
- SOQL
- Classes & Methods
- Unit Tests

## Prerequisites
Go through the steps [Environment Setup Guide](https://grid-new10chat.enterprise.slack.com/docs/T5M533YJY/F09QPNCHZN3)
- Authorize a Dev Hub org.
- Create and Connect to a Scratch Org.
- Run `sf project deploy start`.
- Run the Anonymous Apex script below to create sample data:

```java
Account acc = new Account(Name = 'New10', Company_Id__c = 'New10');
insert acc;
insert new Contact(LastName = 'Marcus at ' + acc.Name, FirstName = 'X', AccountId = acc.Id);
```

## Assignment
There is already a Trigger defined on the Account object (before insert, before update), which calls a service method. 
Extend the Service Class Method to:
- Query Contacts with the related `AccountId`.
- Update the Contact's `LastName` to `Marcus at <insert new Account Name here>`.
- Write tests.
- Deploy to the Scratch Org.

### Acceptance Criteria
- If you now update an Account's Name in the SF UI, a related Contact's Name will be updated too.
- All apex compiles without errors.
- Test coverage ≥ 85%.

### Optional expansions if you're bored
- Don't query the Contact by (Salesforce) Account Id but by Account's `Company_Id__c`
- Add a custom exception for a null or invalid Company Id.
- Tests cover: missing company id, non-existent Contact.
- Bulkify: Have the method take a List of Accounts and update all Contacts in one single DML statement.
- Create a Rest class that calls your method. Call the api endpoint to test it.
- Make the Service method Async (Queueable).
- Use Apex Enterprise Patterns & fflib
  - Copy all code in `/salesforce/sf-commons/src/main/default/packages` and deploy it to your scratch org.
  - Implement the fflib Unit of Work.
  - Implement Apex Enterprise Patterns Service and Domain classes.
- Query the company from a microservice owning the Company to get the name (Callout).

