public with sharing class OrderHelper {
    public OrderHelper() {}

    public static List<OrderItem> checkRecalcItems(Map<Id, Order> oldRecords, Map<Id, Order> newRecords) {
        Set<Id> orderIds = new Set<Id>();

        for(Order order : newRecords.values()) {
            Order oldRecord = oldRecords.get(order.Id);

            if(order.DistributionCenter__c != oldRecord.DistributionCenter__c) {
                orderIds.add(order.Id);
            }
        }

        List<OrderItem> orderItemList = [
            SELECT Id, ListPrice, Product2Id, orderId
            FROM OrderItem
            WHERE OrderId IN: orderIds
        ];

        List<OrderItem> updateOrderItemList = OrderItemHelper.calcPrice(orderItemList);

        return updateOrderItemList;
    }
}