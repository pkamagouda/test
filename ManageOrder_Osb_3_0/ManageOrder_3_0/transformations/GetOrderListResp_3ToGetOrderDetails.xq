(:: pragma bea:global-element-parameter parameter="$getOrderList_3Response" element="ns0:getOrderList_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: 25/05/2016 		1.0.0 		Subra Bose 			Changed utilGetOrderDetailsV5Resp to utilGetOrderDetailsResp as part of GlobalCre and Running :)
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderListResp_3ToGetOrderDetails/";

declare function xf:GetOrderListResp_3ToGetOrderDetails($getOrderList_3Response as element(ns0:getOrderList_3Response),
 $Order as element(*))
    as element(ns0:getOrderDetails_3) {
        <ns0:getOrderDetails_3>
            <ns0:orderNumber>{ data($Order/ns0:orderNumber) }</ns0:orderNumber>
        </ns0:getOrderDetails_3>
};

declare variable $getOrderList_3Response as element(ns0:getOrderList_3Response) external;
declare variable $Order as element(*) external;

xf:GetOrderListResp_3ToGetOrderDetails($getOrderList_3Response,$Order)