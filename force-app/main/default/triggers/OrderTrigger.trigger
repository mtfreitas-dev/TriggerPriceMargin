trigger OrderTrigger on Order (before insert) {

    OrderTriggerHandler handler = new OrderTriggerHandler(
        Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap
    );

    switch on Trigger.OperationType {
        when  AFTER_UPDATE {
            handler.afterUpdate();
        }
    }
}