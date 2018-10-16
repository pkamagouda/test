(:: pragma bea:global-element-parameter parameter="$submitOrder" element="ns0:submitOrder" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:updateOnlineAccount_2" location="../../NorthBoundInterfaces/manageonlineregistrationdata_1_0.xsd" ::)

(: # Date # 	# Version # 	   # Author # 		 # Change Description # :)
(: 24/04/2013 	  1.0.0 		 Deepthi Narayan		Initial Version for A&R PL migration Project:)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/SubmitOrderRequestToUpdateOnlineAccount_2Request/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/manageonlineregistrationdata_1";
declare namespace ns2 = "http://soa.o2.co.uk/pscommonregistrationdata_1";

declare function xf:SubmitOrderRequestToUpdateOnlineAccount_2Request($submitOrder as element(ns0:submitOrder),$address as xs:string, $configXml as element(*))
    as element(ns1:updateOnlineAccount_2) {
        <ns1:updateOnlineAccount_2>
         <ns1:portalId>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:existingDetails/ns0:commonRegistryUserName) }</ns1:portalId>
         {
         if(data($address)='deliveryAddress' and data($submitOrder/ns0:orderDeliveryDetails))then
       
            <ns1:address>
                {
                    if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressHouseNumber))then
                        <ns2:houseNumber>{ data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressHouseNumber) }</ns2:houseNumber>
                    else ""
                }
                {
                    if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressHouseName))then
                        <ns2:houseName>{ data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressHouseName) }</ns2:houseName>
                     else ""
                }
                <ns2:addressLine1>{ data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:address1stLine) }</ns2:addressLine1>
                {
                if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressTown) and data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressDistrict)and data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:address2ndLine))then
                <ns2:addressLine2>{fn:normalize-space(fn:concat(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:address2ndLine),",",data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressDistrict)))}</ns2:addressLine2>
                else if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressTown) and data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressDistrict))then
                <ns2:addressLine2>{fn:normalize-space(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressDistrict))}</ns2:addressLine2>
                else if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:address2ndLine))then
                <ns2:addressLine2>{data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:address2ndLine)}</ns2:addressLine2>
                else ""
                }
                
                {
                    if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressTown))then
                        <ns2:townCity>{data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressTown) }</ns2:townCity>
                     else if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressDistrict))then
                      <ns2:townCity>{data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressDistrict) }</ns2:townCity>
                      else 
                        <ns2:townCity>{data($configXml/notSet) }</ns2:townCity>
                                      
                }
                {
                   if(data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressCounty))then
                        <ns2:county>{ data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressCounty) }</ns2:county>
                    else ""
                }
                <ns2:postcode>{ data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:addressPostCode) }</ns2:postcode>
                <ns2:country>{ data($submitOrder/ns0:orderDeliveryDetails/ns0:deliveryAddress/ns0:postalCountry) }</ns2:country>
            </ns1:address>
            else if (data($address)='currentAddress')then
             <ns1:address>
                {
                    if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressHouseNumber))then
                        <ns2:houseNumber>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressHouseNumber) }</ns2:houseNumber>
                    else ""
                }
                {
                    if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressHouseName))then
                        <ns2:houseName>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressHouseName) }</ns2:houseName>
                     else ""
                }
                <ns2:addressLine1>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:address1stLine) }</ns2:addressLine1>
                {
                if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressTown) and data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressDistrict) and (data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:address2ndLine)))then
                <ns2:addressLine2>{fn:normalize-space(fn:concat(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:address2ndLine),",",data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressDistrict)))}</ns2:addressLine2>
                else if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressTown) and data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressDistrict))then
                <ns2:addressLine2>{fn:normalize-space(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressDistrict))}</ns2:addressLine2>
                else if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:address2ndLine))then
                <ns2:addressLine2>{data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:address2ndLine)}</ns2:addressLine2>
                else ""
                }
                
                {
                    if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressTown))then
                        <ns2:townCity>{data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressTown) }</ns2:townCity>
                     else if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressDistrict))then
                      <ns2:townCity>{data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressDistrict) }</ns2:townCity>
                      else  
                      <ns2:townCity>{data($configXml/notSet) }</ns2:townCity>               
                }
                {
                   if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressCounty))then
                        <ns2:county>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressCounty) }</ns2:county>
                    else ""
                }
                <ns2:postcode>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressPostCode) }</ns2:postcode>
                <ns2:country>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:postalCountry) }</ns2:country>
                {
                if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressValidationStatus)=data($configXml/submitOrder/nullMaps/null)) then
                ""
                else
                  <ns2:status>{( data($configXml/submitOrder/statusMap[addressValidationStatus=$submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:addressValidationStatus]/status) ) }</ns2:status>
                  }
                {
                    if(data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:equifaxPTCABSID))then
                        <ns2:PTCABS>{ data($submitOrder/ns0:partySet[1]/ns0:existingParty/ns0:currentAddress/ns0:equifaxPTCABSID) }</ns2:PTCABS>
                    else ""
                }
            </ns1:address>
            else ""
            }
        </ns1:updateOnlineAccount_2>
};

declare variable $submitOrder as element(ns0:submitOrder) external;
declare variable $address as xs:string external;
declare variable $configXml as element(*) external;

xf:SubmitOrderRequestToUpdateOnlineAccount_2Request($submitOrder,$address,$configXml)