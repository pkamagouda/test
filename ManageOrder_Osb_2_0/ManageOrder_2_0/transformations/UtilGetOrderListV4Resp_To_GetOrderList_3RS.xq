xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderListV4Resp" type="ns1:companionMessage/ns1:utilGetOrderListV4Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderList_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/UtilGetOrderListV4Resp_To_GetOrderList_3RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:UtilGetOrderListV4Resp_To_GetOrderList_3RS($utilGetOrderListV4Resp as element(),$configXml as element(*))
    as element(ns0:getOrderList_3Response) {
        <ns0:getOrderList_3Response>
            <ns0:totalOrders>{ data($configXml/ZeroValue) }</ns0:totalOrders>
            <ns0:ordersReturned>{ data($configXml/ZeroValue) }</ns0:ordersReturned>
        </ns0:getOrderList_3Response>
};

declare variable $utilGetOrderListV4Resp as element() external;
declare variable $configXml as element(*) external;

xf:UtilGetOrderListV4Resp_To_GetOrderList_3RS($utilGetOrderListV4Resp,$configXml)