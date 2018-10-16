(:: pragma bea:global-element-parameter parameter="$setConsignmentStateInOrder_1" element="ns1:setConsignmentStateInOrder_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilUpdateOrderConsignmentStatus" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	   # Author # 		 # Change Description # :)
(: 16/08/2012 		1.0.0 		Dinsa Devassy 			Initial version :)
(: 10/06/2016       1.0.1       Chandrakala S       Added "companionHeader" and "uUOCONS_HandsetTradeInDetails" details as part of Refresh Buy Out  project :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/SetConsignmentStateInOrder_1RequestNBToSB/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";

declare function xf:SetConsignmentStateInOrder_1RequestNBToSB($setConsignmentStateInOrder_1 as element(ns1:setConsignmentStateInOrder_1), $SOATransactionId as xs:string, $configXml as element(*),$header as element(*))
    as element() {
        <ns0:companionMessage>
        <ns0:utilUpdateOrderConsignmentStatus>
          <ns2:companionHeader> 
             <ns2:channel>{ data($header/ns3:applicationID) }</ns2:channel> 
             
             {
             if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
             <ns2:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') }</ns2:userId>
             else ''
             } 
             
             <ns2:versionId>{ data($configXml/setConsignmentStateInOrder_1/versionID) }</ns2:versionId>
           </ns2:companionHeader>
        
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
        {
        if(data($setConsignmentStateInOrder_1/ns1:orderStatus) = data($configXml/setConsignmentStateInOrder_1/orderStatus)) then
            
           let $handsetTradeInDetails := $setConsignmentStateInOrder_1/ns1:handsetTradeInDetails
             return
                                            
            if($handsetTradeInDetails) then
        <ns0:uUOCONS_HandsetTradeInDetails>
        
          <ns2:handsetMake>{data($handsetTradeInDetails/ns1:handsetMake)}</ns2:handsetMake>

          <ns2:handsetModel>{data($handsetTradeInDetails/ns1:handsetModel)}</ns2:handsetModel>
          {
          if(data($handsetTradeInDetails/ns1:imei)) then
          <ns2:imei>{data($handsetTradeInDetails/ns1:imei)}</ns2:imei>
          else ""
          }
        
        </ns0:uUOCONS_HandsetTradeInDetails>
          else ''
        else ''
        }
           
        </ns0:utilUpdateOrderConsignmentStatus>
        </ns0:companionMessage>
};

declare variable $setConsignmentStateInOrder_1 as element(ns1:setConsignmentStateInOrder_1) external;
declare variable $SOATransactionId as xs:string external;
declare variable $configXml as element(*) external;
declare variable $header as element(*) external;

xf:SetConsignmentStateInOrder_1RequestNBToSB($setConsignmentStateInOrder_1,$SOATransactionId,$configXml,$header)