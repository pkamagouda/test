(:: pragma bea:local-element-parameter parameter="$utilGetConsignmentDetailsResp" type="ns1:companionMessage/ns1:utilGetConsignmentDetailsResp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getConsignmentDetails_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)


(: # Date # 	# Version # 	   # Author # 		 # Change Description # :)
(: 07/09/2012 		1.0.0 		Dinsa Devassy 			Initial version :)
(: 10/06/2016       1.0.1       Chandrakala S       Added "handsetTradeInDetails" details as part of Refresh Buy Out  project :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetConsignmentDetails_1RequestSBToNB/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:GetConsignmentDetails_1RequestSBToNB($utilGetConsignmentDetailsResp as element(),$getconsignmentrequest as element(*), $configXml as element(*))
    as element(ns0:getConsignmentDetails_1Response) {
        let $utilGetConsignmentDetailsResp := $utilGetConsignmentDetailsResp
        return
            <ns0:getConsignmentDetails_1Response>
                {
                    for $uGCD_OrderConsignmentDetail in $utilGetConsignmentDetailsResp/ns1:uGCD_OrderConsignmentDetail
                    return
                        <ns0:orderConsignmentDetails>
                            {
                                let $uGCD_CustomerDetails := $uGCD_OrderConsignmentDetail/ns1:uGCD_CustomerDetails
                                return
                                    <ns0:customerDetails>
                                        {
                                            if(data($uGCD_CustomerDetails/ns2:title)) then
                                          <ns0:title>{ data($uGCD_CustomerDetails/ns2:title) }</ns0:title>
                                          else ""
                                        }
                                        <ns0:firstName>{ data($uGCD_CustomerDetails/ns2:forename) }</ns0:firstName>
                                        <ns0:surname>{ data($uGCD_CustomerDetails/ns2:surname) }</ns0:surname>
                                        {
                                           let $uGCD_AddressDetails := $uGCD_CustomerDetails/ns1:uGCD_AddressDetails
                                            return
                                              if($uGCD_AddressDetails) then
                                                <ns0:address>
                                                    {
                                                        if(data($uGCD_AddressDetails/ns2:houseNameOrNumber)) then
                                                        <ns0:houseNameOrNumber>{ data($uGCD_AddressDetails/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                                                       else ""
                                                    }
                                                    {
                                                        if(data($uGCD_AddressDetails/ns2:street)) then
                                                       <ns0:street>{ data($uGCD_AddressDetails/ns2:street) }</ns0:street>
                                                       else ""
                                                    }
                                                    {
                                                        if(data($uGCD_AddressDetails/ns2:city)) then
                                                         <ns0:city>{ data($uGCD_AddressDetails/ns2:city) }</ns0:city>
                                                         else ""
                                                    }
                                                    {
                                                        if(data($uGCD_AddressDetails/ns2:county)) then
                                                         <ns0:county>{ data($uGCD_AddressDetails/ns2:county) }</ns0:county>
                                                         else ""
                                                    }
                                                    {
                                                       if(data($uGCD_AddressDetails/ns2:country)) then
                                                         <ns0:country>{ data($uGCD_AddressDetails/ns2:country) }</ns0:country>
                                                         else ""
                                                    }
                                                    {
                                                        if(data($uGCD_AddressDetails/ns2:postcode)) then
                                                        <ns0:postcode>{ data($uGCD_AddressDetails/ns2:postcode) }</ns0:postcode>
                                                        else ""
                                                    }
                                                </ns0:address>
                                                else ""
                                        }
                                        <ns0:collectionReference>{ data($uGCD_CustomerDetails/ns2:collectionReference) }</ns0:collectionReference>
                                        <ns0:contactNumber>{ data($uGCD_CustomerDetails/ns2:msisdn) }</ns0:contactNumber>
                                        {
                                            if(data($uGCD_CustomerDetails/ns2:alternativeContactNumber)) then
                                           <ns0:alternativeContactNumber>{ data($uGCD_CustomerDetails/ns2:alternativeContactNumber) }</ns0:alternativeContactNumber>
                                           else ""
                                        }
                                        {
                                            if(data($uGCD_CustomerDetails/ns2:emailAddress)) then
                                             <ns0:emailAddress>{ data($uGCD_CustomerDetails/ns2:emailAddress) }</ns0:emailAddress>
                                             else ""
                                        }
                                    </ns0:customerDetails>
                            }
                            {
                                let $uGCD_OrderDetails := $uGCD_OrderConsignmentDetail/ns1:uGCD_OrderDetails
                                return
                                    <ns0:orderDetails>
                                        {
                                           if($uGCD_OrderDetails/ns1:uGCD_SourceDetails) then
                                         
                                                <ns0:sourceDetails>
                                                    <ns0:orderMethod>{ data($uGCD_OrderDetails/ns1:uGCD_SourceDetails/ns2:orderMethod) }</ns0:orderMethod>
                                                    <ns0:partner>{ data($uGCD_OrderDetails/ns1:uGCD_SourceDetails/ns2:partner) }</ns0:partner>
                                                    <ns0:owningBusinessDivision>{ data($uGCD_OrderDetails/ns1:uGCD_SourceDetails/ns2:owningBusinessDivision) }</ns0:owningBusinessDivision>
                                                    <ns0:sourceOfSale>{ data($uGCD_OrderDetails/ns1:uGCD_SourceDetails/ns2:sourceOfSale) }</ns0:sourceOfSale>
                                                </ns0:sourceDetails>
                                             else ""
                                        }
                                        <ns0:orderNumber>{ data($uGCD_OrderDetails/ns2:orderNumber) }</ns0:orderNumber>
                                        <ns0:orderDateTime>{ data($uGCD_OrderDetails/ns2:orderTimestamp) }</ns0:orderDateTime>
                                        <ns0:dispatchDate>{ data($uGCD_OrderDetails/ns2:dispatchDate) }</ns0:dispatchDate>
                                        <ns0:deliveryDate>{ data($uGCD_OrderDetails/ns2:deliveryDate) }</ns0:deliveryDate>
                                        <ns0:despatchReference>{ data($uGCD_OrderDetails/ns2:despatchReference) }</ns0:despatchReference>
                                        {
                                            for $productDescription in $uGCD_OrderDetails/ns2:productDescription
                                            return
                                                <ns0:productDescription>{ data($productDescription) }</ns0:productDescription>
                                        }
                                        {
                                           if(data($uGCD_OrderDetails/ns2:releaseToCustomerDate)) then
                                            <ns0:releaseToCustomerDate>{ data($uGCD_OrderDetails/ns2:releaseToCustomerDate) }</ns0:releaseToCustomerDate>
                                            else ""
                                        }
                                        <ns0:consignmentNumber>{ data($uGCD_OrderDetails/ns2:parcelNumber) }</ns0:consignmentNumber>
                                        
                                        {
                                         if(($getconsignmentrequest/ns0:retrieveAdditionalInfo)) then
                                        
                                        for $getconsignment in $getconsignmentrequest/ns0:retrieveAdditionalInfo/ns0:parameterName
                                        return
                                        
                                        if(data($getconsignment)= data($configXml/getConsignmentDetails_1/parameterName)) then
                                        
                                        let $uGCD_TradeInDetails := $uGCD_OrderDetails/ns1:uGCD_TradeInDetails
                                            return
                                            
                                        if($uGCD_TradeInDetails) then
                                        <ns0:handsetTradeInDetails>
                                        <ns0:handsetMake>{data($uGCD_TradeInDetails/ns2:handsetMake)}</ns0:handsetMake>
                                        <ns0:handsetModel>{data($uGCD_TradeInDetails/ns2:handsetModel)}</ns0:handsetModel>
                                        </ns0:handsetTradeInDetails>
                                        else ""
                                       
                                        else ""
                                        
                                        else ""
                                        
                                        
                                        }
                                    </ns0:orderDetails>
                            }
                            {
                                let $uGCD_StoreDetails := $uGCD_OrderConsignmentDetail/ns1:uGCD_StoreDetails
                                return
                                    <ns0:storeDetails>
                                        <ns0:storeNumber>{ data($uGCD_StoreDetails/ns2:storeNumber) }</ns0:storeNumber>
                                        {
                                           if(data($uGCD_StoreDetails/ns2:storeName)) then
                                            <ns0:storeName>{ data($uGCD_StoreDetails/ns2:storeName) }</ns0:storeName>
                                            else ""
                                        }
                                    </ns0:storeDetails>
                            }
                        </ns0:orderConsignmentDetails>
                }
            </ns0:getConsignmentDetails_1Response>
};

declare variable $utilGetConsignmentDetailsResp as element() external;
declare variable $getconsignmentrequest as element(*) external;
declare variable $configXml as element(*) external;

xf:GetConsignmentDetails_1RequestSBToNB($utilGetConsignmentDetailsResp,$getconsignmentrequest,$configXml)