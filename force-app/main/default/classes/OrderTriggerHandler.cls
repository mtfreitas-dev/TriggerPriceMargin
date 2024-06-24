public with sharing class OrderTriggerHandler {

        List<Order> oldRecords {get; set;} // Trigger.old
        List<Order> newRecords {get; set;} //Trigger.new
        Map<Id, Order> oldMap {get; set;} //Trigger.oldMap
        Map<Id, Order> newMap {get; set;} //Trigger.newMap
    
        public OrderTriggerHandler(List<Order> oldRecords, List<Order> newRecords, Map<Id, Order> oldMap, Map<Id, Order> newMap) {
            this.oldRecords = oldRecords;
            this.newRecords = newRecords;
            this.oldMap = oldMap;
            this.newMap = newMap;
        }

        public void afterUpdate(){
            List<OrderItem> updateOrderItemList = OrderHelper.checkRecalcItems(this.oldMap, this.newMap);

            update updateOrderItemList;
        }
}