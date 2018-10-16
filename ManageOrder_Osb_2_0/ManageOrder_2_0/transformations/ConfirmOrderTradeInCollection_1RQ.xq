xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$confirmOrderTradeInCollection_1" element="ns1:confirmOrderTradeInCollection_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma  parameter="$configXml" type="xs:anyType" ::)
(:: pragma  parameter="$header" type="xs:anyType" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilConfirmDeviceReturned" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 		# Version # 	  # Author # 				# Change Description # :)
(: 10/06/2016 	  	  1.0.0 		  Chandrakala S 		            Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConfirmOrderTradeInCollection_1RQ/";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";

declare function xf:ConfirmOrderTradeInCollection_1RQ($confirmOrderTradeInCollection_1 as element(ns1:confirmOrderTradeInCollection_1),
    $configXml as element(*),
    $header as element(*))
    as element() {
    <ns0:companionMessage>
        <ns0:utilConfirmDeviceReturned>
         <ns2:companionHeader>
                <ns2:channel>{ data($header/ns3:applicationID) }</ns2:channel>
                {
                    	if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
                    		<ns2:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') }</ns2:userId>
                    	else ''
                    }
                    <ns2:versionId>{ data($configXml/confirmOrderTradeInCollection/versionID) }</ns2:versionId>
                    {
                    	if(data($header/ns3:SOATransactionID)) then
                    		<ns2:replyKey>{ data($header/ns3:SOATransactionID) }</ns2:replyKey>
                    	else ''
                    }
                
            </ns2:companionHeader>
            {
            if(($confirmOrderTradeInCollection_1/ns1:orderNumber)) then
            <ns2:orderNumber>{ data($confirmOrderTradeInCollection_1/ns1:orderNumber) }</ns2:orderNumber>
            else 
             if(($confirmOrderTradeInCollection_1/ns1:orderIdentifier)) then
            <ns2:oid>{ data($confirmOrderTradeInCollection_1/ns1:orderIdentifier) }</ns2:oid>
           else ""
            }
            <ns2:handsetMake>{ data($confirmOrderTradeInCollection_1/ns1:handsetMake) }</ns2:handsetMake>
            <ns2:handsetModel>{ data($confirmOrderTradeInCollection_1/ns1:handsetModel) }</ns2:handsetModel>
            {
            if(data($confirmOrderTradeInCollection_1/ns1:imei)) then
             <ns2:imei>{ data($confirmOrderTradeInCollection_1/ns1:imei) }</ns2:imei>
            else  ""
            }
        </ns0:utilConfirmDeviceReturned>
        </ns0:companionMessage>
};

declare variable $confirmOrderTradeInCollection_1 as element(ns1:confirmOrderTradeInCollection_1) external;
declare variable $configXml as element(*) external;
declare variable $header as element(*) external;

xf:ConfirmOrderTradeInCollection_1RQ($confirmOrderTradeInCollection_1,
    $configXml,
    $header)