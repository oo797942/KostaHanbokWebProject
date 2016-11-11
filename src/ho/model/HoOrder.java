package ho.model;

public class HoOrder {
   
   private int OrderNo;
   private String OrderId;
   private String OrderSangpumNo;
   private String OrderSangpumName;
   private int OrderSoo;
   private String OrderRentState;
   private String OrderRentDate;
   private String OrderPrice;
   private String OrderState;
   private String OrderSize;
   private String OrderRentPrice;
   private String OrderImg;
   private String OrderTotalPrice;
   private String OrderRName;
   private String OrderRTel;
   private String OrderRAddr;
   private String OrderRDemand;
   private String OrderSettleCase;
   private String OrderSEmail;
   private String OrderSTel;
   private String OrderSAddr;
   private String OrderSName;
   
   public HoOrder(){
      
   }
   
   public HoOrder(int OrderNo,String OrderId, String OrderSangpumNo,String OrderSangpumName,int OrderSoo,String OrderRentState,
          String OrderRentDate,String OrderPrice,String OrderState,String OrderSize,String OrderRentPrice, String OrderImg,String OrderTotalPrice,
          String OrderRName,String OrderRTel,String OrderRAddr,String OrderRDemand,String OrderSettleCase, String OrderSEmail,String OrderSTel,
          String OrderSAddr,String OrderSName){
   
        this.OrderNo = OrderNo;
        this.OrderId = OrderId;
        this.OrderSangpumNo = OrderSangpumNo;
        this.OrderSangpumName =  OrderSangpumName;
        this.OrderSoo =OrderSoo;
        this.OrderRentState =OrderRentState;
        this.OrderRentDate =OrderRentDate;
        this.OrderPrice =OrderPrice;
        this.OrderState =OrderState;
        this.OrderSize =OrderSize;
        this.OrderRentPrice =OrderRentPrice;
        this.OrderImg =OrderImg;
        this.OrderTotalPrice =OrderTotalPrice;
        this.OrderRName =OrderRName;
        this.OrderRTel =OrderRTel;
        this.OrderRAddr =OrderRAddr;
        this.OrderRDemand =OrderRDemand;
        this.OrderSettleCase =OrderSettleCase;
        this.OrderSEmail =OrderSEmail;
        this.OrderSTel =OrderSTel;
        this.OrderSAddr =OrderSAddr;
        this.OrderSName =OrderSName;

   }

   public int getOrderNo() {
      return OrderNo;
   }

   public void setOrderNo(int orderNo) {
      OrderNo = orderNo;
   }

   public String getOrderId() {
      return OrderId;
   }

   public void setOrderId(String orderId) {
      OrderId = orderId;
   }

   public String getOrderSangpumNo() {
      return OrderSangpumNo;
   }

   public void setOrderSangpumNo(String orderSangpumNo) {
      OrderSangpumNo = orderSangpumNo;
   }

   public String getOrderSangpumName() {
      return OrderSangpumName;
   }

   public void setOrderSangpumName(String orderSangpumName) {
      OrderSangpumName = orderSangpumName;
   }

   public int getOrderSoo() {
      return OrderSoo;
   }

   public void setOrderSoo(int orderSoo) {
      OrderSoo = orderSoo;
   }

   public String getOrderRentState() {
      return OrderRentState;
   }

   public void setOrderRentState(String orderRentState) {
      OrderRentState = orderRentState;
   }

   public String getOrderRentDate() {
      return OrderRentDate;
   }

   public void setOrderRentDate(String orderRentDate) {
      OrderRentDate = orderRentDate;
   }

   public String getOrderPrice() {
      return OrderPrice;
   }

   public void setOrderPrice(String orderPrice) {
      OrderPrice = orderPrice;
   }

   public String getOrderState() {
      return OrderState;
   }

   public void setOrderState(String orderState) {
      OrderState = orderState;
   }

   public String getOrderSize() {
      return OrderSize;
   }

   public void setOrderSize(String orderSize) {
      OrderSize = orderSize;
   }

   public String getOrderRentPrice() {
      return OrderRentPrice;
   }

   public void setOrderRentPrice(String orderRentPrice) {
      OrderRentPrice = orderRentPrice;
   }

   public String getOrderImg() {
      return OrderImg;
   }

   public void setOrderImg(String orderImg) {
      OrderImg = orderImg;
   }

   public String getOrderTotalPrice() {
      return OrderTotalPrice;
   }

   public void setOrderTotalPrice(String orderTotalPrice) {
      OrderTotalPrice = orderTotalPrice;
   }

   public String getOrderRName() {
      return OrderRName;
   }

   public void setOrderRName(String orderRName) {
      OrderRName = orderRName;
   }

   public String getOrderRTel() {
      return OrderRTel;
   }

   public void setOrderRTel(String orderRTel) {
      OrderRTel = orderRTel;
   }

   public String getOrderRAddr() {
      return OrderRAddr;
   }

   public void setOrderRAddr(String orderRAddr) {
      OrderRAddr = orderRAddr;
   }

   public String getOrderRDemand() {
      return OrderRDemand;
   }

   public void setOrderRDemand(String orderRDemand) {
      OrderRDemand = orderRDemand;
   }

   public String getOrderSettleCase() {
      return OrderSettleCase;
   }

   public void setOrderSettleCase(String orderSettleCase) {
      OrderSettleCase = orderSettleCase;
   }

   public String getOrderSEmail() {
      return OrderSEmail;
   }

   public void setOrderSEmail(String orderSEmail) {
      OrderSEmail = orderSEmail;
   }

   public String getOrderSTel() {
      return OrderSTel;
   }

   public void setOrderSTel(String orderSTel) {
      OrderSTel = orderSTel;
   }

   public String getOrderSAddr() {
      return OrderSAddr;
   }

   public void setOrderSAddr(String orderSAddr) {
      OrderSAddr = orderSAddr;
   }

   public String getOrderSName() {
      return OrderSName;
   }

   public void setOrderSName(String orderSName) {
      OrderSName = orderSName;
   }
   
}
