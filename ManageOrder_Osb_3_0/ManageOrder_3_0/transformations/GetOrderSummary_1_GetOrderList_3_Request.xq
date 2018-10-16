xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$getOrderSummary_1" element="ns0:getOrderSummary_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderList_3" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 25/05/2015 		2.0.0 		Subra Bose          	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderSummary_1_GetOrderList_3_Request/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";

declare function xf:GetOrderSummary_1_GetOrderList_3_Request($getOrderSummary_1 as element(ns0:getOrderSummary_1),
$configXML as element(*))
    as element(ns0:getOrderList_3) {
        <ns0:getOrderList_3>
       {
        if(data($getOrderSummary_1/ns0:msisdn)) then
         <ns0:msisdn>{ fn:replace(data($getOrderSummary_1/ns0:msisdn),'^44','0') }</ns0:msisdn>
         else ""
         }
           
            <ns0:rowSelectionCriteria>
                <ns0:startOrderNumber>{ data($configXML/startRowNumber)  }</ns0:startOrderNumber>
                <ns0:numOrdersRequired>{ data($configXML/numRowsRequired)  }</ns0:numOrdersRequired>
            </ns0:rowSelectionCriteria>
        </ns0:getOrderList_3>
};

declare variable $getOrderSummary_1 as element(ns0:getOrderSummary_1) external;
declare variable $configXML as element(*) external;
xf:GetOrderSummary_1_GetOrderList_3_Request($getOrderSummary_1,$configXML)