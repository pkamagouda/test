(:: pragma bea:global-element-parameter parameter="$getOrderSummary_1" element="ns1:getOrderSummary_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetOrderDetailsV5" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 25/05/2015 		2.0.0 		Subra Bose          	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderSummary_1_UtilGetOrderDetails_Request/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";

declare function xf:GetOrderSummary_1_UtilGetOrderDetailsV5_Request($getOrderSummary_1 as element(ns1:getOrderSummary_1),
$header as element(*))
    as element() {
     <ns0:companionMessage>
        <ns0:utilGetOrderDetails>
         <ns2:companionHeader>
                    <ns2:channel>{ data($header/ns3:applicationID) }</ns2:channel>
                    {
                    	if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
                    		<ns2:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') }</ns2:userId>
                    	else ''
                    }
                    {
                    	if(data($header/ns3:SOATransactionID)) then
                    		<ns2:replyKey>{ data($header/ns3:SOATransactionID) }</ns2:replyKey>
                    	else ''
                    }
             </ns2:companionHeader>
            {
             if(data($getOrderSummary_1/ns1:msisdn)) then
            <ns2:msisdn>{ fn:replace(data($getOrderSummary_1/ns1:msisdn),'^44','0') }</ns2:msisdn>
            else ""
            }
            {
             if(data($getOrderSummary_1/ns1:imei)) then
            <ns2:imei>{ data($getOrderSummary_1/ns1:imei) }</ns2:imei>
            else ""
            }
        </ns0:utilGetOrderDetails>
        </ns0:companionMessage>
};

declare variable $getOrderSummary_1 as element(ns1:getOrderSummary_1) external;
declare variable $header as element(*) external;
xf:GetOrderSummary_1_UtilGetOrderDetailsV5_Request($getOrderSummary_1,
$header)