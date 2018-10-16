(:: pragma bea:global-element-parameter parameter="$confirmOrderPayment_1" element="ns2:confirmOrderPayment_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma  parameter="$header" type="anyType" ::)
(:: pragma bea:global-element-return element="ns1:companionMessage" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)


(: # Date # 		# Version # 	# Author # 				# Change Description # :)
(: 02/08/2013 	  	  2.0.0 		Ravichandran R 		    Initial version :)


declare namespace ns4 = "http://CommonCompanionElements.eai.o2c.ibm.com";
declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConfirmOrderPayment_1RQToUtilConfirmOrderPaymentRQ/";
declare namespace ns0 = "http://gentypes.eai.o2c.ibm.com";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://companion.eai.o2c.ibm.com";
declare namespace ns2 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns5 = "http://products.eai.o2c.ibm.com";
declare namespace cor = "http://soa.o2.co.uk/coredata_1";

declare function xf:ConfirmOrderPayment_1RQToUtilConfirmOrderPaymentRQ($confirmOrderPayment_1 as element(ns2:confirmOrderPayment_1),
    $header as element(*))
    as element(ns1:companionMessage) {
        <ns1:companionMessage>
            <ns1:utilConfirmOrderPayment>
                <ns3:companionHeader>
                    <ns3:channel>{ data($header/cor:applicationID) }</ns3:channel>
                    {
                    	if(fn:contains(data($header/cor:SOAConsumerTransactionID),':')) then
                    		<ns3:userId>{ fn:substring-after(data($header/cor:SOAConsumerTransactionID),':') }</ns3:userId>
                    	else ''
                    }
                    {
                    	if(data($header/cor:SOATransactionID)) then
                    		<ns3:replyKey>{ data($header/cor:SOATransactionID) }</ns3:replyKey>
                    	else ''
                    }
                </ns3:companionHeader>
                <ns3:orderNumber>{ data($confirmOrderPayment_1/ns2:orderNumber) }</ns3:orderNumber>
            </ns1:utilConfirmOrderPayment>
        </ns1:companionMessage>
};

declare variable $confirmOrderPayment_1 as element(ns2:confirmOrderPayment_1) external;
declare variable $header as element(*) external;

xf:ConfirmOrderPayment_1RQToUtilConfirmOrderPaymentRQ($confirmOrderPayment_1,$header)