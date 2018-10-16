(:: pragma bea:global-element-parameter parameter="$getOrderSummary_1" element="ns1:getOrderSummary_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetOrderListV4" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 25/06/2015 		2.0.0 		Subra Bose          	Initial version :)
declare namespace xf = "http://tempuri.org/ManageCreditCheck_1_0/transformations/GetOrderSummary_1_utilGetOrderListV4_Request/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";


declare function xf:GetOrderSummary_1_utilGetOrderListV4_Request($getOrderSummary_1 as element(ns1:getOrderSummary_1),
$header as element(*),
$configXML as element(*))
    as element() {
      <ns0:companionMessage>
        <ns0:utilGetOrderListV4>
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
            <ns2:msisdn>{ fn:replace(data($getOrderSummary_1/ns1:msisdn),'^44','0') }</ns2:msisdn>
            <ns0:rowSelectionCriteria>
                <ns2:startRowNumber>{ data($configXML/startRowNumber)  }</ns2:startRowNumber>
                <ns2:numRowsRequired>{ data($configXML/numRowsRequired)  }</ns2:numRowsRequired>
            </ns0:rowSelectionCriteria>
        </ns0:utilGetOrderListV4>
          </ns0:companionMessage>
};

declare variable $getOrderSummary_1 as element(ns1:getOrderSummary_1) external;
declare variable $header as element(*) external;
declare variable $configXML as element(*) external;

xf:GetOrderSummary_1_utilGetOrderListV4_Request($getOrderSummary_1,$header,$configXML)