(:: pragma bea:global-element-parameter parameter="$getOrderSummary_1" element="ns0:getOrderSummary_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderSummary_1_UtilGetOrderDetails_Request/";

declare function xf:GetOrderSummary_1_UtilGetOrderDetails_Request($getOrderSummary_1 as element(ns0:getOrderSummary_1))
    as element(ns0:getOrderDetails_3) {
        <ns0:getOrderDetails_3>
       {
        if(($getOrderSummary_1/ns0:msisdn))then
            <ns0:msisdn>{ data($getOrderSummary_1/ns0:msisdn) }</ns0:msisdn>
            else ""
            }
            {
            if(($getOrderSummary_1/ns0:imei))then
            <ns0:imei>{ data($getOrderSummary_1/ns0:imei) }</ns0:imei>
            else ""
            }
        </ns0:getOrderDetails_3>
};

declare variable $getOrderSummary_1 as element(ns0:getOrderSummary_1) external;

xf:GetOrderSummary_1_UtilGetOrderDetails_Request($getOrderSummary_1)