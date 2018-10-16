(:: pragma bea:global-element-parameter parameter="$getOrderList" element="ns0:getOrderList" location="../../NorthBoundInterfaces/manageorderdata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:utilGetOrderList" location="../../NorthBoundInterfaces/utilgetorderlistdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 02/09/2009 		1.0.0 		Shashwati 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/GetOrderListRequestToUtilGetOrderListRequest/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_1";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderlistdata_1";

declare function xf:GetOrderListRequestToUtilGetOrderListRequest($getOrderList as element(ns0:getOrderList),$configData as element(*))
    as element(ns1:utilGetOrderList) {
        <ns1:utilGetOrderList>
            {
            if($getOrderList/ns0:portalId)then
            <ns1:commonRegistrationId>
                <ns1:username>{ data($getOrderList/ns0:portalId) }</ns1:username>
                <ns1:domain>{ data($configData/service-config-data/PortalDomain)}</ns1:domain>
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
declare variable $configData as element(*) external;

xf:GetOrderListRequestToUtilGetOrderListRequest($getOrderList,$configData)