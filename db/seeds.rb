# Product.delete_all
Order.delete_all
OrderItem.delete_all
# Product.create! id: 1, name: "Banana", price: 0.49, active: true
# Product.create! id: 2, name: "Apple", price: 0.29, active: true
# Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "已创建"
OrderStatus.create! id: 2, name: "待支付"
OrderStatus.create! id: 3, name: "已支付"
OrderStatus.create! id: 4, name: "运送中"
OrderStatus.create! id: 5, name: "已完成"
OrderStatus.create! id: 6, name: "已取消"
OrderStatus.create! id: 7, name: "已放弃"