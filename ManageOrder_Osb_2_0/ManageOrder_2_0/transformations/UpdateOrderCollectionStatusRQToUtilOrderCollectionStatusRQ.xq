(:: pragma bea:global-element-parameter parameter="$updateOrderCollectionStatus" element="ns1:updateOrderCollectionStatus" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma  parameter="$header" type="anyType" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilUpdateOrderCollectionStatus" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 18/11/2014 		1.0.0 		Vanishree 			Initial version :)
(: 10/06/2016       1.0.1       Chandrakala S       Added "companionHeader",storeNumber and "uUOCS_HandsetTradeInDetails" details as part of Refresh Buy Out  project :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/UpdateOrderCollectionStatusRQToUtilOrderCollectionStatusRQ/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:UpdateOrderCollectionStatusRQToUtilOrderCollectionStatusRQ($updateOrderCollectionStatus as element(ns1:updateOrderCollectionStatus),
    $header as element(*),$configXml as element(*))
    as element() {
       <ns0:companionMessage>
        <ns0:utilUpdateOrderCollectionStatus>
        <ns2:companionHeader>
         <ns2:channel>{ data($header/ns3:applicationID) } </ns2:channel>
         {
          if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
         <ns2:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') } </ns2:userId>
         else ''
          }
                    
         <ns2:versionId>{ data($configXml/updateOrderCollectionStatus/versionID) }</ns2:versionId>
        </ns2:companionHeader>
            <ns2:orderNumber>{ data($updateOrderCollectionStatus/ns1:orderNumber) }</ns2:orderNumber>
            <ns2:collectionStatus>{ data($updateOrderCollectionStatus/ns1:collectionStatus) }</ns2:collectionStatus>
            <ns2:createdTimestamp>{ data($updateOrderCollectionStatus/ns1:createdTimestamp) }</ns2:createdTimestamp>
            {
            if(data($updateOrderCollectionStatus/ns1:storeNumber)) then
            <ns2:storeNumber>{ data($updateOrderCollectionStatus/ns1:storeNumber) }</ns2:storeNumber>
            else ""
            }
            {
                for $orderLine in $updateOrderCollectionStatus/ns1:orderLine
                return
                    <ns0:uUOCS_OrderLine>
                        <ns2:saleableProductLineNumber>{ data($orderLine/ns1:saleableProductLineNumber) }</ns2:saleableProductLineNumber>
                        <ns0:uUOCS_Products>
                            {
                                for $accessoryDetails in $orderLine/ns1:products/ns1:accessoryDetails
                                return
                                    <ns0:uUOCS_ACC>
                                        <ns2:assignedProductNumber>{ data($accessoryDetails/ns1:assignedProductNumber) }</ns2:assignedProductNumber>
                                        {
                                            if(data($accessoryDetails/ns1:serialNumber))then
                                            
                                                <ns2:serialNumber>{ data($accessoryDetails/ns1:serialNumber) }</ns2:serialNumber>
                                                else ""
                                        }
                                        {
                                            if(data($accessoryDetails/ns1:imei))then
                                            
                                                <ns2:imei>{ data($accessoryDetails/ns1:imei) }</ns2:imei>
                                                else " "
                                        }
                                    </ns0:uUOCS_ACC>
                            }
                            {
                             if(data($orderLine/ns1:products/ns1:handsetDetails/ns1:assignedProductNumber))then
                            <ns0:uUOCS_HAN>
                                <ns2:assignedProductNumber>{ data($orderLine/ns1:products/ns1:handsetDetails/ns1:assignedProductNumber) }</ns2:assignedProductNumber>
                                {
                                    if(data($orderLine/ns1:products/ns1:handsetDetails/ns1:imei))then
                                    
                                        <ns2:imei>{ data($orderLine/ns1:products/ns1:handsetDetails/ns1:imei) }</ns2:imei>
                                        else ""
                                }
                            </ns0:uUOCS_HAN>
                            else " "
                            }
                            {
                                for $literatureDetails in $orderLine/ns1:products/ns1:literatureDetails
                                return
                                    <ns0:uUOCS_LIT>
                                        <ns2:assignedProductNumber>{ data($literatureDetails/ns1:assignedProductNumber) }</ns2:assignedProductNumber>
                                    </ns0:uUOCS_LIT>
                            }
                             {
                              if(data($orderLine/ns1:products/ns1:postPaySimDetails/ns1:assignedProductNumber))then
                              <ns0:uUOCS_POS>
                                <ns2:assignedProductNumber>{ data($orderLine/ns1:products/ns1:postPaySimDetails/ns1:assignedProductNumber) }</ns2:assignedProductNumber>
                                {
                                    if(data($orderLine/ns1:products/ns1:postPaySimDetails/ns1:ssn))then
                                   
                                        <ns2:ssn>{ data($orderLine/ns1:products/ns1:postPaySimDetails/ns1:ssn) }</ns2:ssn>
                                        else ""
                                }
                            </ns0:uUOCS_POS>
                            else ""
                            }
                            {
                             if(data($orderLine/ns1:products/ns1:prePaySimDetails/ns1:assignedProductNumber))then
                            <ns0:uUOCS_PRS>
                                <ns2:assignedProductNumber>{ data($orderLine/ns1:products/ns1:prePaySimDetails/ns1:assignedProductNumber) }</ns2:assignedProductNumber>
                                {
                                    if(data($orderLine/ns1:products/ns1:prePaySimDetails/ns1:msisdn))then
                                   
                                        <ns2:msisdn>{ data($orderLine/ns1:products/ns1:prePaySimDetails/ns1:msisdn) }</ns2:msisdn>
                                        else ""
                                }
                                {
                                   if(data($orderLine/ns1:products/ns1:prePaySimDetails/ns1:ssn))then
                                   
                                        <ns2:ssn>{ data($orderLine/ns1:products/ns1:prePaySimDetails/ns1:ssn) }</ns2:ssn>
                                        else ""
                                }
                            </ns0:uUOCS_PRS>
                            else ""
                            }
                        </ns0:uUOCS_Products>
                    </ns0:uUOCS_OrderLine>
            }
             {
              if(data($updateOrderCollectionStatus/ns1:proofOfIdentity))then
            <ns0:uUOCS_ProofOfIdentity>
                <ns2:proofOfIdentityType>{ data($updateOrderCollectionStatus/ns1:proofOfIdentity/ns1:identityType) }</ns2:proofOfIdentityType>
                <ns2:proofOfIdentityValue>{ data($updateOrderCollectionStatus/ns1:proofOfIdentity/ns1:identityValue) }</ns2:proofOfIdentityValue>
            </ns0:uUOCS_ProofOfIdentity>
            else ""
            }
            {
             if(data($updateOrderCollectionStatus/ns1:proxyDetails))then
            <ns0:uUOCS_ProxyDetails>
                <ns2:name>{ data($updateOrderCollectionStatus/ns1:proxyDetails/ns1:name) }</ns2:name>
                <ns2:proxyAddress>{ data($updateOrderCollectionStatus/ns1:proxyDetails/ns1:proxyAddress) }</ns2:proxyAddress>
                <ns2:telephoneNumber>{ data($updateOrderCollectionStatus/ns1:proxyDetails/ns1:telephoneNumber) }</ns2:telephoneNumber>
            </ns0:uUOCS_ProxyDetails>
            else ""
            }
             {
                    	if(data($header/ns3:SOATransactionID)) then
            <ns2:replyKey>{ data($header/ns3:SOATransactionID) }</ns2:replyKey>
        	else ''
                    }
                    
                    {
                    if(data($updateOrderCollectionStatus/ns1:collectionStatus) =data($configXml/updateOrderCollectionStatus/collectionStatus)) then
                    
                     let $handsetTradeInDetails := $updateOrderCollectionStatus/ns1:handsetTradeInDetails
                      return
                        if($handsetTradeInDetails) then                    
                    <ns0:uUOCS_HandsetTradeInDetails>
                     <ns2:handsetMake>{ data($handsetTradeInDetails/ns1:handsetMake) } </ns2:handsetMake>
                     <ns2:handsetModel>{ data($handsetTradeInDetails/ns1:handsetModel) } </ns2:handsetModel>
                    {
                    if(data($handsetTradeInDetails/ns1:imei)) then
                     <ns2:imei>{ data($handsetTradeInDetails/ns1:imei) }  </ns2:imei>
                     else ""
                     }
                    </ns0:uUOCS_HandsetTradeInDetails>
                    else""
                    else ""
                    }
        </ns0:utilUpdateOrderCollectionStatus>
         </ns0:companionMessage>
};

declare variable $updateOrderCollectionStatus as element(ns1:updateOrderCollectionStatus) external;
declare variable $header as element(*) external;
declare variable $configXml as element(*) external;

xf:UpdateOrderCollectionStatusRQToUtilOrderCollectionStatusRQ($updateOrderCollectionStatus,
    $header,$configXml)