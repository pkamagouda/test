(:: pragma bea:global-element-parameter parameter="$getConsignmentDetails_1" element="ns1:getConsignmentDetails_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetConsignmentDetails" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	   # Author # 		 # Change Description # :)
(: 07/09/2012 		1.0.0 		Dinsa Devassy 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/proxyservices/GetConsignmentDetails_1RequestNBToSB/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:GetConsignmentDetails_1RequestNBToSB($getConsignmentDetails_1 as element(ns1:getConsignmentDetails_1),$SOATransactionId as xs:string)
    as element() {
        <ns0:companionMessage>
            <ns0:utilGetConsignmentDetails>
                {
                   if(data($getConsignmentDetails_1/ns1:orderNumber)) then
                     <ns2:orderNumber>{ data($getConsignmentDetails_1/ns1:orderNumber) }</ns2:orderNumber>
                     else ""
                }
                {
                   if(data($getConsignmentDetails_1/ns1:consignmentNumber)) then
                  <ns2:parcelNumber>{ data($getConsignmentDetails_1/ns1:consignmentNumber) }</ns2:parcelNumber>
                  else ""
                }
                {
                    if(data($getConsignmentDetails_1/ns1:storeNumber)) then
                    <ns2:storeNumber>{ data($getConsignmentDetails_1/ns1:storeNumber) }</ns2:storeNumber>
                    else ""
                }
               <ns2:replyKey>{data($SOATransactionId)}</ns2:replyKey>
            </ns0:utilGetConsignmentDetails>
               </ns0:companionMessage>
};

declare variable $getConsignmentDetails_1 as element(ns1:getConsignmentDetails_1) external;
declare variable $SOATransactionId as xs:string external;
xf:GetConsignmentDetails_1RequestNBToSB($getConsignmentDetails_1,$SOATransactionId)