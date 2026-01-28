public class AccountsTriggerHandler {
    public static void handleAfterInsertUpdate(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
        for (Account acc : newAccounts) {
            if (acc.Name != null) {
                AccountsService.updateContactName(acc);
            }
        }
    }
}
