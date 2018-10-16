(:: pragma bea:global-element-parameter parameter="$getOrderDetails" element="ns0:getOrderDetails" location="../../NorthBoundInterfaces/manageorderdata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:utilGetOrderDetails" location="../../NorthBoundInterfaces/utilgetorderdetailsdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 04/09/2009 		1.0.0 		Sadiq 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/GetOrderDetailsRequestToUtilGetOrderDetailsRequest/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_1";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderdetailsdata_1";

declare function xf:GetOrderDetailsRequestToUtilGetOrderDetailsRequest($getOrderDetails as element(ns0:getOrderDetails))
    as element(ns1:utilGetOrderDetails) {
        <ns1:utilGetOrderDetails>
            <ns1:outboundMessageHeader>
                <ns1:csaId>{ data($getOrderDetails/ns0:userId) }</ns1:csaId>
            </ns1:outboundMessageHeader>
            {
            if($getOrderDetails/ns0:orderNumber) then
            <ns1:orderNumber>{ data($getOrderDetails/ns0:orderNumber) }</ns1:orderNumber>
            else if($getOrderDetails/ns0:msisdn) then
            <ns1:msisdn>{ data($getOrderDetails/ns0:msisdn) }</ns1:msisdn>
            else ""
            }
        </ns1:utilGetOrderDetails>
};

declare variable $getOrderDetails as element(ns0:getOrderDetails) external;

xf:GetOrderDetailsRequestToUtilGetOrderDetailsRequest($getOrderDetails)