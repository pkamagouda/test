(:: pragma bea:global-element-parameter parameter="$utilGetOrderDetails_2Response" element="ns3:utilGetOrderDetails_2Response" location="../../NorthBoundInterfaces/utilgetorderdetailsdata_1_0.xsd" ::)
(:: pragma  parameter="$configData" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_2Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 28/03/2011 		2.0.0 		Pronisa Baruah  	Initial version :)
(: 18/05/2011 		2.0.1 		Pronisa Baruah  	Added a check for data element in proofOfId and 
(:													proofOfResidence. If data is not returned from 
(:													backend then populate “NOT APPLICABLE” :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/UtilGetOrderDetails_2RSToGetOrderDetails_2RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/pscommoncompanion_1";
declare namespace ns3 = "http://soa.o2.co.uk/postpay/utilgetorderdetailsdata_1";
declare namespace ns2 = "http://soa.o2.co.uk/pscommonpostpaydata_2";

declare function xf:UtilGetOrderDetails_2RSToGetOrderDetails_2RS($utilGetOrderDetails_2Response as element(ns3:utilGetOrderDetails_2Response),
    $configData as element(*))
    as element(ns0:getOrderDetails_2Response) {
        let $segmentation := $configData/segmentation
       	let $customerTier := $configData/customerTier
    	let $orderHeaderDetails := $utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:orderHeaderDetails
        return 
        <ns0:getOrderDetails_2Response>
        	<ns0:responseCode>{ data($configData/getOrderDetails/successCode) }</ns0:responseCode>
			<ns0:orderHeaderDetails>
				<ns0:orderNumber>{ data($orderHeaderDetails/ns3:orderNumber) }</ns0:orderNumber>
         		<ns0:orderDate>{data($orderHeaderDetails/ns3:orderDate)}</ns0:orderDate>
	            <ns0:orderType>{ data($orderHeaderDetails/ns3:orderType) }</ns0:orderType>
    	        <ns0:partner>{ data($orderHeaderDetails/ns3:partner) }</ns0:partner>
        	    <ns0:sourceOfSale>{ data($orderHeaderDetails/ns3:sourceOfSale) }</ns0:sourceOfSale>
            	{
   		        	if(data($orderHeaderDetails/ns3:posBusinessUnit))then
                  		<ns0:posBusinessUnit>{ data($orderHeaderDetails/ns3:posBusinessUnit) }</ns0:posBusinessUnit>
     		   	    else ""
    	        }
     	        {
     	           	if(data($orderHeaderDetails/ns3:salesPerson))then
     	             	<ns0:salesPerson>{ data($orderHeaderDetails/ns3:salesPerson) }</ns0:salesPerson>
     	           	else ""
      	        }
      	        {
     	        	if(data($orderHeaderDetails/ns3:salesManager))then
        	    	   <ns0:salesManager>{ data($orderHeaderDetails/ns3:salesManager) }</ns0:salesManager>
        	        else ""
        	    }
        	    <ns0:orderStatus>{ data($orderHeaderDetails/ns3:orderStatus) }</ns0:orderStatus>
				<ns0:portalRegisterationDetails>
                    <ns2:portalUserId>{ data($orderHeaderDetails/ns3:registrationId/ns3:username) }</ns2:portalUserId>
                    <ns2:portalDomain>{ data($orderHeaderDetails/ns3:registrationId/ns3:domain) }</ns2:portalDomain>
                </ns0:portalRegisterationDetails>
                {
                 if(data($orderHeaderDetails/ns3:o2UserId))then
                    <ns0:o2UserId>{ data($orderHeaderDetails/ns3:o2UserId) }</ns0:o2UserId>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns3:userAlias))then
                    <ns0:userAlias>{ data($orderHeaderDetails/ns3:userAlias) }</ns0:userAlias>
                 else ""                    
                }
                {
                 if(data($orderHeaderDetails/ns3:customerNumber))then
                    <ns0:customerNumber>{ data($orderHeaderDetails/ns3:customerNumber) }</ns0:customerNumber>
                 else ""
                }
                {
                 	if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/platinum))then
                 		<ns0:customerTier>{ data($customerTier/platinum) }</ns0:customerTier>
	                 else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/gold))then
    	             	<ns0:customerTier>{ data($customerTier/gold) }</ns0:customerTier>
        	         else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/silver))then
            	     	<ns0:customerTier>{ data($customerTier/silver) }</ns0:customerTier>
                	 else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/bronze))then
                 		<ns0:customerTier>{ data($customerTier/bronze) }</ns0:customerTier>
	                 else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/select))then
    	             	<ns0:customerTier>{ data($customerTier/gold) }</ns0:customerTier>
        	         else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/none))then
            	     	<ns0:customerTier>{ data($customerTier/blue) }</ns0:customerTier>
                	 else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/sel_inv))then
                 		<ns0:customerTier>{ data($customerTier/silver) }</ns0:customerTier>
	                 else if(data($orderHeaderDetails/ns3:segmentation)=data($segmentation/sel_few))then
    	             	<ns0:customerTier>{ data($customerTier/platinum) }</ns0:customerTier>
        	        else <ns0:customerTier/>
                }
                {
                 if(data($orderHeaderDetails/ns3:proofOfId))then
                    <ns0:proofOfId>
                          <ns2:idType>{ data($orderHeaderDetails/ns3:proofOfId/ns3:idType) }</ns2:idType>
                          {
	                          if(data($orderHeaderDetails/ns3:proofOfId/ns3:data)) then
	                          	  <ns2:data>{ data($orderHeaderDetails/ns3:proofOfId/ns3:data) }</ns2:data>	
		                      else
		                          <ns2:data>{ data($configData/notApplicableValue) }</ns2:data>
	                      }
                    </ns0:proofOfId>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns3:proofOfResidence))then
                    <ns0:proofOfResidence>
                            <ns2:residenceType>{ data($orderHeaderDetails/ns3:proofOfResidence/ns3:residenceType) }</ns2:residenceType>
                            {
	                            if(data($orderHeaderDetails/ns3:proofOfResidence/ns3:data)) then
		                          <ns2:data>{ data($orderHeaderDetails/ns3:proofOfResidence/ns3:data) }</ns2:data>
		                      	else
		                      	  <ns2:data>{ data($configData/notApplicableValue) }</ns2:data>
	                      	}
                    </ns0:proofOfResidence>
                 else ""
                }
                <ns0:orderTotalAmount>{ data($orderHeaderDetails/ns3:orderTotal) }</ns0:orderTotalAmount>
                <ns0:returnReasonHeader>
                    {
                     if(data($orderHeaderDetails/ns3:returnReasonHeader/ns3:returnCode))then
                        <ns0:returnCode>{ data($orderHeaderDetails/ns3:returnReasonHeader/ns3:returnCode) }</ns0:returnCode>
                     else ""
                    }
                    {
                     if(data($orderHeaderDetails/ns3:returnReasonHeader/ns3:returnNotes))then
                        <ns0:returnNotes>{ data($orderHeaderDetails/ns3:returnReasonHeader/ns3:returnNotes) }</ns0:returnNotes>
                     else ""
                    }
                </ns0:returnReasonHeader>
                {
                 if(data($orderHeaderDetails/ns3:linkedOrderNum))then
                   <ns0:linkedOrderNum>{ data($orderHeaderDetails/ns3:linkedOrderNum) }</ns0:linkedOrderNum>
                 else ""
                }
                <ns0:workflowIndicator>{ data($orderHeaderDetails/ns3:workflowIndicator) }</ns0:workflowIndicator>
                {
                    for $actualDeliveryDetails in $orderHeaderDetails/ns3:actualDeliveryDetails
                    return
                        <ns0:actualDeliveryDetails>
                            {
                             if(data($actualDeliveryDetails/ns3:consignmentNumber))then
                                <ns0:consignmentNumber>{ data($actualDeliveryDetails/ns3:consignmentNumber) }</ns0:consignmentNumber>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns3:courierDeliveryOrder))then
                               <ns0:courierDeliveryOrder>{ data($actualDeliveryDetails/ns3:courierDeliveryOrder) }</ns0:courierDeliveryOrder>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns3:courierServiceType))then
                                <ns0:courierServiceType>{ data($actualDeliveryDetails/ns3:courierServiceType) }</ns0:courierServiceType>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns3:despatchDate))then
                                <ns0:despatchDate>{ data($actualDeliveryDetails/ns3:despatchDate) }</ns0:despatchDate>
                             else ""
                            }
                            {
                             if(data($actualDeliveryDetails/ns3:shippedFrom))then
                                <ns0:shippedFrom>{ data($actualDeliveryDetails/ns3:shippedFrom) }</ns0:shippedFrom>
                             else ""
                            }
                        </ns0:actualDeliveryDetails>
                }
                {
                 if(data($orderHeaderDetails/ns3:callReference))then
                    <ns0:callReference>{ data($orderHeaderDetails/ns3:callReference) }</ns0:callReference>
                 else ""
                }
                {
                 if(data($orderHeaderDetails/ns3:callTypeIndicator))then
                    <ns0:callTypeIndicator>{ data($orderHeaderDetails/ns3:callTypeIndicator) }</ns0:callTypeIndicator>
                 else ""
                }
               	<ns0:vatTotal>{ data($orderHeaderDetails/ns3:vatTotal) }</ns0:vatTotal>  
               	{
               	if(data($orderHeaderDetails/ns3:upgradeDetails)) then
				<ns0:upgradeDetails>
                    {
                        if (data($orderHeaderDetails/ns3:upgradeDetails/ns3:earlyUpgradeFee)) then
                            <ns0:earlyUpgradeFee>{ data($orderHeaderDetails/ns3:upgradeDetails/ns3:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                        else ""
                            
                    }
                    {
                        if (data($orderHeaderDetails/ns3:upgradeDetails/ns3:earlyUpgradeReference)) then
                            <ns0:earlyUpgradeReference>{ data($orderHeaderDetails/ns3:upgradeDetails/ns3:earlyUpgradeReference) }</ns0:earlyUpgradeReference>
                        else ""
                    }
                    <ns0:earlyUpgradeOffered>{ data($orderHeaderDetails/ns3:upgradeDetails/ns3:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                    <ns0:earlyUpgradeTaken>{ data($orderHeaderDetails/ns3:upgradeDetails/ns3:earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                    <ns0:upgradeOverrideApplied>{ data($orderHeaderDetails/ns3:upgradeDetails/ns3:upgradeOverrideApplied) }</ns0:upgradeOverrideApplied>
                </ns0:upgradeDetails>
                else ""
                }
			</ns0:orderHeaderDetails>
			<ns0:orderDetails>
                {
                    for $package in $utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:orderDetails/ns3:package
                    return
                        <ns0:package>
                            <ns0:orderLineKey>
                                <ns2:orderId>{ data($package/ns3:orderLineKey/ns3:orderId) }</ns2:orderId>
                                <ns2:lineNumber>{ data($package/ns3:orderLineKey/ns3:lineNumber) }</ns2:lineNumber>
                            </ns0:orderLineKey>
	                            {
	                            if(data($package/ns3:packageName)) then
	                            	<ns0:packageName>{ data($package/ns3:packageName) }</ns0:packageName>
	                            else ''
	                            }
                            <ns0:mobileNumberPortingFlag>{ data($package/ns3:mnpFlag) }</ns0:mobileNumberPortingFlag>
                            <ns0:price>{ data($package/ns3:price) }</ns0:price>
                            <ns0:originalNonDiscountedPrice>{ data($package/ns3:originalNonDiscountedPrice) }</ns0:originalNonDiscountedPrice>
                            {
                             if(data($package/ns3:systemSuggestedDiscountPrice))then
                               <ns0:systemSuggestedDiscountPrice>{ data($package/ns3:systemSuggestedDiscountPrice) }</ns0:systemSuggestedDiscountPrice>
                             else ""
                            }
                            <ns0:vatAmount>
                                <ns2:vatAmount>{ xs:integer( data($package/ns3:vatAmount) ) }</ns2:vatAmount>
                                <ns2:vatRate>{ data($package/ns3:vatAmount/@vatRate) }</ns2:vatRate>
                            </ns0:vatAmount>
                            <ns0:vatReversalReceiptStatus>{ data($package/ns3:vatReversalReceiptRtatus) }</ns0:vatReversalReceiptStatus>
                            {
                                for $item in $package/ns3:item
                                let $categoryVal := $configData/ESMEOrderItemCategory
                                let $category := $configData/getOrderDetails/productTypeToCategoryMappings/productTypeToCategoryMapping[1]/category
                                return
                                    <ns0:item>
                                        <ns0:orderLineKey>
                                            <ns2:orderId>{ data($item/ns3:orderLineKey/ns3:orderId) }</ns2:orderId>
                                            <ns2:lineNumber>{ data($item/ns3:orderLineKey/ns3:lineNumber) }</ns2:lineNumber>
                                        </ns0:orderLineKey>
                                        <ns0:assignNumber>{ data($item/ns3:assignNumber) }</ns0:assignNumber>
                                        <ns0:itemId>{ data($item/ns3:itemId) }</ns0:itemId>
                                        <ns0:itemName>{ data($item/ns3:itemName) }</ns0:itemName>
                                        <ns0:change>{ data($item/ns3:change) }</ns0:change>
                                        {
                                         if(data($item/ns3:imei)and data($item/ns3:category)!= data($category) )then
                                           <ns0:imei>{ data($item/ns3:imei) }</ns0:imei>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:msisdn)and data($item/ns3:category)=data($categoryVal/category))then
                                            <ns0:shortCode>{ replace(data($item/ns3:msisdn),"^0","44" )}</ns0:shortCode>
                                         else if(data($item/ns3:msisdn))then
                                        	<ns0:msisdn>{replace(data($item/ns3:msisdn),"^0","44")}</ns0:msisdn>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:ssn))then
                                            <ns0:ssn>{ data($item/ns3:ssn) }</ns0:ssn>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:imei)and data($item/ns3:category)= data($category) )then
                                           <ns0:serialNo>{ data($item/ns3:imei) }</ns0:serialNo>
                                         else ""
                                        }
                                        <ns0:category>{ data($item/ns3:category) }</ns0:category>
                                        {
                                         if(data($item/ns3:groupId))then
                                            <ns0:groupId>{ data($item/ns3:groupId) }</ns0:groupId>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:handsetRisk))then
                                            <ns0:handsetRisk>{ xs:short( data($item/ns3:handsetRisk) ) }</ns0:handsetRisk>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:handsetMake))then
                                            <ns0:handsetMake>{ data($item/ns3:handsetMake) }</ns0:handsetMake>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:handsetModel))then
                                            <ns0:handsetModel>{ data($item/ns3:handsetModel) }</ns0:handsetModel>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:handsetReplacementGrade))then
                                            <ns0:handsetReplacementGrade>{ data($item/ns3:handsetReplacementGrade) }</ns0:handsetReplacementGrade>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:warrantyOwner))then
                                            <ns0:warrantyOwner>{ data($item/ns3:warrantyOwner) }</ns0:warrantyOwner>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:warrantyEndDate))then
                                            <ns0:warrantyEndDate>{ data($item/ns3:warrantyEndDate) }</ns0:warrantyEndDate>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:status))then
                                            <ns0:status>{ data($item/ns3:status) }</ns0:status>
                                         else ""
                                        }
                                        <ns0:mobileNumberPortingFlag>{ data($item/ns3:mnpFlag) }</ns0:mobileNumberPortingFlag>
                                        {
                                         if(data($item/ns3:destProduct))then
                                            <ns0:destProduct>
                                                    {
                                                     if(data($item/ns3:destProduct/ns3:sku))then
                                                        <ns0:sku>{ data($item/ns3:destProduct/ns3:sku) }</ns0:sku>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($item/ns3:destProduct/ns3:destProductName))then
                                                        <ns0:destProductName>{ data($item/ns3:destProduct/ns3:destProductName) }</ns0:destProductName>
                                                     else ""
                                                    }
                                                    <ns0:returnReason>{ data($item/ns3:destProduct/ns3:returnReason) }</ns0:returnReason>
                                                    <ns0:returnCondition>{ data($item/ns3:destProduct/ns3:returnCondition) }</ns0:returnCondition>
                                                    {
                                                     	if(data($item/ns3:destProduct/ns3:returnTstmp))then
                                                        	<ns0:returnTimestamp>{ data($item/ns3:destProduct/ns3:returnTstmp)}</ns0:returnTimestamp>
                                                     	else ""
                                                    }
                                                </ns0:destProduct>
                                         else "" 
                                        }
                                        {
                                         if (data($item/ns3:logicalProduct))then
                                            <ns0:logicalProduct>
                                                    <ns0:commonRegistryUserName>{ data($item/ns3:logicalProduct/ns3:commonRegistryUserName) }</ns0:commonRegistryUserName>
                                                    <ns0:commonRegistryUserDomain>{ data($item/ns3:logicalProduct/ns3:commonRegistryUserDomain) }</ns0:commonRegistryUserDomain>
                                                    {
                                                      if(data($item/ns3:logicalProduct/ns3:periodic))then
                                                        	<ns0:periodic>
                                                                <ns0:periodRemaining>{ data($item/ns3:logicalProduct/ns3:periodic/ns3:periodRemaining) }</ns0:periodRemaining>
                                                                <ns0:periodType>{ data($item/ns3:logicalProduct/ns3:periodic/ns3:periodType) }</ns0:periodType>
                                                            </ns0:periodic>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($item/ns3:logicalProduct/ns3:quotaed))then
                                                        	<ns0:quotaed>
                                                                <ns0:maximumCount>{ data($item/ns3:logicalProduct/ns3:quotaed/ns3:maximumCount) }</ns0:maximumCount>
                                                            </ns0:quotaed>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($item/ns3:logicalProduct/ns3:overridePrice))then
                                                        <ns0:overridePrice>
                                                                <ns0:assignedProductOverrideAmount>{ data($item/ns3:logicalProduct/ns3:overridePrice/ns3:assignedProductOverrideAmount) }</ns0:assignedProductOverrideAmount>
                                                                <ns0:assignedProductOverridePeriod>{ data($item/ns3:logicalProduct/ns3:overridePrice/ns3:assignedProductOverridePeriod) }</ns0:assignedProductOverridePeriod>
                                                            </ns0:overridePrice>
                                                     else ""
                                                    }
                                                </ns0:logicalProduct>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:L2MConnection))then
                                            <ns0:l2MConnection>
                                                    {
                                                        for $connection in $item/ns3:L2MConnection/ns3:connection
                                                        return
                                                            <ns0:connection>
                                                                <ns0:connectionMethod>{ data($connection/ns3:connectionMethod) }</ns0:connectionMethod>
                                                                <ns0:IPAddress>{ data($connection/ns3:IPAddress) }</ns0:IPAddress>
                                                                <ns0:IPAddressOwner>{ data($connection/ns3:IPAddressOwner) }</ns0:IPAddressOwner>
                                                                {
                                                                 if(data($connection/ns3:connectionName))then
                                                                    <ns0:connectionName>{ data($connection/ns3:connectionName) }</ns0:connectionName>
                                                                 else ""
                                                                }
                                                                {
                                                                 if(data($connection/ns3:ISPRelationship))then
                                                                    <ns0:ISPRelationship>{ data($connection/ns3:ISPRelationship) }</ns0:ISPRelationship>
                                                                 else ""
                                                                }
                                                                {
                                                                 if(data($connection/ns3:ISPRelationshipDescr))then
                                                                    <ns0:ISPRelationshipDescr>{ data($connection/ns3:ISPRelationshipDescr) }</ns0:ISPRelationshipDescr>
                                                                 else ""
                                                                }
                                                                {
                                                                 if(data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info))then
                                                                    <ns0:kilostreamLink60Info>
                                                                            <ns0:existingLink>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:existingLink) }</ns0:existingLink>
                                                                            <ns0:O2ConnectionSite>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:O2ConnectionSite) }</ns0:O2ConnectionSite>
                                                                            {
                                                                             if(data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:readyForServiceDate))then
                                                                                <ns0:readyForServiceDate>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:readyForServiceDate) }</ns0:readyForServiceDate>
                                                                             else ""
                                                                            }
                                                                            <ns0:circuitNumber>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:circuitNumber) }</ns0:circuitNumber>
                                                                            <ns0:siteAddress>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:siteAddress) }</ns0:siteAddress>
                                                                            {
                                                                             if(data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:aggregateBearerRef))then
                                                                                <ns0:aggregateBearerRef>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:aggregateBearerRef) }</ns0:aggregateBearerRef>
                                                                             else ""
                                                                            }
                                                                            {
                                                                             if (data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:aggregateLinkTimeslot))then
                                                                                <ns0:aggregateLinkTimeslot>{ data($item/ns3:L2MConnection/ns3:connection/ns3:kilostreamLink60Info/ns3:aggregateLinkTimeslot) }</ns0:aggregateLinkTimeslot>
                                                                            
                                                                             else ""}
                                                                        </ns0:kilostreamLink60Info>
                                                                 else ""
                                                                }
                                                            </ns0:connection>
                                                    }
                                                    {
                                                        for $sourceIPAddressList in $item/ns3:L2MConnection/ns3:sourceIPAddressList
                                                        return
                                                            <ns0:sourceIPAddressList>
                                                                <ns0:IPAddress>{ data($sourceIPAddressList/ns3:IPAddress) }</ns0:IPAddress>
                                                                <ns0:IPAddressOwner>{ data($sourceIPAddressList/ns3:IPAddressOwner) }</ns0:IPAddressOwner>
                                                                {
                                                                 if(data($sourceIPAddressList/ns3:ISPRelationship))then
                                                                    <ns0:ISPRelationship>{ data($sourceIPAddressList/ns3:ISPRelationship) }</ns0:ISPRelationship>
                                                                 else ""
                                                                }
                                                            </ns0:sourceIPAddressList>
                                                    }
                                                    {
                                                     if(data($item/ns3:L2MConnection/ns3:deliveryReportReqd))then
                                                        <ns0:deliveryReportReqd>{ data($item/ns3:L2MConnection/ns3:deliveryReportReqd) }</ns0:deliveryReportReqd>
                                                     else "" 
                                                    }
                                                </ns0:l2MConnection>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:PTMshortcode))then
                                            <ns0:PTMshortcode>
                                                    {
                                                     if(data($item/ns3:PTMshortcode/ns3:secondaryProductId))then
                                                        <ns0:secondaryProductId>{ data($item/ns3:PTMshortcode/ns3:secondaryProductId) }</ns0:secondaryProductId>
                                                     else "" 
                                                    }
                                                    {
                                                     if(data($item/ns3:PTMshortcode/ns3:secondaryProductName))then
                                                        <ns0:secondaryProductName>{ data($item/ns3:PTMshortcode/ns3:secondaryProductName) }</ns0:secondaryProductName>
                                                     else "" 
                                                    }
                                                    <ns0:shortcodeCategoryId>{ data($item/ns3:PTMshortcode/ns3:shortcodeCategoryId) }</ns0:shortcodeCategoryId>
                                                    {
                                                        for $sourceAddressInfo in $item/ns3:PTMshortcode/ns3:sourceAddressInfo
                                                        return
                                                            <ns0:sourceAddressInfo>
                                                                <ns0:advertisedName>{ data($sourceAddressInfo/ns3:advertisedName) }</ns0:advertisedName>
                                                                {
                                                                 if(data($sourceAddressInfo/ns3:websiteAddress))then
                                                                    <ns0:websiteAddress>{ data($sourceAddressInfo/ns3:websiteAddress) }</ns0:websiteAddress>
                                                                 else ""
                                                                }
                                                                <ns0:serviceDescription>{ data($sourceAddressInfo/ns3:serviceDescription) }</ns0:serviceDescription>
                                                                <ns0:contentType>{ data($sourceAddressInfo/ns3:contentType) }</ns0:contentType>
                                                                {
                                                                 if(data($sourceAddressInfo/ns3:ICSTISApproved))then
                                                                    <ns0:ICSTISApproved>{ data($sourceAddressInfo/ns3:ICSTISApproved) }</ns0:ICSTISApproved>
                                                                 else "" 
                                                                }
                                                                <ns0:howToSubscribe>{ data($sourceAddressInfo/ns3:howToSubscribe) }</ns0:howToSubscribe>
                                                                <ns0:howToUnsubscribe>{ data($sourceAddressInfo/ns3:howToUnsubscribe) }</ns0:howToUnsubscribe>
                                                                <ns0:customerCarePhone>{ data($sourceAddressInfo/ns3:customerCarePhone) }</ns0:customerCarePhone>
                                                                {
                                                                 if(data($sourceAddressInfo/ns3:subContractorName))then
                                                                    <ns0:subContractorName>{ data($sourceAddressInfo/ns3:subContractorName) }</ns0:subContractorName>
                                                                 else ""
                                                                }
                                                            </ns0:sourceAddressInfo>
                                                    }
                                                </ns0:PTMshortcode>
                                         else "" 
                                        }
                                        {
                                         let $insuranceProduct:= $item/ns3:insuranceProduct
                                         return
                                         if(data($insuranceProduct))then
                                            <ns0:insuranceProduct>
                                                    {
                                                     if(data($insuranceProduct/ns3:imei))then
                                                        <ns0:imei>{ data($insuranceProduct/ns3:imei) }</ns0:imei>
                                                     else ""
                                                    }
                                                    {
                                                     if(data($insuranceProduct/ns3:msisdn))then
                                                        <ns0:msisdn>{ replace(data($insuranceProduct/ns3:msisdn),"^0","44")}</ns0:msisdn>
                                                     else ""
                                                    }
                                                    {
                                                     	if(data($insuranceProduct/ns3:startAssignedProductDate))then
                                                       		<ns0:assignedProductStartDate>{ data($insuranceProduct/ns3:startAssignedProductDate)}</ns0:assignedProductStartDate>
                                                     	else ""
                                                    }
                                                    {
                                                     	if(data($insuranceProduct/ns3:endAssignedProductDate))then
                                                        	<ns0:assignedProductEndDate>{data($insuranceProduct/ns3:endAssignedProductDate)}</ns0:assignedProductEndDate>
                                                     	else ""
                                                    }
                                                    {
                                                     if(data($insuranceProduct/ns3:overridePrice))then
                                                        <ns0:overridePrice>
                                                                <ns0:assignedProductOverrideAmount>{ data($insuranceProduct/ns3:overridePrice/ns3:assignedProductOverrideAmount) }</ns0:assignedProductOverrideAmount>
                                                                <ns0:assignedProductOverridePeriod>{ data($insuranceProduct/ns3:overridePrice/ns3:assignedProductOverridePeriod) }</ns0:assignedProductOverridePeriod>
                                                            </ns0:overridePrice>
                                                     else "" 
                                                    }
                                                    <ns0:assignedProductBillingFreq>{ data($insuranceProduct/ns3:assignedProductBillingFreq) }</ns0:assignedProductBillingFreq>
                                                    <ns0:isCrossCharged>{ data($insuranceProduct/ns3:isCrossCharged) }</ns0:isCrossCharged>
                                                </ns0:insuranceProduct>
                                         else ""
                                        }
                                        {
                                         if(data($item/ns3:chargeableDeliveryOptions))then
                                            <ns0:chargeableDeliveryOptions>
                                                    <ns0:deliveryDate>{ data($item/ns3:chargeableDeliveryOptions/ns3:deliveryDate) }</ns0:deliveryDate>
                                                    <ns0:despatchDate>{ data($item/ns3:chargeableDeliveryOptions/ns3:despatchDate) }</ns0:despatchDate>
                                                    <ns0:timeslot>{ data($item/ns3:chargeableDeliveryOptions/ns3:timeslot) }</ns0:timeslot>
                                                </ns0:chargeableDeliveryOptions>
                                         else ""
                                        } 
                                    </ns0:item>
                            }
                            <ns0:vatExclusivePrice>{ data($package/ns3:vatExclusivePrice) }</ns0:vatExclusivePrice>
                        </ns0:package>
                }
                <ns0:VATReceiptRequired>{ data($utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:orderDetails/ns3:VATReceiptRequired) }</ns0:VATReceiptRequired>
            </ns0:orderDetails>
            {
            let $oneOffPaymentDetails:= $utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:oneOffPaymentDetails
            return
             if(data($oneOffPaymentDetails))then
               <ns0:oneOffPaymentDetails>
                        <ns0:paymentMethod>{ data($oneOffPaymentDetails/ns3:paymentMethod) }</ns0:paymentMethod>
                        {
                         if(data($oneOffPaymentDetails/ns3:cardNumber))then
                            <ns0:cardNumber>{ data($oneOffPaymentDetails/ns3:cardNumber) }</ns0:cardNumber>
                         else ""
                        } 
                        {
                         if(data($oneOffPaymentDetails/ns3:cardDetails))then
                            <ns0:cardDetails>
                                    <ns0:cardHolderName>{ data($oneOffPaymentDetails/ns3:cardDetails/ns3:cardHolderName) }</ns0:cardHolderName>
                                    <ns0:expiryDate>{ data($oneOffPaymentDetails/ns3:cardDetails/ns3:expiryDate) }</ns0:expiryDate>
                                    {
                                     if(data($oneOffPaymentDetails/ns3:cardDetails/ns3:issueNumber))then
                                       <ns0:issueNumber>{ data($oneOffPaymentDetails/ns3:cardDetails/ns3:issueNumber) }</ns0:issueNumber>
                                     else ""
                                    }
                                    <ns0:cardType>{ data($oneOffPaymentDetails/ns3:cardDetails/ns3:cardType) }</ns0:cardType>
                                    {
                                     if(data($oneOffPaymentDetails/ns3:cardDetails/ns3:houseNameOrNum))then
                                        <ns0:houseNameOrNum>{ data($oneOffPaymentDetails/ns3:cardDetails/ns3:houseNameOrNum) }</ns0:houseNameOrNum>
                                     else ""
                                    }
                                    {
                                     if(data($oneOffPaymentDetails/ns3:cardDetails/ns3:postCode))then
                                        <ns0:postCode>{ data($oneOffPaymentDetails/ns3:cardDetails/ns3:postCode) }</ns0:postCode>
                                     else ""
                                    }
                                </ns0:cardDetails>
                         else "" 
                        }
                        {
                         if(data($oneOffPaymentDetails/ns3:paymentSettledDate))then
                            <ns0:paymentSettledDate>{ data($oneOffPaymentDetails/ns3:paymentSettledDate) }</ns0:paymentSettledDate>
                         else ""
                        }
                        {
                         if(data($oneOffPaymentDetails/ns3:billingAccountNumber))then
                            <ns0:billingAccountNumber>{ data($oneOffPaymentDetails/ns3:billingAccountNumber) }</ns0:billingAccountNumber>
                         else ""
                        }
                    </ns0:oneOffPaymentDetails>
             else "" 
            }
            {
             let $deliveryDetails:= $utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:deliveryDetails
             return
             if(data($deliveryDetails))then
                <ns0:deliveryDetails>
                        <ns0:name>{ data($deliveryDetails/ns3:name) }</ns0:name>
                        <ns0:basicAddress>
                            {
                             if(data($deliveryDetails/ns3:basic_address/@houseNameOrNumber))then
                                <ns0:addressLine1>{ data($deliveryDetails/ns3:basic_address/@houseNameOrNumber) }</ns0:addressLine1>
                             else ""
                            }
                            {
                             if(data($deliveryDetails/ns3:basic_address/@street))then
                                <ns0:addressLine2>{ data($deliveryDetails/ns3:basic_address/@street) }</ns0:addressLine2>
                             else ""
                            }
                            {
                             if(data($deliveryDetails/ns3:basic_address/@city))then
                                <ns0:addressLine3>{ data($deliveryDetails/ns3:basic_address/@city) }</ns0:addressLine3>
                             else ""
                            }
                            {
                             if(data($deliveryDetails/ns3:basic_address/@county))then
                                <ns0:addressLine4>{ data($deliveryDetails/ns3:basic_address/@county) }</ns0:addressLine4>
                             else "" 
                            }
                            {
                            if(data($deliveryDetails/ns3:basic_address/@country)=data($configData/countryNamePolitical))then
                            <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                            else ""
                            }
                            <ns0:postCode>{ data($deliveryDetails/ns3:basic_address/@postCode) }</ns0:postCode>
                        </ns0:basicAddress>
                        {
                         if(data($deliveryDetails/ns3:companyName))then
                            <ns0:companyName>{ data($deliveryDetails/ns3:companyName) }</ns0:companyName>
                         else ""
                        }
                        {
                         if(data($deliveryDetails/ns3:phone))then
                            <ns0:phone>{ data($deliveryDetails/ns3:phone) }</ns0:phone>
                         else ""
                        }
                        {
                         if(data($deliveryDetails/ns3:fax))then
                            <ns0:fax>{ data($deliveryDetails/ns3:fax) }</ns0:fax>
                         else ""
                        }
                        {
                         if(data($deliveryDetails/ns3:shippingMethod))then
                            <ns0:shippingMethod>{ data($deliveryDetails/ns3:shippingMethod) }</ns0:shippingMethod>
                         else "" 
                        }
                    </ns0:deliveryDetails>
             else "" 
            }
            {
             let $credit_check_info:= $utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:credit_check_info
             return
             if(data($credit_check_info))then
                <ns0:creditCheckInfo>
                        {
                         if($credit_check_info/ns3:previousAddress)then
                            <ns0:previousAddress>
                                    {
                                     if(data($credit_check_info/ns3:previousAddress/ns3:addressStatus))then
                                        <ns0:addressStatus>{ data($credit_check_info/ns3:previousAddress/ns3:addressStatus) }</ns0:addressStatus>
                                     else ""
                                    }
                                    <ns0:basicAddress>
                                        {
                                         if(data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@houseNameOrNumber))then
                                            <ns0:addressLine1>{ data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@houseNameOrNumber) }</ns0:addressLine1>
                                         else ""
                                        }
                                        {
                                         if(data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@street))then
                                            <ns0:addressLine2>{ data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@street) }</ns0:addressLine2>
                                         else ""
                                        }
                                        {
                                        if(data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@city))then
                                            <ns0:addressLine3>{ data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@city) }</ns0:addressLine3>
                                         else ""
                                        }
                                        {
                                         if(data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@county))then
                                            <ns0:addressLine4>{ data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@county) }</ns0:addressLine4>
                                         else "" 
                                        }
                                        {
                                         if(data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@country)=data($configData/countryNamePolitical))then
                                         	<ns0:country>{ data($configData/countryNameGeographical)}</ns0:country>
                                         else ""
                                        }
                                        <ns0:postCode>{ data($credit_check_info/ns3:previousAddress/ns3:basicAddress/@postCode) }</ns0:postCode>
                                    </ns0:basicAddress>
                                </ns0:previousAddress>
                         else "" 
                        }
                        <ns0:legalEntityAddress>
                            <ns0:legalEntityName>{ data($credit_check_info/ns3:legalEntityAddress/ns3:legalEntityName) }</ns0:legalEntityName>
                            <ns0:basicAddress>
                                {
                                 if(data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@houseNameOrNumber))then
                                    <ns0:addressLine1>{ data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@houseNameOrNumber) }</ns0:addressLine1>
                                 else ""
                                }
                                {
                                 if(data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@street))then
                                    <ns0:addressLine2>{ data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@street) }</ns0:addressLine2>
                                 else "" 
                                }
                                {
                                 if(data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@city))then
                                    <ns0:addressLine3>{ data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@city) }</ns0:addressLine3>
                                 else ""
                                }
                                {
                                 if(data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@county))then
                                    <ns0:addressLine4>{ data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@county) }</ns0:addressLine4>
                                 else ""
                                }
                                {
                                 if(data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@country)=data($configData/countryNamePolitical))then
                                	<ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                                else ""
                                }
                                <ns0:postCode>{ data($credit_check_info/ns3:legalEntityAddress/ns3:basicAddress/@postCode) }</ns0:postCode>
                            </ns0:basicAddress>
                        </ns0:legalEntityAddress>
                        <ns0:creditCheckDetails>
                            {
                             if(data($credit_check_info/ns3:creditCheckDetails/ns3:status))then
                                <ns0:status>{ data($credit_check_info/ns3:creditCheckDetails/ns3:status) }</ns0:status>
                             else ""
                            }
                            {
                             if(data($credit_check_info/ns3:creditCheckDetails/ns3:vetNumber))then
                                <ns0:vetNumber>{ data($credit_check_info/ns3:creditCheckDetails/ns3:vetNumber) }</ns0:vetNumber>
                             else ""
                            }
                            {
                             if(data($credit_check_info/ns3:creditCheckDetails/ns3:score))then
                                <ns0:score>{ data($credit_check_info/ns3:creditCheckDetails/ns3:score) }</ns0:score>
                             else ""
                            }
                            {
                            if(data($credit_check_info/ns3:creditCheckDetails/ns3:lastCheckDate))then
                               <ns0:lastCheckDate>{ data($credit_check_info/ns3:creditCheckDetails/ns3:lastCheckDate) }</ns0:lastCheckDate>
                             else ""
                            }
                            {
                             if(data($credit_check_info/ns3:creditCheckDetails/ns3:creditClassId))then
                                <ns0:creditClassId>{ xs:integer( data($credit_check_info/ns3:creditCheckDetails/ns3:creditClassId) ) }</ns0:creditClassId>
                             else ""
                            }
                        </ns0:creditCheckDetails>
                    </ns0:creditCheckInfo>
             else "" 
            }
            {
                for $recurringPaymentdetails in $utilGetOrderDetails_2Response/ns3:orderDetailsResponse/ns3:recurringPaymentdetails
                return
                    <ns0:recurringPaymentdetails>
                        {
                         if(data($recurringPaymentdetails/ns3:cardNumber))then
                            <ns0:cardNumber>{ data($recurringPaymentdetails/ns3:cardNumber) }</ns0:cardNumber>
                         else ""
                        } 
                        {
                         if(data($recurringPaymentdetails/ns3:cardDetails))then
                            <ns0:cardDetails>
                                    <ns0:cardHolderName>{ data($recurringPaymentdetails/ns3:cardDetails/ns3:cardHolderName) }</ns0:cardHolderName>
                                    <ns0:expiryDate>{ data($recurringPaymentdetails/ns3:cardDetails/ns3:expiryDate) }</ns0:expiryDate>
                                    {
                                     if(data($recurringPaymentdetails/ns3:cardDetails/ns3:issueNumber))then
                                        <ns0:issueNumber>{ data($recurringPaymentdetails/ns3:cardDetails/ns3:issueNumber) }</ns0:issueNumber>
                                     else ""
                                    }
                                    <ns0:cardType>{ data($recurringPaymentdetails/ns3:cardDetails/ns3:cardType) }</ns0:cardType>
                                    {
                                     if(data($recurringPaymentdetails/ns3:cardDetails/ns3:houseNameOrNum))then
                                        <ns0:houseNameOrNum>{ data($recurringPaymentdetails/ns3:cardDetails/ns3:houseNameOrNum) }</ns0:houseNameOrNum>
                                     else "" 
                                    }
                                    {
                                     if(data($recurringPaymentdetails/ns3:cardDetails/ns3:postCode))then
                                       <ns0:postCode>{ data($recurringPaymentdetails/ns3:cardDetails/ns3:postCode) }</ns0:postCode>
                                     else ""
                                    }
                                </ns0:cardDetails>
                         else ""
                        } 
                        <ns0:accountNumber>{ data($recurringPaymentdetails/ns3:accountNumber) }</ns0:accountNumber>
                        {
                         if($recurringPaymentdetails/ns3:bankDetails)then
                            <ns0:bankDetails>
                                    <ns0:userAccountNumber>{ data($recurringPaymentdetails/ns3:bankDetails/@userAccountNumber) }</ns0:userAccountNumber>
                                    {
                                     if(data($recurringPaymentdetails/ns3:bankDetails/@bankAccountNumber))then
                                        <ns0:bankAccountNumber>{ data($recurringPaymentdetails/ns3:bankDetails/@bankAccountNumber) }</ns0:bankAccountNumber>
                                     else ""
                                    } 
                                    <ns0:bankSortCode>{ data($recurringPaymentdetails/ns3:bankDetails/@bankCode) }</ns0:bankSortCode>
                                    <ns0:bankAccountHolder>{ data($recurringPaymentdetails/ns3:bankDetails/@bankAccountHolder) }</ns0:bankAccountHolder>
                                </ns0:bankDetails>
                         else "" 
                        }
                        <ns0:paymentMethod>{ data($recurringPaymentdetails/ns3:paymentMethod) }</ns0:paymentMethod>
                        {
                         if(data($recurringPaymentdetails/ns3:bmcFailureReason))then
                            <ns0:bmcFailureReason>{ data($recurringPaymentdetails/ns3:bmcFailureReason) }</ns0:bmcFailureReason>
                         else ""
                        }
                        {
                         if(data($recurringPaymentdetails/ns3:billStyle))then
                           <ns0:billStyle>
                                    {
                                     if(data($recurringPaymentdetails/ns3:billStyle/ns3:isBillItemised))then
                                        <ns0:isBillItemised>{ data($recurringPaymentdetails/ns3:billStyle/ns3:isBillItemised) }</ns0:isBillItemised>
                                     else ""
                                    }
                                    {
                                     if(data($recurringPaymentdetails/ns3:billStyle/ns3:isPaperBill))then
                                       <ns0:isPaperBill>{ data($recurringPaymentdetails/ns3:billStyle/ns3:isPaperBill) }</ns0:isPaperBill>
                                     else "" 
                                    }
                                </ns0:billStyle>
                         else ""
                        }
                    </ns0:recurringPaymentdetails>
            }
	    </ns0:getOrderDetails_2Response>
};

declare variable $utilGetOrderDetails_2Response as element(ns3:utilGetOrderDetails_2Response) external;
declare variable $configData as element(*) external;

xf:UtilGetOrderDetails_2RSToGetOrderDetails_2RS($utilGetOrderDetails_2Response,
    $configData)