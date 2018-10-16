(:: pragma bea:global-element-parameter parameter="$utilGetOrderDetailsResponse" element="ns3:utilGetOrderDetailsResponse" location="../../NorthBoundInterfaces/utilgetorderdetailsdata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetailsResponse" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 25/03/2010 		1.0.0 		Amit Kumar 			Initial version :)
(: 25/03/2010 		1.0.1 		Sukhpreet Kaur 		Modified to add mapping for element responseCode :)
(: 07/06/2010 		1.0.2 		Sukhpreet Kaur 		Modified to rename elements houseNameornumber, street, city and county to addressLine1, 
(:													addressLine2 addressLine3 and addressLine4 respectively :)
(: 18/05/2011 		1.0.3 		Pronisa Baruah  	Added a check for data element in proofOfId and 
(:													proofOfResidence. If data is not returned from 
(:													backend then populate “NOT APPLICABLE” :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/UtilGetOrderDetailsRSToGetOrderDetailsRS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/pscommoncompanion_1";
declare namespace ns3 = "http://soa.o2.co.uk/pscommonpostpaydata_2";
declare namespace ns2 = "http://soa.o2.co.uk/postpay/utilgetorderdetailsdata_1";

declare function xf:UtilGetOrderDetailsRSToGetOrderDetailsRS($utilGetOrderDetailsResponse as element(ns2:utilGetOrderDetailsResponse),$configData as element(*))
    as element(ns0:getOrderDetailsResponse) {
    	let $segmentation := $configData/segmentation,
       	    $customerTier := $configData/customerTier
        return   
        <ns0:getOrderDetailsResponse>
        <ns0:responseCode>{ data($configData/getOrderDetails/successCode) }</ns0:responseCode>
        {
            let $orderHeaderDetails := $utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:orderHeaderDetails
            return
            
            <ns0:orderHeaderDetails>
                <ns0:orderNumber>{ data($orderHeaderDetails/ns2:orderNumber) }</ns0:orderNumber>
                <ns0:orderDate>{data($orderHeaderDetails/ns2:orderDate)}</ns0:orderDate>
                <ns0:orderType>{ data($orderHeaderDetails/ns2:orderType) }</ns0:orderType>
                <ns0:partner>{ data($orderHeaderDetails/ns2:partner) }</ns0:partner>
                <ns0:sourceOfSale>{ data($orderHeaderDetails/ns2:sourceOfSale) }</ns0:sourceOfSale>
                {
                 if(data($orderHeaderDetails/ns2:posBusinessUnit))then
                   	<ns0:posBusinessUnit>{ data($orderHeaderDetails/ns2:posBusinessUnit) }</ns0:posBusinessUnit>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns2:salesPerson))then
                   	<ns0:salesPerson>{ data($orderHeaderDetails/ns2:salesPerson) }</ns0:salesPerson>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns2:salesManager))then
                   <ns0:salesManager>{ data($orderHeaderDetails/ns2:salesManager) }</ns0:salesManager>
                 else ""
                }
                <ns0:orderStatus>{ data($orderHeaderDetails/ns2:orderStatus) }</ns0:orderStatus>
                <ns0:portalId>{ data($orderHeaderDetails/ns2:registrationId/ns2:username) }</ns0:portalId>
                {
                 if(data($orderHeaderDetails/ns2:o2UserId))then
                    <ns0:o2UserId>{ data($orderHeaderDetails/ns2:o2UserId) }</ns0:o2UserId>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns2:userAlias))then
                    <ns0:userAlias>{ data($orderHeaderDetails/ns2:userAlias) }</ns0:userAlias>
                 else ""                    
                }
                {
                 if(data($orderHeaderDetails/ns2:customerNumber))then
                    <ns0:customerNumber>{ data($orderHeaderDetails/ns2:customerNumber) }</ns0:customerNumber>
                 else ""
                }
                {
                 	if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/platinum))then
                 		<ns0:customerTier>{ data($customerTier/platinum) }</ns0:customerTier>
	                 else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/gold))then
    	             	<ns0:customerTier>{ data($customerTier/gold) }</ns0:customerTier>
        	         else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/silver))then
            	     	<ns0:customerTier>{ data($customerTier/silver) }</ns0:customerTier>
                	 else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/bronze))then
                 		<ns0:customerTier>{ data($customerTier/bronze) }</ns0:customerTier>
	                 else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/select))then
    	             	<ns0:customerTier>{ data($customerTier/gold) }</ns0:customerTier>
        	         else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/none))then
            	     	<ns0:customerTier>{ data($customerTier/blue) }</ns0:customerTier>
                	 else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/sel_inv))then
                 		<ns0:customerTier>{ data($customerTier/silver) }</ns0:customerTier>
	                 else if(data($orderHeaderDetails/ns2:segmentation)=data($segmentation/sel_few))then
    	             	<ns0:customerTier>{ data($customerTier/platinum) }</ns0:customerTier>
        	        else <ns0:customerTier/>
                }    
                {
                 if(data($orderHeaderDetails/ns2:proofOfId))then
                    <ns0:proofOfId>
                          <ns3:idType>{ data($orderHeaderDetails/ns2:proofOfId/ns2:idType) }</ns3:idType>   
                          {                      
	                          if( data($orderHeaderDetails/ns2:proofOfId/ns2:data) ) then
	                          	  <ns3:data>{ data($orderHeaderDetails/ns2:proofOfId/ns2:data) }</ns3:data>	
		                      else
		                          <ns3:data>{ data($configData/notApplicableValue) }</ns3:data>
	                      }
                    </ns0:proofOfId>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns2:proofOfResidence))then
                    <ns0:proofOfResidence>
                            <ns3:residenceType>{ data($orderHeaderDetails/ns2:proofOfResidence/ns2:residenceType) }</ns3:residenceType>
                            {
	                            if( data($orderHeaderDetails/ns2:proofOfResidence/ns2:data) ) then
	                          	  <ns3:data>{ data($orderHeaderDetails/ns2:proofOfResidence/ns2:data) }</ns3:data>
		                      else
		                      	  <ns3:data>{ data($configData/notApplicableValue) }</ns3:data>
	                      	}
                    </ns0:proofOfResidence>
                 else ""
                }
                <ns0:orderTotalAmount>{ data($orderHeaderDetails/ns2:orderTotal) }</ns0:orderTotalAmount>
                <ns0:returnReasonHeader>
                    {
                     if(data($orderHeaderDetails/ns2:returnReasonHeader/ns2:returnCode))then
                        <ns0:returnCode>{ data($orderHeaderDetails/ns2:returnReasonHeader/ns2:returnCode) }</ns0:returnCode>
                     else ""
                    }
                    {
                     if(data($orderHeaderDetails/ns2:returnReasonHeader/ns2:returnNotes))then
                        <ns0:returnNotes>{ data($orderHeaderDetails/ns2:returnReasonHeader/ns2:returnNotes) }</ns0:returnNotes>
                     else ""
                    }
                </ns0:returnReasonHeader>
                {
                 if(data($orderHeaderDetails/ns2:linkedOrderNum))then
                   <ns0:linkedOrderNum>{ data($orderHeaderDetails/ns2:linkedOrderNum) }</ns0:linkedOrderNum>
                 else ""
                }
                <ns0:workflowIndicator>{ data($orderHeaderDetails/ns2:workflowIndicator) }</ns0:workflowIndicator>
                {
                    for $actualDeliveryDetails in $orderHeaderDetails/ns2:actualDeliveryDetails
                    return
                        <ns0:actualDeliveryDetails>
                            {
                             if(data($actualDeliveryDetails/ns2:consignmentNumber))then
                                <ns0:consignmentNumber>{ data($actualDeliveryDetails/ns2:consignmentNumber) }</ns0:consignmentNumber>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns2:courierDeliveryOrder))then
                               <ns0:courierDeliveryOrder>{ data($actualDeliveryDetails/ns2:courierDeliveryOrder) }</ns0:courierDeliveryOrder>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns2:courierServiceType))then
                                <ns0:courierServiceType>{ data($actualDeliveryDetails/ns2:courierServiceType) }</ns0:courierServiceType>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns2:despatchDate))then
                                <ns0:despatchDate>{ data($actualDeliveryDetails/ns2:despatchDate) }</ns0:despatchDate>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns2:shippedFrom))then
                                <ns0:shippedFrom>{ data($actualDeliveryDetails/ns2:shippedFrom) }</ns0:shippedFrom>
                             else ""
                            }
                        </ns0:actualDeliveryDetails>
                }
                {
                 if(data($orderHeaderDetails/ns2:callReference))then
                    <ns0:callReference>{ data($orderHeaderDetails/ns2:callReference) }</ns0:callReference>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns2:callTypeIndicator))then
                    <ns0:callTypeIndicator>{ data($orderHeaderDetails/ns2:callTypeIndicator) }</ns0:callTypeIndicator>
                 else ""
                }
                <ns0:vatTotal>{ data($orderHeaderDetails/ns2:vatTotal) }</ns0:vatTotal>
            </ns0:orderHeaderDetails>
            }
            <ns0:orderDetails>
                {
                    for $package in $utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:orderDetails/ns2:package
                    return
                        <ns0:package>
                            <ns0:orderLineKey>
                                <ns3:orderId>{ data($package/ns2:orderLineKey/ns2:orderId) }</ns3:orderId>
                                <ns3:lineNumber>{ data($package/ns2:orderLineKey/ns2:lineNumber) }</ns3:lineNumber>
                            </ns0:orderLineKey>
	                            {
	                            if(data($package/ns2:packageName)) then
	                            	<ns0:packageName>{ data($package/ns2:packageName) }</ns0:packageName>
	                            else ''
	                            }
                            <ns0:mobileNumberPortingFlag>{ data($package/ns2:mnpFlag) }</ns0:mobileNumberPortingFlag>
                            <ns0:price>{ data($package/ns2:price) }</ns0:price>
                            <ns0:originalNonDiscountedPrice>{ data($package/ns2:originalNonDiscountedPrice) }</ns0:originalNonDiscountedPrice>
                            {
                             if(data($package/ns2:systemSuggestedDiscountPrice))then
                               <ns0:systemSuggestedDiscountPrice>{ data($package/ns2:systemSuggestedDiscountPrice) }</ns0:systemSuggestedDiscountPrice>
                             else ""
                            }
                            <ns0:vatAmount>
                                <ns3:vatAmount>{ xs:integer( data($package/ns2:vatAmount) ) }</ns3:vatAmount>
                                <ns3:vatRate>{ data($package/ns2:vatAmount/@vatRate) }</ns3:vatRate>
                            </ns0:vatAmount>
                            <ns0:vatReversalReceiptStatus>{ data($package/ns2:vatReversalReceiptRtatus) }</ns0:vatReversalReceiptStatus>
                            {
                                for $item in $package/ns2:item
                                let $categoryVal := $configData/ESMEOrderItemCategory
                                let $category := $configData/getOrderDetails/productTypeToCategoryMappings/productTypeToCategoryMapping[1]/category
                                return
                                    <ns0:item>
                                        <ns0:orderLineKey>
                                            <ns3:orderId>{ data($item/ns2:orderLineKey/ns2:orderId) }</ns3:orderId>
                                            <ns3:lineNumber>{ data($item/ns2:orderLineKey/ns2:lineNumber) }</ns3:lineNumber>
                                        </ns0:orderLineKey>
                                        <ns0:assignNumber>{ data($item/ns2:assignNumber) }</ns0:assignNumber>
                                        <ns0:itemId>{ data($item/ns2:itemId) }</ns0:itemId>
                                        <ns0:itemName>{ data($item/ns2:itemName) }</ns0:itemName>
                                        <ns0:change>{ data($item/ns2:change) }</ns0:change>
                                        {
                                         if(data($item/ns2:imei)and data($item/ns2:category)!= data($category) )then
                                           <ns0:imei>{ data($item/ns2:imei) }</ns0:imei>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:msisdn)and data($item/ns2:category)=data($categoryVal/category))then
                                            <ns0:shortCode>{ replace(data($item/ns2:msisdn),"^0","44" )}</ns0:shortCode>
                                         else if(data($item/ns2:msisdn))then
                                        	<ns0:msisdn>{replace(data($item/ns2:msisdn),"^0","44")}</ns0:msisdn>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:ssn))then
                                            <ns0:ssn>{ data($item/ns2:ssn) }</ns0:ssn>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:imei)and data($item/ns2:category)= data($category) )then
                                           <ns0:serialNo>{ data($item/ns2:imei) }</ns0:serialNo>
                                         else ""
                                        }
                                        <ns0:category>{ data($item/ns2:category) }</ns0:category>
                                        {
                                         if(data($item/ns2:groupId))then
                                            <ns0:groupId>{ data($item/ns2:groupId) }</ns0:groupId>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:handsetRisk))then
                                            <ns0:handsetRisk>{ xs:short( data($item/ns2:handsetRisk) ) }</ns0:handsetRisk>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:handsetMake))then
                                            <ns0:handsetMake>{ data($item/ns2:handsetMake) }</ns0:handsetMake>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:handsetModel))then
                                            <ns0:handsetModel>{ data($item/ns2:handsetModel) }</ns0:handsetModel>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:handsetReplacementGrade))then
                                            <ns0:handsetReplacementGrade>{ data($item/ns2:handsetReplacementGrade) }</ns0:handsetReplacementGrade>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:warrantyOwner))then
                                            <ns0:warrantyOwner>{ data($item/ns2:warrantyOwner) }</ns0:warrantyOwner>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:warrantyEndDate))then
                                            <ns0:warrantyEndDate>{ data($item/ns2:warrantyEndDate) }</ns0:warrantyEndDate>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:status))then
                                            <ns0:status>{ data($item/ns2:status) }</ns0:status>
                                         else ""
                                        }
                                        <ns0:mobileNumberPortingFlag>{ data($item/ns2:mnpFlag) }</ns0:mobileNumberPortingFlag>
                                        {
                                         if(data($item/ns2:destProduct))then
                                            <ns0:destProduct>
                                                    {
                                                     if(data($item/ns2:destProduct/ns2:sku))then
                                                        <ns0:sku>{ data($item/ns2:destProduct/ns2:sku) }</ns0:sku>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($item/ns2:destProduct/ns2:destProductName))then
                                                        <ns0:destProductName>{ data($item/ns2:destProduct/ns2:destProductName) }</ns0:destProductName>
                                                     else ""
                                                    }
                                                    <ns0:returnReason>{ data($item/ns2:destProduct/ns2:returnReason) }</ns0:returnReason>
                                                    <ns0:returnCondition>{ data($item/ns2:destProduct/ns2:returnCondition) }</ns0:returnCondition>
                                                    {
                                                     	if(data($item/ns2:destProduct/ns2:returnTstmp))then
                                                        	<ns0:returnTimestamp>{ data($item/ns2:destProduct/ns2:returnTstmp)}</ns0:returnTimestamp>
                                                     	else ""
                                                    }
                                                </ns0:destProduct>
                                         else "" 
                                        }
                                        {
                                         if (data($item/ns2:logicalProduct))then
                                            <ns0:logicalProduct>
                                                    <ns0:commonRegistryUserName>{ data($item/ns2:logicalProduct/ns2:commonRegistryUserName) }</ns0:commonRegistryUserName>
                                                    <ns0:commonRegistryUserDomain>{ data($item/ns2:logicalProduct/ns2:commonRegistryUserDomain) }</ns0:commonRegistryUserDomain>
                                                    {
                                                      if(data($item/ns2:logicalProduct/ns2:periodic))then
                                                        	<ns0:periodic>
                                                                <ns0:periodRemaining>{ data($item/ns2:logicalProduct/ns2:periodic/ns2:periodRemaining) }</ns0:periodRemaining>
                                                                <ns0:periodType>{ data($item/ns2:logicalProduct/ns2:periodic/ns2:periodType) }</ns0:periodType>
                                                            </ns0:periodic>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($item/ns2:logicalProduct/ns2:quotaed))then
                                                        	<ns0:quotaed>
                                                                <ns0:maximumCount>{ data($item/ns2:logicalProduct/ns2:quotaed/ns2:maximumCount) }</ns0:maximumCount>
                                                            </ns0:quotaed>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($item/ns2:logicalProduct/ns2:overridePrice))then
                                                        <ns0:overridePrice>
                                                                <ns0:assignedProductOverrideAmount>{ data($item/ns2:logicalProduct/ns2:overridePrice/ns2:assignedProductOverrideAmount) }</ns0:assignedProductOverrideAmount>
                                                                <ns0:assignedProductOverridePeriod>{ data($item/ns2:logicalProduct/ns2:overridePrice/ns2:assignedProductOverridePeriod) }</ns0:assignedProductOverridePeriod>
                                                            </ns0:overridePrice>
                                                     else ""
                                                    }
                                                </ns0:logicalProduct>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:L2MConnection))then
                                            <ns0:l2MConnection>
                                                    {
                                                        for $connection in $item/ns2:L2MConnection/ns2:connection
                                                        return
                                                            <ns0:connection>
                                                                <ns0:connectionMethod>{ data($connection/ns2:connectionMethod) }</ns0:connectionMethod>
                                                                <ns0:IPAddress>{ data($connection/ns2:IPAddress) }</ns0:IPAddress>
                                                                <ns0:IPAddressOwner>{ data($connection/ns2:IPAddressOwner) }</ns0:IPAddressOwner>
                                                                {
                                                                 if(data($connection/ns2:connectionName))then
                                                                    <ns0:connectionName>{ data($connection/ns2:connectionName) }</ns0:connectionName>
                                                                 else ""
                                                                }
                                                                {
                                                                 if(data($connection/ns2:ISPRelationship))then
                                                                    <ns0:ISPRelationship>{ data($connection/ns2:ISPRelationship) }</ns0:ISPRelationship>
                                                                 else ""
                                                                }
                                                                {
                                                                 if(data($connection/ns2:ISPRelationshipDescr))then
                                                                    <ns0:ISPRelationshipDescr>{ data($connection/ns2:ISPRelationshipDescr) }</ns0:ISPRelationshipDescr>
                                                                 else ""
                                                                }
                                                                {
                                                                 if(data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info))then
                                                                    <ns0:kilostreamLink60Info>
                                                                            <ns0:existingLink>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:existingLink) }</ns0:existingLink>
                                                                            <ns0:O2ConnectionSite>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:O2ConnectionSite) }</ns0:O2ConnectionSite>
                                                                            {
                                                                             if(data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:readyForServiceDate))then
                                                                                <ns0:readyForServiceDate>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:readyForServiceDate) }</ns0:readyForServiceDate>
                                                                             else ""
                                                                            }
                                                                            <ns0:circuitNumber>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:circuitNumber) }</ns0:circuitNumber>
                                                                            <ns0:siteAddress>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:siteAddress) }</ns0:siteAddress>
                                                                            {
                                                                             if(data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:aggregateBearerRef))then
                                                                                <ns0:aggregateBearerRef>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:aggregateBearerRef) }</ns0:aggregateBearerRef>
                                                                             else ""
                                                                            }
                                                                            {
                                                                             if (data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:aggregateLinkTimeslot))then
                                                                                <ns0:aggregateLinkTimeslot>{ data($item/ns2:L2MConnection/ns2:connection/ns2:kilostreamLink60Info/ns2:aggregateLinkTimeslot) }</ns0:aggregateLinkTimeslot>
                                                                            
                                                                             else ""}
                                                                        </ns0:kilostreamLink60Info>
                                                                 else ""
                                                                }
                                                            </ns0:connection>
                                                    }
                                                    {
                                                        for $sourceIPAddressList in $item/ns2:L2MConnection/ns2:sourceIPAddressList
                                                        return
                                                            <ns0:sourceIPAddressList>
                                                                <ns0:IPAddress>{ data($sourceIPAddressList/ns2:IPAddress) }</ns0:IPAddress>
                                                                <ns0:IPAddressOwner>{ data($sourceIPAddressList/ns2:IPAddressOwner) }</ns0:IPAddressOwner>
                                                                {
                                                                 if(data($sourceIPAddressList/ns2:ISPRelationship))then
                                                                    <ns0:ISPRelationship>{ data($sourceIPAddressList/ns2:ISPRelationship) }</ns0:ISPRelationship>
                                                                 else ""
                                                                }
                                                            </ns0:sourceIPAddressList>
                                                    }
                                                    {
                                                     if(data($item/ns2:L2MConnection/ns2:deliveryReportReqd))then
                                                        <ns0:deliveryReportReqd>{ data($item/ns2:L2MConnection/ns2:deliveryReportReqd) }</ns0:deliveryReportReqd>
                                                     else "" 
                                                    }
                                                </ns0:l2MConnection>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:PTMshortcode))then
                                            <ns0:PTMshortcode>
                                                    {
                                                     if(data($item/ns2:PTMshortcode/ns2:secondaryProductId))then
                                                        <ns0:secondaryProductId>{ data($item/ns2:PTMshortcode/ns2:secondaryProductId) }</ns0:secondaryProductId>
                                                     else "" 
                                                    }
                                                    {
                                                     if(data($item/ns2:PTMshortcode/ns2:secondaryProductName))then
                                                        <ns0:secondaryProductName>{ data($item/ns2:PTMshortcode/ns2:secondaryProductName) }</ns0:secondaryProductName>
                                                     else "" 
                                                    }
                                                    <ns0:shortcodeCategoryId>{ data($item/ns2:PTMshortcode/ns2:shortcodeCategoryId) }</ns0:shortcodeCategoryId>
                                                    {
                                                        for $sourceAddressInfo in $item/ns2:PTMshortcode/ns2:sourceAddressInfo
                                                        return
                                                            <ns0:sourceAddressInfo>
                                                                <ns0:advertisedName>{ data($sourceAddressInfo/ns2:advertisedName) }</ns0:advertisedName>
                                                                {
                                                                 if(data($sourceAddressInfo/ns2:websiteAddress))then
                                                                    <ns0:websiteAddress>{ data($sourceAddressInfo/ns2:websiteAddress) }</ns0:websiteAddress>
                                                                 else ""
                                                                }
                                                                <ns0:serviceDescription>{ data($sourceAddressInfo/ns2:serviceDescription) }</ns0:serviceDescription>
                                                                <ns0:contentType>{ data($sourceAddressInfo/ns2:contentType) }</ns0:contentType>
                                                                {
                                                                 if(data($sourceAddressInfo/ns2:ICSTISApproved))then
                                                                    <ns0:ICSTISApproved>{ data($sourceAddressInfo/ns2:ICSTISApproved) }</ns0:ICSTISApproved>
                                                                 else "" 
                                                                }
                                                                <ns0:howToSubscribe>{ data($sourceAddressInfo/ns2:howToSubscribe) }</ns0:howToSubscribe>
                                                                <ns0:howToUnsubscribe>{ data($sourceAddressInfo/ns2:howToUnsubscribe) }</ns0:howToUnsubscribe>
                                                                <ns0:customerCarePhone>{ data($sourceAddressInfo/ns2:customerCarePhone) }</ns0:customerCarePhone>
                                                                {
                                                                 if(data($sourceAddressInfo/ns2:subContractorName))then
                                                                    <ns0:subContractorName>{ data($sourceAddressInfo/ns2:subContractorName) }</ns0:subContractorName>
                                                                 else ""
                                                                }
                                                            </ns0:sourceAddressInfo>
                                                    }
                                                </ns0:PTMshortcode>
                                         else "" 
                                        }
                                        {
                                         let $insuranceProduct:= $item/ns2:insuranceProduct
                                         return
                                         if(data($insuranceProduct))then
                                            <ns0:insuranceProduct>
                                                    {
                                                     if(data($insuranceProduct/ns2:imei))then
                                                        <ns0:imei>{ data($insuranceProduct/ns2:imei) }</ns0:imei>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($insuranceProduct/ns2:msisdn))then
                                                        <ns0:msisdn>{ replace(data($insuranceProduct/ns2:msisdn),"^0","44")}</ns0:msisdn>
                                                     else ""
                                                    }
                                                    {
                                                     	if(data($insuranceProduct/ns2:startAssignedProductDate))then
                                                       		<ns0:assignedProductStartDate>{ data($insuranceProduct/ns2:startAssignedProductDate)}</ns0:assignedProductStartDate>
                                                     	else ""
                                                    }
                                                    {
                                                     	if(data($insuranceProduct/ns2:endAssignedProductDate))then
                                                        	<ns0:assignedProductEndDate>{data($insuranceProduct/ns2:endAssignedProductDate)}</ns0:assignedProductEndDate>
                                                     	else ""
                                                    }
                                                    {
                                                     if(data($insuranceProduct/ns2:overridePrice))then
                                                        <ns0:overridePrice>
                                                                <ns0:assignedProductOverrideAmount>{ data($insuranceProduct/ns2:overridePrice/ns2:assignedProductOverrideAmount) }</ns0:assignedProductOverrideAmount>
                                                                <ns0:assignedProductOverridePeriod>{ data($insuranceProduct/ns2:overridePrice/ns2:assignedProductOverridePeriod) }</ns0:assignedProductOverridePeriod>
                                                            </ns0:overridePrice>
                                                     else "" 
                                                    }
                                                    <ns0:assignedProductBillingFreq>{ data($insuranceProduct/ns2:assignedProductBillingFreq) }</ns0:assignedProductBillingFreq>
                                                    <ns0:isCrossCharged>{ data($insuranceProduct/ns2:isCrossCharged) }</ns0:isCrossCharged>
                                                </ns0:insuranceProduct>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns2:chargeableDeliveryOptions))then
                                            <ns0:chargeableDeliveryOptions>
                                                    <ns0:deliveryDate>{ data($item/ns2:chargeableDeliveryOptions/ns2:deliveryDate) }</ns0:deliveryDate>
                                                    <ns0:despatchDate>{ data($item/ns2:chargeableDeliveryOptions/ns2:despatchDate) }</ns0:despatchDate>
                                                    <ns0:timeslot>{ data($item/ns2:chargeableDeliveryOptions/ns2:timeslot) }</ns0:timeslot>
                                                </ns0:chargeableDeliveryOptions>
                                         else ""
                                        } 
                                    </ns0:item>
                            }
                            <ns0:vatExclusivePrice>{ data($package/ns2:vatExclusivePrice) }</ns0:vatExclusivePrice>
                        </ns0:package>
                }
                <ns0:VATReceiptRequired>{ data($utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:orderDetails/ns2:VATReceiptRequired) }</ns0:VATReceiptRequired>
            </ns0:orderDetails>
            {
            let $oneOffPaymentDetails:= $utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:oneOffPaymentDetails
            return
             if(data($oneOffPaymentDetails))then
               <ns0:oneOffPaymentDetails>
                        <ns0:paymentMethod>{ data($oneOffPaymentDetails/ns2:paymentMethod) }</ns0:paymentMethod>
                        {
                         if(data($oneOffPaymentDetails/ns2:cardNumber))then
                            <ns0:cardNumber>{ data($oneOffPaymentDetails/ns2:cardNumber) }</ns0:cardNumber>
                         else ""
                        } 
                        {
                         if(data($oneOffPaymentDetails/ns2:cardDetails))then
                            <ns0:cardDetails>
                                    <ns0:cardHolderName>{ data($oneOffPaymentDetails/ns2:cardDetails/ns2:cardHolderName) }</ns0:cardHolderName>
                                    <ns0:expiryDate>{ data($oneOffPaymentDetails/ns2:cardDetails/ns2:expiryDate) }</ns0:expiryDate>
                                    {
                                     if(data($oneOffPaymentDetails/ns2:cardDetails/ns2:issueNumber))then
                                       <ns0:issueNumber>{ data($oneOffPaymentDetails/ns2:cardDetails/ns2:issueNumber) }</ns0:issueNumber>
                                     else ""
                                    }
                                    <ns0:cardType>{ data($oneOffPaymentDetails/ns2:cardDetails/ns2:cardType) }</ns0:cardType>
                                    {
                                     if(data($oneOffPaymentDetails/ns2:cardDetails/ns2:houseNameOrNum))then
                                        <ns0:houseNameOrNum>{ data($oneOffPaymentDetails/ns2:cardDetails/ns2:houseNameOrNum) }</ns0:houseNameOrNum>
                                     else ""
                                    }
                                    {
                                     if(data($oneOffPaymentDetails/ns2:cardDetails/ns2:postCode))then
                                        <ns0:postCode>{ data($oneOffPaymentDetails/ns2:cardDetails/ns2:postCode) }</ns0:postCode>
                                     else ""
                                    }
                                </ns0:cardDetails>
                         else "" 
                        }
                        {
                         if(data($oneOffPaymentDetails/ns2:paymentSettledDate))then
                            <ns0:paymentSettledDate>{ data($oneOffPaymentDetails/ns2:paymentSettledDate) }</ns0:paymentSettledDate>
                         else ""
                        }
                        {
                         if(data($oneOffPaymentDetails/ns2:billingAccountNumber))then
                            <ns0:billingAccountNumber>{ data($oneOffPaymentDetails/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                         else ""
                        }
                    </ns0:oneOffPaymentDetails>
             else "" 
            }
            {
             let $deliveryDetails:= $utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:deliveryDetails
             return
             if(data($deliveryDetails))then
                <ns0:deliveryDetails>
                        <ns0:name>{ data($deliveryDetails/ns2:name) }</ns0:name>
                        <ns0:basicAddress>
                            {
                             if(data($deliveryDetails/ns2:basic_address/@houseNameOrNumber))then
                                <ns0:addressLine1>{ data($deliveryDetails/ns2:basic_address/@houseNameOrNumber) }</ns0:addressLine1>
                             else ""
                            }
                            {
                             if(data($deliveryDetails/ns2:basic_address/@street))then
                                <ns0:addressLine2>{ data($deliveryDetails/ns2:basic_address/@street) }</ns0:addressLine2>
                             else ""
                            }
                            {
                             if(data($deliveryDetails/ns2:basic_address/@city))then
                                <ns0:addressLine3>{ data($deliveryDetails/ns2:basic_address/@city) }</ns0:addressLine3>
                             else ""
                            }
                            {
                             if(data($deliveryDetails/ns2:basic_address/@county))then
                                <ns0:addressLine4>{ data($deliveryDetails/ns2:basic_address/@county) }</ns0:addressLine4>
                             else "" 
                            }
                            {
                            if(data($deliveryDetails/ns2:basic_address/@country)=data($configData/countryNamePolitical))then
                            <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                            else ""
                            }
                            <ns0:postCode>{ data($deliveryDetails/ns2:basic_address/@postCode) }</ns0:postCode>
                        </ns0:basicAddress>
                        {
                         if(data($deliveryDetails/ns2:companyName))then
                            <ns0:companyName>{ data($deliveryDetails/ns2:companyName) }</ns0:companyName>
                         else ""
                        }
                        {
                         if(data($deliveryDetails/ns2:phone))then
                            <ns0:phone>{ data($deliveryDetails/ns2:phone) }</ns0:phone>
                         else ""
                        }
                        {
                         if(data($deliveryDetails/ns2:fax))then
                            <ns0:fax>{ data($deliveryDetails/ns2:fax) }</ns0:fax>
                         else ""
                        }
                        {
                         if(data($deliveryDetails/ns2:shippingMethod))then
                            <ns0:shippingMethod>{ data($deliveryDetails/ns2:shippingMethod) }</ns0:shippingMethod>
                         else "" 
                        }
                    </ns0:deliveryDetails>
             else "" 
            }
            {
             let $credit_check_info:= $utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:credit_check_info
             return
             if(data($credit_check_info))then
                <ns0:creditCheckInfo>
                        {
                         if($credit_check_info/ns2:previousAddress)then
                            <ns0:previousAddress>
                                    {
                                     if(data($credit_check_info/ns2:previousAddress/ns2:addressStatus))then
                                        <ns0:addressStatus>{ data($credit_check_info/ns2:previousAddress/ns2:addressStatus) }</ns0:addressStatus>
                                     else ""
                                    }
                                    <ns0:basicAddress>
                                        {
                                         if(data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@houseNameOrNumber))then
                                            <ns0:addressLine1>{ data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@houseNameOrNumber) }</ns0:addressLine1>
                                         else ""
                                        }
                                        {
                                         if(data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@street))then
                                            <ns0:addressLine2>{ data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@street) }</ns0:addressLine2>
                                         else ""
                                        }
                                        {
                                        if(data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@city))then
                                            <ns0:addressLine3>{ data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@city) }</ns0:addressLine3>
                                         else ""
                                        }
                                        {
                                         if(data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@county))then
                                            <ns0:addressLine4>{ data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@county) }</ns0:addressLine4>
                                         else "" 
                                        }
                                        {
                                         if(data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@country)=data($configData/countryNamePolitical))then
                                         	<ns0:country>{ data($configData/countryNameGeographical)}</ns0:country>
                                         else ""
                                        }
                                        <ns0:postCode>{ data($credit_check_info/ns2:previousAddress/ns2:basicAddress/@postCode) }</ns0:postCode>
                                    </ns0:basicAddress>
                                </ns0:previousAddress>
                         else "" 
                        }
                        <ns0:legalEntityAddress>
                            <ns0:legalEntityName>{ data($credit_check_info/ns2:legalEntityAddress/ns2:legalEntityName) }</ns0:legalEntityName>
                            <ns0:basicAddress>
                                {
                                 if(data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@houseNameOrNumber))then
                                    <ns0:addressLine1>{ data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@houseNameOrNumber) }</ns0:addressLine1>
                                 else ""
                                }
                                {
                                 if(data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@street))then
                                    <ns0:addressLine2>{ data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@street) }</ns0:addressLine2>
                                 else "" 
                                }
                                {
                                 if(data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@city))then
                                    <ns0:addressLine3>{ data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@city) }</ns0:addressLine3>
                                 else ""
                                }
                                {
                                 if(data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@county))then
                                    <ns0:addressLine4>{ data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@county) }</ns0:addressLine4>
                                 else ""
                                }
                                {
                                 if(data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@country)=data($configData/countryNamePolitical))then
                                	<ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                                else ""
                                }
                                <ns0:postCode>{ data($credit_check_info/ns2:legalEntityAddress/ns2:basicAddress/@postCode) }</ns0:postCode>
                            </ns0:basicAddress>
                        </ns0:legalEntityAddress>
                        <ns0:creditCheckDetails>
                            {
                             if(data($credit_check_info/ns2:creditCheckDetails/ns2:status))then
                                <ns0:status>{ data($credit_check_info/ns2:creditCheckDetails/ns2:status) }</ns0:status>
                             else ""
                            }
                            {
                             if(data($credit_check_info/ns2:creditCheckDetails/ns2:vetNumber))then
                                <ns0:vetNumber>{ data($credit_check_info/ns2:creditCheckDetails/ns2:vetNumber) }</ns0:vetNumber>
                             else ""
                            }
                            {
                             if(data($credit_check_info/ns2:creditCheckDetails/ns2:score))then
                                <ns0:score>{ data($credit_check_info/ns2:creditCheckDetails/ns2:score) }</ns0:score>
                             else ""
                            }
                            {
                            if(data($credit_check_info/ns2:creditCheckDetails/ns2:lastCheckDate))then
                               <ns0:lastCheckDate>{ data($credit_check_info/ns2:creditCheckDetails/ns2:lastCheckDate) }</ns0:lastCheckDate>
                             else ""
                            }
                            {
                             if(data($credit_check_info/ns2:creditCheckDetails/ns2:creditClassId))then
                                <ns0:creditClassId>{ xs:integer( data($credit_check_info/ns2:creditCheckDetails/ns2:creditClassId) ) }</ns0:creditClassId>
                             else ""
                            }
                        </ns0:creditCheckDetails>
                    </ns0:creditCheckInfo>
             else "" 
            }
            {
                for $recurringPaymentdetails in $utilGetOrderDetailsResponse/ns2:orderDetailsResponse/ns2:recurringPaymentdetails
                return
                    <ns0:recurringPaymentdetails>
                        {
                         if(data($recurringPaymentdetails/ns2:cardNumber))then
                            <ns0:cardNumber>{ data($recurringPaymentdetails/ns2:cardNumber) }</ns0:cardNumber>
                         else ""
                        } 
                        {
                         if(data($recurringPaymentdetails/ns2:cardDetails))then
                            <ns0:cardDetails>
                                    <ns0:cardHolderName>{ data($recurringPaymentdetails/ns2:cardDetails/ns2:cardHolderName) }</ns0:cardHolderName>
                                    <ns0:expiryDate>{ data($recurringPaymentdetails/ns2:cardDetails/ns2:expiryDate) }</ns0:expiryDate>
                                    {
                                     if(data($recurringPaymentdetails/ns2:cardDetails/ns2:issueNumber))then
                                        <ns0:issueNumber>{ data($recurringPaymentdetails/ns2:cardDetails/ns2:issueNumber) }</ns0:issueNumber>
                                     else ""
                                    }
                                    <ns0:cardType>{ data($recurringPaymentdetails/ns2:cardDetails/ns2:cardType) }</ns0:cardType>
                                    {
                                     if(data($recurringPaymentdetails/ns2:cardDetails/ns2:houseNameOrNum))then
                                        <ns0:houseNameOrNum>{ data($recurringPaymentdetails/ns2:cardDetails/ns2:houseNameOrNum) }</ns0:houseNameOrNum>
                                     else "" 
                                    }
                                    {
                                     if(data($recurringPaymentdetails/ns2:cardDetails/ns2:postCode))then
                                       <ns0:postCode>{ data($recurringPaymentdetails/ns2:cardDetails/ns2:postCode) }</ns0:postCode>
                                     else ""
                                    }
                                </ns0:cardDetails>
                         else ""
                        } 
                        <ns0:accountNumber>{ data($recurringPaymentdetails/ns2:accountNumber) }</ns0:accountNumber>
                        {
                         if($recurringPaymentdetails/ns2:bankDetails)then
                            <ns0:bankDetails>
                                    <ns0:userAccountNumber>{ data($recurringPaymentdetails/ns2:bankDetails/@userAccountNumber) }</ns0:userAccountNumber>
                                    {
                                     if(data($recurringPaymentdetails/ns2:bankDetails/@bankAccountNumber))then
                                        <ns0:bankAccountNumber>{ data($recurringPaymentdetails/ns2:bankDetails/@bankAccountNumber) }</ns0:bankAccountNumber>
                                     else ""
                                    } 
                                    <ns0:bankSortCode>{ data($recurringPaymentdetails/ns2:bankDetails/@bankCode) }</ns0:bankSortCode>
                                    <ns0:bankAccountHolder>{ data($recurringPaymentdetails/ns2:bankDetails/@bankAccountHolder) }</ns0:bankAccountHolder>
                                </ns0:bankDetails>
                         else "" 
                        }
                        <ns0:paymentMethod>{ data($recurringPaymentdetails/ns2:paymentMethod) }</ns0:paymentMethod>
                        {
                         if(data($recurringPaymentdetails/ns2:bmcFailureReason))then
                            <ns0:bmcFailureReason>{ data($recurringPaymentdetails/ns2:bmcFailureReason) }</ns0:bmcFailureReason>
                         else ""
                        }
                        {
                         if(data($recurringPaymentdetails/ns2:billStyle))then
                           <ns0:billStyle>
                                    {
                                     if(data($recurringPaymentdetails/ns2:billStyle/ns2:isBillItemised))then
                                        <ns0:isBillItemised>{ data($recurringPaymentdetails/ns2:billStyle/ns2:isBillItemised) }</ns0:isBillItemised>
                                     else ""
                                    }
                                    {
                                     if(data($recurringPaymentdetails/ns2:billStyle/ns2:isPaperBill))then
                                       <ns0:isPaperBill>{ data($recurringPaymentdetails/ns2:billStyle/ns2:isPaperBill) }</ns0:isPaperBill>
                                     else "" 
                                    }
                                </ns0:billStyle>
                         else ""
                        }
                    </ns0:recurringPaymentdetails>
            }
        </ns0:getOrderDetailsResponse>
};

declare variable $utilGetOrderDetailsResponse as element(ns2:utilGetOrderDetailsResponse) external;
declare variable $configData as element(*) external;

xf:UtilGetOrderDetailsRSToGetOrderDetailsRS($utilGetOrderDetailsResponse,$configData)