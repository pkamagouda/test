(:: pragma bea:global-element-parameter parameter="$getOrderList_2" element="ns0:getOrderList_2" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:utilGetOrderList_2" location="../../NorthBoundInterfaces/utilgetorderlistdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 23/03/2011 		2.0.0 		Pronisa Baruah  	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderList2RQToUtilGetOrderListRQ/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderlistdata_1";
declare namespace ns2 = "http://soa.o2.co.uk/pscommonpostpaydata_2";


declare function xf:GetOrderList2RQToUtilGetOrderListRQ($getOrderList_2 as element(ns0:getOrderList_2),
    $portalDomain as xs:string)
    as element(ns1:utilGetOrderList_2) {
        <ns1:utilGetOrderList_2>
        {
        	if($getOrderList_2/ns0:portalRegisterationDetails)then
            <ns1:commonRegistrationId>
            	<ns1:username>{ data($getOrderList_2/ns0:portalRegisterationDetails/ns2:portalUserId) }</ns1:username>
             	{
             	if( data($getOrderList_2/ns0:portalRegisterationDetails/ns2:portalDomain) )then
                <ns1:domain>{ data($getOrderList_2/ns0:portalRegisterationDetails/ns2:portalDomain) }</ns1:domain>
                else                
                <ns1:domain>{ $portalDomain }</ns1:domain>
             	}
		    </ns1:commonRegistrationId>
            else if($getOrderList_2/ns0:customerNumber)then
            	<ns1:customerNumber>{ data($getOrderList_2/ns0:customerNumber) }</ns1:customerNumber>
            else if($getOrderList_2/ns0:msisdn)then
            	<ns1:msisdn>{data($getOrderList_2/ns0:msisdn)}</ns1:msisdn>
            else ''
            }
            
            <ns1:rowSelectionCriteria>
                <ns1:startRowNumber>{ data($getOrderList_2/ns0:ordersSelectionCriteria/ns0:startOrderNumber) }</ns1:startRowNumber>
                <ns1:numRowsRequired>{ data($getOrderList_2/ns0:ordersSelectionCriteria/ns0:numOrdersRequired) }</ns1:numRowsRequired>
            </ns1:rowSelectionCriteria>
        </ns1:utilGetOrderList_2>
};

declare variable $getOrderList_2 as element(ns0:getOrderList_2) external;
declare variable $portalDomain as xs:string external;

xf:GetOrderList2RQToUtilGetOrderListRQ($getOrderList_2,
    $portalDomain)