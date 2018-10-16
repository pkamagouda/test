(:: pragma bea:global-element-parameter parameter="$getOrderDetails_2" element="ns0:getOrderDetails_2" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:utilGetOrderDetails_2" location="../../NorthBoundInterfaces/utilgetorderdetailsdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 28/03/2011 		2.0.0 		Pronisa Baruah  	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/GetOrderDetails_2RQToUtilGetOrderDetails_2RQ/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderdetailsdata_1";

declare function xf:GetOrderDetails_2RQToUtilGetOrderDetails_2RQ($getOrderDetails_2 as element(ns0:getOrderDetails_2))
    as element(ns1:utilGetOrderDetails_2) {
        <ns1:utilGetOrderDetails_2>
            <ns1:outboundMessageHeader>
                <ns1:csaId>{ data($getOrderDetails_2/ns0:userId) }</ns1:csaId>
            </ns1:outboundMessageHeader>
            {
            	if($getOrderDetails_2/ns0:orderNumber) then
            		<ns1:orderNumber>{ data($getOrderDetails_2/ns0:orderNumber) }</ns1:orderNumber>
            	else if($getOrderDetails_2/ns0:msisdn) then
            		<ns1:msisdn>{ data($getOrderDetails_2/ns0:msisdn) }</ns1:msisdn>
            	else ""
            }
        </ns1:utilGetOrderDetails_2>
};

declare variable $getOrderDetails_2 as element(ns0:getOrderDetails_2) external;

xf:GetOrderDetails_2RQToUtilGetOrderDetails_2RQ($getOrderDetails_2)