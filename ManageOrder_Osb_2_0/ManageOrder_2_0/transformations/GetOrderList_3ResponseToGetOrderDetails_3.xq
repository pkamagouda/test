(:: pragma bea:global-element-parameter parameter="$getOrderList_3Response" element="ns0:getOrderList_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/GetOrderList_3ResponseToGetOrderDetails_3/";

declare function xf:GetOrderList_3ResponseToGetOrderDetails_3($getOrderList_3Response as element(ns0:getOrderList_3Response),
 $Order as element(*))
    as element(ns0:getOrderDetails_3) {
        <ns0:getOrderDetails_3>
            <ns0:orderNumber>{ data($Order/ns0:orderNumber) }</ns0:orderNumber>
        </ns0:getOrderDetails_3>
};

declare variable $getOrderList_3Response as element(ns0:getOrderList_3Response) external;
declare variable $Order as element(*) external;
xf:GetOrderList_3ResponseToGetOrderDetails_3($getOrderList_3Response,$Order)