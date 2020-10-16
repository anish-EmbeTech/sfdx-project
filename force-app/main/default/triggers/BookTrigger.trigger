trigger BookTrigger on Book__c (before insert) {

  	BookTriggerHandler.applyDiscount(Trigger.new);
}