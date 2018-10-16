(:: pragma bea:global-element-parameter parameter="$getOrderList" element="ns0:getOrderList" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:utilGetOrderList" location="../../NorthBoundInterfaces/utilgetorderlistdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 22/03/2010 		2.0.0 		Amit Kumar 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderListRQToUtilGetOrderListRQ/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderlistdata_1";

declare function xf:GetOrderListRQToUtilGetOrderListRQ($getOrderList as element(ns0:getOrderList),$portalDomain as xs:string)
    as element(ns1:utilGetOrderList) {
        <ns1:utilGetOrderList>
        {
        	if($getOrderList/ns0:portalId)then
            <ns1:commonRegistrationId>
            	<ns1:username>{ data($getOrderList/ns0:portalId) }</ns1:username>
             	<ns1:domain>{ $portalDomain}</ns1:domain>
		    </ns1:commonRegistrationId>
            else if($getOrderList/ns0:customerNumber)then
            	<ns1:customerNumber>{ data($getOrderList/ns0:customerNumber) }</ns1:customerNumber>
            else if($getOrderList/ns0:msisdn)then
            	<ns1:msisdn>{data($getOrderList/ns0:msisdn)}</ns1:msisdn>
            else ''
            }
            <ns1:rowSelectionCriteria>
                <ns1:startRowNumber>{ data($getOrderList/ns0:ordersSelectionCriteria/ns0:startOrderNumber) }</ns1:startRowNumber>
                <ns1:numRowsRequired>{ data($getOrderList/ns0:ordersSelectionCriteria/ns0:numOrdersRequired) }</ns1:numRowsRequired>
            </ns1:rowSelectionCriteria>
        </ns1:utilGetOrderList>
};

declare variable $getOrderList as element(ns0:getOrderList) external;
declare variable $portalDomain as xs:string external;

xf:GetOrderListRQToUtilGetOrderListRQ($getOrderList,$portalDomain)