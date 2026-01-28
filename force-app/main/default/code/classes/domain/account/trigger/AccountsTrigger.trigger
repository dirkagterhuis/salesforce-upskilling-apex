trigger AccountsTrigger on Account (after insert, after update) {
    AccountsTriggerHandler.handleAfterInsertUpdate(Trigger.new, Trigger.oldMap);
}
