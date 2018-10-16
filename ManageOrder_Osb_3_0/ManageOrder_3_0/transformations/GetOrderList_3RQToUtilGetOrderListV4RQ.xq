(:: pragma bea:global-element-parameter parameter="$getOrderList_3" element="ns1:getOrderList_3" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetOrderListV4" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 26/10/2014 		1.0.0 		Vanishree 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderList_3RQToUtilGetOrderListV4RQ/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";

declare function xf:GetOrderList_3RQToUtilGetOrderListV4RQ($getOrderList_3 as element(ns1:getOrderList_3),$header as element(*))
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
               {
                if($getOrderList_3/ns1:commonRegistrationId)then 
            <ns2:commonRegistrationId>
                {
                if(data($getOrderList_3/ns1:commonRegistrationId/ns1:commonRegistryUserName))then
                <ns2:commonRegistryUserName>{ data($getOrderList_3/ns1:commonRegistrationId/ns1:commonRegistryUserName) }</ns2:commonRegistryUserName>
                else ""
                }
                {
                if(data($getOrderList_3/ns1:commonRegistrationId/ns1:commonRegistryUserDomain))then
                <ns2:commonRegistryUserDomain>{ data($getOrderList_3/ns1:commonRegistrationId/ns1:commonRegistryUserDomain) }</ns2:commonRegistryUserDomain>
            else ""
            }
            </ns2:commonRegistrationId>
            else if(data($getOrderList_3/ns1:customerNumber))then
            <ns2:customerNumber>{ data($getOrderList_3/ns1:customerNumber) }</ns2:customerNumber>
            else if(data($getOrderList_3/ns1:msisdn))then
            <ns2:msisdn>{ fn:replace(data($getOrderList_3/ns1:msisdn),'^44','0') }</ns2:msisdn>
            else if($getOrderList_3/ns1:ordersByParcelNumber)then
            
          <ns0:ordersByParcelNumber>
                <ns2:parcelNumber>{ data($getOrderList_3/ns1:ordersByParcelNumber/ns1:parcelNumber) }</ns2:parcelNumber>
            </ns0:ordersByParcelNumber>
           else if(($getOrderList_3/ns1:ordersForInStoreCollection) and data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:isClickAndCollect))then
           
            <ns0:ordersForInStoreCollection>
                {
                   if($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByStoreNumber)then
                   
                        <ns0:ordersByStoreNumber>
                            <ns2:storeNumber>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByStoreNumber/ns1:storeNumber) }</ns2:storeNumber>
                        </ns0:ordersByStoreNumber>
                        
                  else if($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname)then
                    
                        <ns0:ordersByCustomerSurname>
                            <ns2:partySurname>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname/ns1:partySurname) }</ns2:partySurname>
                            {
                if(data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname/ns1:postcode))then
                 <ns2:postcode>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname/ns1:postcode) }</ns2:postcode>
                            else ''
                            }
                        </ns0:ordersByCustomerSurname>
                        else ''
                }
               
               
                <ns2:isClickAndCollect>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:isClickAndCollect) }</ns2:isClickAndCollect>
                <ns2:isClickAndCollectNow>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:isClickAndCollectNow) }</ns2:isClickAndCollectNow>
               
            
            </ns0:ordersForInStoreCollection>
            else if(($getOrderList_3/ns1:ordersForInStoreCollection)and data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:isAnyOrderType))then
            <ns0:ordersForInStoreCollection>
                {
                   if($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByStoreNumber)then
                   
                        <ns0:ordersByStoreNumber>
                            <ns2:storeNumber>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByStoreNumber/ns1:storeNumber) }</ns2:storeNumber>
                        </ns0:ordersByStoreNumber>
                        
                 else if($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname)then
                    
                        <ns0:ordersByCustomerSurname>
                        <ns2:partySurname>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname/ns1:partySurname) }</ns2:partySurname>
                          {
                         if(data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname/ns1:postcode))then
                        <ns2:postcode>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:ordersByCustomerSurname/ns1:postcode) }</ns2:postcode>
                             else ''
                            }
                        </ns0:ordersByCustomerSurname>
                        else ''
                }
               <ns2:isAnyOrderType>{ data($getOrderList_3/ns1:ordersForInStoreCollection/ns1:isAnyOrderType) }</ns2:isAnyOrderType>
            </ns0:ordersForInStoreCollection>
            else ""
            }
            <ns0:rowSelectionCriteria>
                <ns2:startRowNumber>{ xs:int( data($getOrderList_3/ns1:rowSelectionCriteria/ns1:startOrderNumber) ) }</ns2:startRowNumber>
                <ns2:numRowsRequired>{ xs:int( data($getOrderList_3/ns1:rowSelectionCriteria/ns1:numOrdersRequired) ) }</ns2:numRowsRequired>
            </ns0:rowSelectionCriteria>
        </ns0:utilGetOrderListV4>
</ns0:companionMessage>
};

declare variable $getOrderList_3 as element(ns1:getOrderList_3) external;
declare variable $header as element(*) external;

xf:GetOrderList_3RQToUtilGetOrderListV4RQ($getOrderList_3,$header)