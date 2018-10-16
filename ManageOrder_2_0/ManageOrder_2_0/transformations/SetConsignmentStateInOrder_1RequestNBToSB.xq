(:: pragma bea:global-element-parameter parameter="$setConsignmentStateInOrder_1" element="ns1:setConsignmentStateInOrder_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilUpdateOrderConsignmentStatus" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	   # Author # 		 # Change Description # :)
(: 16/08/2012 		1.0.0 		Dinsa Devassy 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/SetConsignmentStateInOrder_1RequestNBToSB/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:SetConsignmentStateInOrder_1RequestNBToSB($setConsignmentStateInOrder_1 as element(ns1:setConsignmentStateInOrder_1), $SOATransactionId as xs:string, $configXml as element(*))
    as element() {
        <ns0:companionMessage>
        <ns0:utilUpdateOrderConsignmentStatus>
            <ns2:orderNumber>{ data($setConsignmentStateInOrder_1/ns1:orderNumber) }</ns2:orderNumber>
      {
          if(data($setConsignmentStateInOrder_1/ns1:consignmentNumber)) then
            <ns2:parcelNumber>{ data($setConsignmentStateInOrder_1/ns1:consignmentNumber) }</ns2:parcelNumber>
          else 
            <ns2:despatchReference>{ data($setConsignmentStateInOrder_1/ns1:dispatchReference) }</ns2:despatchReference>
           }
           {
            if(data($setConsignmentStateInOrder_1/ns1:orderStatus)=data($configXml/status/key)) then
            <ns2:parcelStatus>{ data($configXml/status[key =data($setConsignmentStateInOrder_1/ns1:orderStatus)]/value) }</ns2:parcelStatus>
            else
              <ns2:parcelStatus>{ data($setConsignmentStateInOrder_1/ns1:orderStatus) }</ns2:parcelStatus>
         } 
            <ns2:createdTimestamp>{ data($setConsignmentStateInOrder_1/ns1:updatedDateTime) }</ns2:createdTimestamp>
            {
                let $source := $setConsignmentStateInOrder_1/ns1:source
                return
                    <ns0:storeDetails>
                        {
                           if(data($source/ns1:storeNumber)) then
                            <ns2:storeNumber>{ data($source/ns1:storeNumber) }</ns2:storeNumber>
                            else ""
                        }
                        <ns2:storeDomain>{ data($source/ns1:storeDomain) }</ns2:storeDomain>
                    </ns0:storeDetails>
            }
           
           <ns2:replyKey>{data($SOATransactionId)}</ns2:replyKey>
        
           
        </ns0:utilUpdateOrderConsignmentStatus>
        </ns0:companionMessage>
};

declare variable $setConsignmentStateInOrder_1 as element(ns1:setConsignmentStateInOrder_1) external;
declare variable $SOATransactionId as xs:string external;
declare variable $configXml as element(*) external;
xf:SetConsignmentStateInOrder_1RequestNBToSB($setConsignmentStateInOrder_1,$SOATransactionId,$configXml)