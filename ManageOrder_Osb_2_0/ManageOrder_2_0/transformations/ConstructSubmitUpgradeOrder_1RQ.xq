(:: pragma bea:global-element-parameter parameter="$submitUpgradeOrder_1" element="ns1:submitUpgradeOrder_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilSubmitUpgradeOrder" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 			# Change Description # :)
(: 14/09/2011 		2.0.0 		Namratha 			Initial version :)
(: 03/05/2012 		2.0.1 		Dinsa Devassy 		Conversion of DeliveryContactNumber to localformat :)
(:                                                  and updated Address Mapping for OATC CCS Upgrade Shop Project	 :)
(: 03/07/2012 		2.0.2 		Dinsa Devassy	 	Added StoreDetails complex element in submitUpgradeOrder operation for Click and Collect project phase2 :)
(: 18/01/2013 		3.0.1 		Deepthi Narayan		Added elements related to CCA details as part of project 76 :)
(: 26/07/2013 		3.0.2 		Ravichandran R		'Title' field in "CCACustomerDetailsType" has been made optional :)
(: 06/08/2013 		3.0.3 		Ravichandran R		Added "advancedEntitlement" element as part of project 76 :)
(: 06/08/2013 		3.0.4 		Ravichandran R		Added "companionHeader" element as part of O2-Refresh project :)
(: 19/09/2013 		3.0.5 		Deepthi Narayan		Added "isPreOrder" element as part of SmartPhone project :)
(: 20/01/2014       3.0.6       Rani Eshwar         Added "externalPaymentId" element as part of E-Commerce Shop-CPSR integration-Phase 2 Project :)
(: 25/09/2014       3.0.7       Dolly K             Added "orderCollectionDetails" element as part of click and collect now project :)
(: 27/06/2016       3.0.8       Chandrakala S       Added "upgradePromotionsTaken","applicationDetails" and companionHeader  details as part of Refresh Buy Out  project :)
(: 13/10/2016       3.0.9       Meghana P K         Added "upgradeRecycleDetails" as part of Enhanced Recycle  project :)
(: 15/09/2017       3.0.10      Megha N             Added "refreshFinalPayment" as part of Refresh Evoloution project :)
(: 27/09/2017       3.0.11      Megha N             Added "upgradeCustomerPromotions" details and "promotionId" element as part of Promotions And Airtime Discounts project :)
(: 28/08/2018       3.1.11       Meghana K R         Added mapping for elements under CCADetails and documentation as part of IDD Phase 2 project :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructSubmitUpgradeOrder_1RQ/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns4 ="http://soa.o2.co.uk/pscommonpostpaydata_2";

declare function xf:ConstructSubmitUpgradeOrder_1RQ($submitUpgradeOrder_1 as element(ns1:submitUpgradeOrder_1),
	$cardCv2Value as element(*) ,$countryNamePolitical as element(*),$configXML as element(*),
	 $cardIssuer as xs:string,$header as element(*))
    as element() {
      <ns0:companionMessage>
	        <ns0:utilSubmitUpgradeOrder>
	        	<ns2:companionHeader>

                    {
                    	if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:channel)) then
                            <ns2:channel>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:channel) }</ns2:channel>
                            else 
                             <ns2:channel>{ data($header/ns3:applicationID) }</ns2:channel> 
                    }
                    
                    {
                    	if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:system)) then
                            <ns2:system>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:system) }</ns2:system>
                            else ''
                             
                    }
                    
                     {
                    	if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:storeType)) then
                            <ns2:storeType>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:storeType) }</ns2:storeType>
                            else ''
                             
                    }
                    
                     {
                    	if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:retailerId)) then
                            <ns2:retailerId>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:retailerId) }</ns2:retailerId>
                            else ''
                             
                    }
                    
                    {
                        if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:userId)) then
                            <ns2:userId>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:userId) }</ns2:userId>
                    	else if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
                    		<ns2:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') }</ns2:userId>
                    	else ''
                    }
                    
                    {
                    	if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:appName)) then
                            <ns2:appName>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:appName) }</ns2:appName>
                            else ''
                             
                    }
                    
                    {
                    	if(data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:posBusinessUnit)) then
                            <ns2:posBusinessUnit>{ data($submitUpgradeOrder_1/ns1:applicationDetails/ns4:posBusinessUnit) }</ns2:posBusinessUnit>
                            else ''
                             
                    }
                    
						 <ns2:versionId>{ data($configXML/version) }</ns2:versionId>
                        
                    {
                    	if(data($header/ns3:SOATransactionID)) then
                    		<ns2:replyKey>{ data($header/ns3:SOATransactionID) }</ns2:replyKey>
                    	else ''
                    }
     </ns2:companionHeader>
	            <ns0:upgradeOrderHeader>
	                <ns2:orderNumber>{ data($submitUpgradeOrder_1/ns1:orderNumber) }</ns2:orderNumber>
	                <ns2:upgradeMSISDN>{ fn:replace(data($submitUpgradeOrder_1/ns1:upgradeMsisdn),"^44","0") }</ns2:upgradeMSISDN>
	                <ns2:customerNumber>{ data($submitUpgradeOrder_1/ns1:customerNumber) }</ns2:customerNumber>
	                {
	                	if(data($submitUpgradeOrder_1/ns1:orderTimeStamp)) then
	                		<ns2:orderTimestamp>{ data($submitUpgradeOrder_1/ns1:orderTimeStamp) }</ns2:orderTimestamp>
	                	else 
	                		<ns2:orderTimestamp>{fn:current-dateTime() }</ns2:orderTimestamp>
	                }
	                {
                    if(data($submitUpgradeOrder_1/ns1:isPreOrder))then
                        <ns2:isPreOrder>{ data($submitUpgradeOrder_1/ns1:isPreOrder) }</ns2:isPreOrder>
                        else ""
                }
	            </ns0:upgradeOrderHeader>
	            {
	                let $sourceDetails := $submitUpgradeOrder_1/ns1:sourceDetails
	                return
	                    <ns0:upgradeOrderSourceDetails>
	                        <ns2:orderMethod>{ data($sourceDetails/ns1:orderMethod) }</ns2:orderMethod>
	                        <ns2:partner>{ data($sourceDetails/ns1:partner) }</ns2:partner>
	                        <ns2:owningBusinessDivision>{ data($sourceDetails/ns1:owningBusinessDivision) }</ns2:owningBusinessDivision>
	                        <ns2:sourceOfSale>{ data($sourceDetails/ns1:sourceOfSale) }</ns2:sourceOfSale>
	                        {
	                           if(data($sourceDetails/ns1:posBusinessUnit)) then
	                           <ns2:posBusinessUnit>{ data($sourceDetails/ns1:posBusinessUnit) }</ns2:posBusinessUnit>
	                           else ""
	                        }
	                        {
	                            if(data($sourceDetails/ns1:salesPerson)) then
	                               <ns2:salesPerson>{ data($sourceDetails/ns1:salesPerson) }</ns2:salesPerson>
	                             else ""
	                        }
	                        {
	                           if(data($sourceDetails/ns1:salesManager)) then
	                                <ns2:salesManager>{ data($sourceDetails/ns1:salesManager) }</ns2:salesManager>
	                           else ""
	                        }
	                        {
	                            if(data($sourceDetails/ns1:upgradeProof)) then
	                            	<ns0:upgradeProofs>
		                            	<ns2:idType>{ data($sourceDetails/ns1:upgradeProof/ns1:id) }</ns2:idType>
		                                <ns2:idValue>{ data($sourceDetails/ns1:upgradeProof/ns1:idValue) }</ns2:idValue>
	                            	</ns0:upgradeProofs>
	                            else ""
	                        }
	                        {
	                            if(data($sourceDetails/ns1:callContactId)) then
	                          		 <ns2:callContactID>{ data($sourceDetails/ns1:callContactId) }</ns2:callContactID>
	                          	else ""
	                        }
	                        {
	                            if(data($sourceDetails/ns1:discountMatrixId)) then
	                                  <ns2:discountMatrixId>{ data($sourceDetails/ns1:discountMatrixId) }</ns2:discountMatrixId>
	                            else ""
	                        }
	                    </ns0:upgradeOrderSourceDetails>
	            }
	       {
	       if(data($submitUpgradeOrder_1/ns1:initialPaymentDetails))then
	      <ns0:upgradeInitialPaymentDetails>
	      {
	      
	      let $paymentThroughCard := $submitUpgradeOrder_1/ns1:initialPaymentDetails/ns1:paymentThroughCard
	      let $cardDetails:= $paymentThroughCard/ns1:cardDetails
	      let $paymentDetails := $paymentThroughCard/ns1:paymentDetails
	      return
	        	if(data($paymentThroughCard)) then
	        	<ns0:initialPaymentDetailsForUpgradeUsingCard>
      	              {
      	           
      	            
                          if(($paymentThroughCard/ns1:cardToken)and($paymentThroughCard/ns1:externalPaymentId))then
                          
      	                   <ns2:cardToken>{ data($paymentThroughCard/ns1:cardToken) }</ns2:cardToken> union
      	                   <ns2:paymentReferenceNumber>{ data($paymentThroughCard/ns1:paymentReference) }</ns2:paymentReferenceNumber>union
      	                	<ns2:externalPaymentId>{data($paymentThroughCard/ns1:externalPaymentId)}</ns2:externalPaymentId> 
      	    else  if(($paymentThroughCard/ns1:cardToken)) then
      	                   <ns2:cardToken>{ data($paymentThroughCard/ns1:cardToken) }</ns2:cardToken> union
      	                   <ns2:paymentReferenceNumber>{ data($paymentThroughCard/ns1:paymentReference) }</ns2:paymentReferenceNumber>
	             	  else
	             	  <ns0:upgradeOrderCardDetails>
	             	          	<ns2:cardNumber>{ data($cardDetails/ns1:cardNumber) }</ns2:cardNumber>
		                       		 {
		                               if( data($cardDetails/ns1:cardCV2)) then      
		                                 	<ns2:cardCV2>{ data($cardDetails/ns1:cardCV2) }</ns2:cardCV2>
		                               else 
		                                   <ns2:cardCV2>{data($cardCv2Value)}</ns2:cardCV2>
		                              }
		                              <ns2:cardExpiryDate>{ data($cardDetails/ns1:cardExpiryDate) }</ns2:cardExpiryDate>
		                              <ns2:cardType>{ xs:string( data($cardDetails/ns1:cardType) ) }</ns2:cardType>
		                              <ns2:cardHolderName>{ data($cardDetails/ns1:cardHolderName) }</ns2:cardHolderName>
		                              {
		                                   if(data($cardDetails/ns1:cardIssueDate)) then
		                                     <ns2:cardIssueDate>{ data($cardDetails/ns1:cardIssueDate) }</ns2:cardIssueDate>
		                                    else ""
		                              }
		                              {
		                                   if(data($cardDetails/ns1:cardIssueNumber)) then
		                                           <ns2:cardIssueNumber>{ data($cardDetails/ns1:cardIssueNumber) }</ns2:cardIssueNumber>
		                                  	else ""
		                               }
		                              <ns2:postcode>{ data($cardDetails/ns1:postCode) }</ns2:postcode>
		                              <ns2:houseNameOrNumber>{ data($cardDetails/ns1:houseNameOrNumber) }</ns2:houseNameOrNumber>
		                              <ns2:cardIssuer>{ $cardIssuer}</ns2:cardIssuer>
		                    		  
	             				</ns0:upgradeOrderCardDetails> 
	             				union 
	             		        <ns0:upgradeOrderPaymentDetails>
	             		         	<ns2:paymentAuthStatus>{ data($paymentDetails/ns1:paymentAuthStatus) }</ns2:paymentAuthStatus>
	             		         				{
		                                            if(data($paymentDetails/ns1:authorisationRespCode)) then
		                                            <ns2:authorisationRespCode>{ data($paymentDetails/ns1:authorisationRespCode) }</ns2:authorisationRespCode>
		                                            else ""
		                                        }
		                                        {
		                                           	if($paymentDetails/ns1:authorisationRespMessage) then
		                                            <ns2:authorisationRespMessage>{ data($paymentDetails/ns1:authorisationRespMessage) }</ns2:authorisationRespMessage>
		                                            else ""
		                                        }
		                                        {
		                                           if($paymentDetails/ns1:authorisationCode) then
		                                           <ns2:authorisationCode>{ data($paymentDetails/ns1:authorisationCode) }</ns2:authorisationCode>
		                                           else ""
		                                        }
		                                        {
		                                           if(data($paymentDetails/ns1:authMessage)) then
		                                            <ns2:authMessage>{ data($paymentDetails/ns1:authMessage) }</ns2:authMessage>
		                                           else ""
		                                        }
		                                        {
		                                            if(data($paymentDetails/ns1:buynetId)) then
		                                           	<ns2:buynetId>{ data($paymentDetails/ns1:buynetId) }</ns2:buynetId>
		                                           	else ""
		                                        }
		                                        {
		                                           if($paymentDetails/ns1:settlementRespCode) then
		                                           <ns2:settlementRespCode>{ data($paymentDetails/ns1:settlementRespCode) }</ns2:settlementRespCode>
		                                           else ""
		                                        }
		                                        {
		                                            if(data($paymentDetails/ns1:cv2AvsCode)) then
		                                            <ns2:cv2AvsCode>{ data($paymentDetails/ns1:cv2AvsCode) }</ns2:cv2AvsCode>
		                                            else ""
		                                        }
		                                        {
		                                            if(data($paymentDetails/ns1:cv2AvsAction)) then
		                                            <ns2:cv2AvsAction>{ data($paymentDetails/ns1:cv2AvsAction) }</ns2:cv2AvsAction>
		                                            else ""
		                                        }
	             		        </ns0:upgradeOrderPaymentDetails>
                           }                              
	                       </ns0:initialPaymentDetailsForUpgradeUsingCard> 
	                      
	         else 
	         <ns0:initialPaymentDetailsForUpgradeAccountToChargeTo>
	          { 
	            let $paymentThroughAccount := $submitUpgradeOrder_1/ns1:initialPaymentDetails/ns1:paymentThroughAccount
	         	 return
			          if(data($paymentThroughAccount/ns1:chargeToMainAccount)) then
			              <ns2:chargeToMainAccount>{ data($paymentThroughAccount/ns1:chargeToMainAccount) }</ns2:chargeToMainAccount>
			          else
			              <ns2:chargeToCrossChargeAccount>{ data($paymentThroughAccount/ns1:accountToBeChargedTo) }</ns2:chargeToCrossChargeAccount>
			   }
	          </ns0:initialPaymentDetailsForUpgradeAccountToChargeTo>
	}
	 <ns2:paymentMoney>{ data($submitUpgradeOrder_1/ns1:initialPaymentDetails/ns1:paymentAmount) }</ns2:paymentMoney>       
	 </ns0:upgradeInitialPaymentDetails>
	 else ""
	 }
	 
	 {
            if(data($submitUpgradeOrder_1/ns1:upgradeDocumentation))then
			<ns0:upgradeDocumentation>
			{
            if(data($submitUpgradeOrder_1/ns1:upgradeDocumentation/ns1:insProdInfoDoc))then
			<ns0:upgradeInsuranceDocumentation>
			{
			for $insProdInfoDocDetails in $submitUpgradeOrder_1/ns1:upgradeDocumentation/ns1:insProdInfoDoc/ns1:insProdInfoDocDetails
                                        return
                                       
									<ns0:upgradeInsProdInfoDoc>
                                                <ns2:IPIDType>{ data($insProdInfoDocDetails/ns1:IPIDType) }</ns2:IPIDType>
                                                <ns2:signatureStatus>{ data($insProdInfoDocDetails/ns1:signatureStatus) }</ns2:signatureStatus>
												{
												if(data($insProdInfoDocDetails/ns1:documentSignedTimestamp))then
												
												<ns2:documentSignedTimestamp>{ data($insProdInfoDocDetails/ns1:documentSignedTimestamp) }</ns2:documentSignedTimestamp>
												else""
												}
									</ns0:upgradeInsProdInfoDoc>
									
												}
												
									<ns2:IPIDDurableMediumType>{ data($submitUpgradeOrder_1/ns1:upgradeDocumentation/ns1:insProdInfoDoc/ns1:IPIDDurableMedium)}</ns2:IPIDDurableMediumType>
									</ns0:upgradeInsuranceDocumentation>
									 else ""
                                    }
									</ns0:upgradeDocumentation>
									else ""
									}
			
	 
	 
	            {
	                let $orderTotalDetails := $submitUpgradeOrder_1/ns1:orderTotalDetails
	                return
	                    <ns0:upgradeOrderTotalDetails>
	                        <ns2:vatTotal>{ data($orderTotalDetails/ns1:vatTotal) }</ns2:vatTotal>
	                        <ns2:vatCodeDescription>{ data($orderTotalDetails/ns1:vatCodeDescription) }</ns2:vatCodeDescription>
	                        <ns2:vatReceiptRequired>{ data($orderTotalDetails/ns1:vatReceiptRequired) }</ns2:vatReceiptRequired>
	                        <ns2:vatExclusiveTotalPrice>{ data($orderTotalDetails/ns1:vatExclusiveTotalPrice) }</ns2:vatExclusiveTotalPrice>
	                        <ns2:total>{ data($orderTotalDetails/ns1:total) }</ns2:total>
	                    </ns0:upgradeOrderTotalDetails>
	            }
	            {
	                let $upgradeDiscounts := $submitUpgradeOrder_1/ns1:upgradeDiscounts
	                return
	                    <ns0:upgradeDiscounts>
	                        <ns2:upgradeDiscountApplicable>{ data($upgradeDiscounts/ns1:upgradeDiscountApplicable) }</ns2:upgradeDiscountApplicable>
	                        <ns2:upgradeDiscountActual>{ data($upgradeDiscounts/ns1:upgradeDiscountActual) }</ns2:upgradeDiscountActual>
	                    </ns0:upgradeDiscounts>
	            }
	            {
	            let $upgradeCCADetails :=$submitUpgradeOrder_1/ns1:CCADetails
	            return
                if(data($upgradeCCADetails))then
                    <ns0:upgradeCCADetails>
                        <ns2:CCANumber>{ data($upgradeCCADetails/ns1:CCANumber) }</ns2:CCANumber>
                        {
                            let $CCAFinancialDetails := $upgradeCCADetails/ns1:CCAFinancialDetails
                            return
                                <ns0:upgradeCCAFinancials>
                                    <ns2:hardwareDescription>{ data($CCAFinancialDetails/ns1:hardwareDescription) }</ns2:hardwareDescription>
                                    <ns2:hardwareRRP>{ xs:int( data($CCAFinancialDetails/ns1:hardwareRRP) ) }</ns2:hardwareRRP>
                                    <ns2:downPayment>{ data($CCAFinancialDetails/ns1:downPayment) }</ns2:downPayment>
                                    <ns2:installment>{ xs:int( data($CCAFinancialDetails/ns1:instalment) ) }</ns2:installment>
                                    {
                                        if(data($CCAFinancialDetails/ns1:refreshFinalPayment))then
                                            <ns2:finalPayment>{ xs:int(data($CCAFinancialDetails/ns1:refreshFinalPayment) ) }</ns2:finalPayment>
                                         else ""
                                    }
                                    <ns2:term>{ xs:int( data($CCAFinancialDetails/ns1:term) ) }</ns2:term>
                                    <ns2:totalCredit>{ data($CCAFinancialDetails/ns1:totalCredit) }</ns2:totalCredit>
                                    {
                                        if(data($CCAFinancialDetails/ns1:tariffDiscount))then
                                            <ns2:tariffDiscount>{ data($CCAFinancialDetails/ns1:tariffDiscount) }</ns2:tariffDiscount>
                                         else ""
                                    }
                                     
                                    {
                        if(data($CCAFinancialDetails/ns1:discretionaryDiscount))then
                            <ns2:discretionaryDiscount>{ data($CCAFinancialDetails/ns1:discretionaryDiscount) }</ns2:discretionaryDiscount>
                         else ""
                             }
                                </ns0:upgradeCCAFinancials>
                        }
                        {
                            let $CCACustomerDetails := $upgradeCCADetails/ns1:CCACustomerDetails
                            return
                                <ns0:upgradeCCACustomerDetails>
                                	{
                                		if(data($CCACustomerDetails/ns1:title)) then
                                    		<ns2:partyTitle>{ data($CCACustomerDetails/ns1:title) }</ns2:partyTitle>
                                    	else ''
                                    }
                                    <ns2:partyForename>{ data($CCACustomerDetails/ns1:forename) }</ns2:partyForename>
                                    <ns2:partySurname>{ data($CCACustomerDetails/ns1:lastname) }</ns2:partySurname>
                                    
                                    {
                                       if(data($CCACustomerDetails/ns1:addressHouseName))then
                                            <ns2:addressHouseName>{ data($CCACustomerDetails/ns1:addressHouseName) }</ns2:addressHouseName>
                                       else ""
                                    }
                                    
                                    
                                    {
                                       if(data($CCACustomerDetails/ns1:addressHouseNumber))then
                                            <ns2:addressHouseNumber>{ data($CCACustomerDetails/ns1:addressHouseNumber) }</ns2:addressHouseNumber>
                                       else ""
                                    }
                                    <ns2:address1stLine>{ data($CCACustomerDetails/ns1:address1stLine) }</ns2:address1stLine>
                                    {
                                        if(data($CCACustomerDetails/ns1:address2ndLine))then
                                            <ns2:address2ndLine>{ data($CCACustomerDetails/ns1:address2ndLine) }</ns2:address2ndLine>
                                        else ""
                                    }
                                    {
                                       if(data($CCACustomerDetails/ns1:address3rdLine))then
                                            <ns2:address3rdLine>{ data($CCACustomerDetails/ns1:address3rdLine) }</ns2:address3rdLine>
                                        else ""
                                    }
                                    {
                                        if(data($CCACustomerDetails/ns1:address4thLine))then
                                            <ns2:address4thLine>{ data($CCACustomerDetails/ns1:address4thLine) }</ns2:address4thLine>
                                        else ""
                                    }
                                    <ns2:addressPostCode>{ data($CCACustomerDetails/ns1:postCode) }</ns2:addressPostCode>
                                    <ns2:postalCountry>{ data($CCACustomerDetails/ns1:postalCountry) }</ns2:postalCountry>
                                </ns0:upgradeCCACustomerDetails>
                        }
                        {
                            let $CCA := $upgradeCCADetails/ns1:CCA
                            return
                                <ns0:upgradeConsumerCreditAgreement>
                                    <ns2:fileContent>{ data($CCA/ns4:fileContent) }</ns2:fileContent>
                                    <ns2:fileType>{ data($CCA/ns4:fileType) }</ns2:fileType>
                                    {
                                        if(data($CCA/ns4:fileName))then
                                            <ns2:fileName>{ data($CCA/ns4:fileName) }</ns2:fileName>
                                         else ""
                                    }
                                    {
                                        if(data($CCA/ns4:signatureStatus))then
                                            <ns2:signatureStatus>{ data($CCA/ns4:signatureStatus) }</ns2:signatureStatus>
                                         else
										 <ns2:signatureStatus>{ data($configXML/signatureStatus) }</ns2:signatureStatus>
                                    }
									{
                                        if(data($CCA/ns4:documentSignedTimestamp))then
                                            <ns2:documentSignedTimestamp>{ data($CCA/ns4:documentSignedTimestamp) }</ns2:documentSignedTimestamp>
                                         else ""
                                    }
                                </ns0:upgradeConsumerCreditAgreement>
                        }
                    </ns0:upgradeCCADetails>
                    
                  else ""
            }
            {	
            	if($submitUpgradeOrder_1/ns1:upgradeEntitlementDetails) then
                for $upgradeEntitlementDetails in $submitUpgradeOrder_1/ns1:upgradeEntitlementDetails
                return
                	if($upgradeEntitlementDetails/ns1:advancedEntitlement) then                        
                      let $advancedEntitlement := $upgradeEntitlementDetails/ns1:advancedEntitlement
                      return
                        <ns0:upgradeEntitlementDetails>
                            <ns0:advancedEntitlement>
                                <ns2:upgradeEntitlementReference>{ data($advancedEntitlement/ns1:upgradeEntitlementReference) }</ns2:upgradeEntitlementReference>
                                <ns2:upgradeEntitlementOverrideApplied>{ data($advancedEntitlement/ns1:upgradeEntitlementOverrideApplied) }</ns2:upgradeEntitlementOverrideApplied>
                                {
                                if(data($advancedEntitlement/ns1:isPaymentTaken)) then
                                	<ns2:isPaymentTaken>{ data($advancedEntitlement/ns1:isPaymentTaken) }</ns2:isPaymentTaken>
                                else ''
                                }
                                {
                                if(data($advancedEntitlement/ns1:CCASettlementAmount))  then
                                	<ns2:CCASettlementAmount>{ data($advancedEntitlement/ns1:CCASettlementAmount) }</ns2:CCASettlementAmount>
                                else if(data($advancedEntitlement/ns1:earlyUpgradeOffered) and data($advancedEntitlement/ns1:earlyUpgradeTaken)) then                                	
                                	<ns2:earlyUpgradeOffered>{ data($advancedEntitlement/ns1:earlyUpgradeOffered) }</ns2:earlyUpgradeOffered> union
                                	<ns2:earlyUpgradeTaken>{ data($advancedEntitlement/ns1:earlyUpgradeTaken) }</ns2:earlyUpgradeTaken> 
                                else ''
                                 }     
                                 	{
                                    	if(data($advancedEntitlement/ns1:earlyUpgradeOffered) and data($advancedEntitlement/ns1:earlyUpgradeTaken) and data($advancedEntitlement/ns1:earlyUpgradeFee)) then
                                    	  <ns2:earlyUpgradeFee>{ data($advancedEntitlement/ns1:earlyUpgradeFee) }</ns2:earlyUpgradeFee>
                                        else ''
                                    }
                                	
                                	
                            </ns0:advancedEntitlement>
                           </ns0:upgradeEntitlementDetails>
                    
                    else
                    	<ns0:upgradeEntitlementDetails>
                        <ns2:upgradeEntitlementOverrideApplied>{ data($upgradeEntitlementDetails/ns1:upgradeEntitlementOverrideApplied) }</ns2:upgradeEntitlementOverrideApplied> 
                        <ns2:earlyUpgradeOffered>{ data($upgradeEntitlementDetails/ns1:earlyUpgradeOffered) }</ns2:earlyUpgradeOffered> 
                        <ns2:earlyUpgradeTaken>{ data($upgradeEntitlementDetails/ns1:earlyUpgradeTaken) }</ns2:earlyUpgradeTaken> 
                       	{
	                       	if(data($upgradeEntitlementDetails/ns1:earlyUpgradeFee)) then
	                       		<ns2:earlyUpgradeFee>{ data($upgradeEntitlementDetails/ns1:earlyUpgradeFee) }</ns2:earlyUpgradeFee> 
	                        else ""
                        }
                        {
	                        if(data($upgradeEntitlementDetails/ns1:earlyUpgradeReference)) then
	                        <ns2:earlyUpgradeReference>{ data($upgradeEntitlementDetails/ns1:earlyUpgradeReference) }</ns2:earlyUpgradeReference>
	                   		else " "
                   		}
                   
                   	</ns0:upgradeEntitlementDetails>
                else ""
            }
	            {
	                for $saleableProducts in $submitUpgradeOrder_1/ns1:saleableProducts
	                return
	                    <ns0:upgradeSaleProd>
	                        <ns2:saleableProductId>{ data($saleableProducts/ns1:saleableProductId) }</ns2:saleableProductId>
	                        <ns2:saleableProductName>{ data($saleableProducts/ns1:saleableProductName) }</ns2:saleableProductName>
	                        <ns2:saleableProductPrice>{ data($saleableProducts/ns1:saleableProductPrice) }</ns2:saleableProductPrice>
	                        <ns2:saleableProductOriginalPrice>{ data($saleableProducts/ns1:saleableProductOriginalPrice) }</ns2:saleableProductOriginalPrice>
	                        {
	                           if(data($saleableProducts/ns1:systemSuggestedDiscountPrice)) then
	                           	 <ns2:systemSuggestedDiscountPrice>{ data($saleableProducts/ns1:systemSuggestedDiscountPrice) }</ns2:systemSuggestedDiscountPrice>
	                           else ""
	                        }
	                        {
	                            if(data($saleableProducts/ns1:overridePriceDescription)) then
	                             <ns2:overridePriceDescription>{ data($saleableProducts/ns1:overridePriceDescription) }</ns2:overridePriceDescription>
	                            else ""
	                        }
	                        <ns2:vatRate>{ data($saleableProducts/ns1:vatRate) }</ns2:vatRate>
	                        <ns2:vatAmount>{ data($saleableProducts/ns1:vatAmount) }</ns2:vatAmount>
	                        <ns2:vatExclusivePrice>{ data($saleableProducts/ns1:vatExclusivePrice) }</ns2:vatExclusivePrice>
	                       	<ns0:upgradeAssignedProducts>
	                     
	                       	 {
		                       		for $accessory in $saleableProducts/ns1:assignedProducts/ns1:accessory
	                                  return
	                            
			                       	<ns0:upgradeACC>
		                               <ns2:productId>{ data($accessory/ns1:productId) }</ns2:productId>
		                               <ns2:productName>{ data($accessory/ns1:productName) }</ns2:productName>
		                               {
		                                  if(data($accessory/ns1:dispatcherDetails)) then
		                                  <ns0:dispatcherDetails>
		                                     <ns2:skuId>{ data($accessory/ns1:dispatcherDetails/ns1:skuId) }</ns2:skuId>
		                                      <ns2:skuName>{ data($accessory/ns1:dispatcherDetails/ns1:skuName) }</ns2:skuName>
		                                      {
		                                        if(data($accessory/ns1:dispatcherDetails/ns1:risk)) then
		                                           <ns2:risk>{ data($accessory/ns1:dispatcherDetails/ns1:risk) }</ns2:risk>
		                                         else " "
		                                      }
		                                 </ns0:dispatcherDetails>
		                                  else " "
		                                }
		                               </ns0:upgradeACC>
			                     }
	                       	 {
	                       		 if(data($saleableProducts/ns1:assignedProducts/ns1:adjustment)) then
	                       		 let $adjustment:= $saleableProducts/ns1:assignedProducts/ns1:adjustment
	                             return
	                       		 <ns0:upgradeADJ>
	                       		 		<ns2:productId>{ data($adjustment/ns1:productId) }</ns2:productId>
	                                    <ns2:productName>{ data($adjustment/ns1:productName) }</ns2:productName>
	                                    <ns2:creditOrDebit>{ data($adjustment/ns1:creditOrDebit) }</ns2:creditOrDebit>
	                                    <ns2:orderAdjustmentReason>{ data($adjustment/ns1:orderAdjustmentReason) }</ns2:orderAdjustmentReason>
	                                    <ns2:adjustmentCircumstances>{ data($adjustment/ns1:adjustmentCircumstances) }</ns2:adjustmentCircumstances>
	                                    <ns2:adjustmentAmount>{xs:integer(data($adjustment/ns1:adjustmentAmount))*10 }</ns2:adjustmentAmount>
	                       		 </ns0:upgradeADJ>
	                       		else ""
	                       	 }
	                       	 {
	                                if(data($saleableProducts/ns1:assignedProducts/ns1:chargeableDeliveryOption)) then
	                                let $chargeableDeliveryOption :=$saleableProducts/ns1:assignedProducts/ns1:chargeableDeliveryOption
	                               	return
		                                <ns0:upgradeCDO>
		                                    <ns2:productId>{ data($chargeableDeliveryOption/ns1:productId) }</ns2:productId>
		                                    <ns2:productName>{ data($chargeableDeliveryOption/ns1:productName) }</ns2:productName>
		                                </ns0:upgradeCDO>
	                                else ""
	                         }	
	                       	 {
	                       		 if(data($saleableProducts/ns1:assignedProducts/ns1:handset)) then
	                       		 let $handset :=$saleableProducts/ns1:assignedProducts/ns1:handset
	                       		 return
		                       		 <ns0:upgradeHAN>
		                                                <ns2:productId>{ data($handset/ns1:productId) }</ns2:productId>
		                                                <ns2:productName>{ data($handset/ns1:productName) }</ns2:productName>
		                                                <ns2:handsetMake>{ data($handset/ns1:handsetMake) }</ns2:handsetMake>
		                                                <ns2:handsetModel>{ data($handset/ns1:handsetModel) }</ns2:handsetModel>
		                                                {
		                                                 let $dispatcherDetails := $handset/ns1:dispatcherDetails
			                                             return
		                                               		 if(data($handset/ns1:imei))then
		                                                		<ns2:imei>{ data($handset/ns1:imei) }</ns2:imei>
		                                                	else 
			                                                 <ns0:dispatcherDetails>
			                                                        
			                                                            <ns2:skuId>{ data($dispatcherDetails/ns1:skuId) }</ns2:skuId>
			                                                            <ns2:skuName>{ data($dispatcherDetails/ns1:skuName) }</ns2:skuName>
			                                                            {
			                                                               if(data($dispatcherDetails/ns1:risk)) then
			                                                                <ns2:risk>{ data($dispatcherDetails/ns1:risk) }</ns2:risk>
			                                                               else ""
			                                                            }
			                                                   </ns0:dispatcherDetails>
		                                                 }
		                                                 {
		                                                 if(data($handset/ns1:CCANumber))then
		                                                 <ns2:CCANumber>{ data($handset/ns1:CCANumber) }</ns2:CCANumber>
		                                                 else ""
		                                                 }
		                             </ns0:upgradeHAN>
	                             else ""
	                       	 }	
	                        {
	                       	for $literature in $saleableProducts/ns1:assignedProducts/ns1:literature
	                       	return
	                       	<ns0:upgradeLIT>
	                       	 	<ns2:productId>{ data($literature/ns1:productId) }</ns2:productId>
	                             <ns2:productName>{ data($literature/ns1:productName) }</ns2:productName>
	                             {
										 if(data($literature/ns1:dispatcherDetails)) then
	                                     let $dispatcherDetails:= $literature/ns1:dispatcherDetails
	                                     return
	                                     	<ns0:dispatcherDetails>
	                                        	<ns2:skuId>{ data($dispatcherDetails/ns1:skuId) }</ns2:skuId>
	                                            <ns2:skuName>{ data($dispatcherDetails/ns1:skuName) }</ns2:skuName>
	                                            {
	                                            	 if(data($dispatcherDetails/ns1:risk)) then
	                                                	  <ns2:risk>{ data($dispatcherDetails/ns1:risk) }</ns2:risk>
	                                                 else ""
	                                           }
	                                        </ns0:dispatcherDetails>
	                                     else ""
	                                   }
	                        </ns0:upgradeLIT>	
	                        }
	                        
	                       	{
	                         if(data($saleableProducts/ns1:assignedProducts/ns1:postpayInsurance)) then
	                            <ns0:upgradePOI>
	                             {
	                              if(data($saleableProducts/ns1:assignedProducts/ns1:postpayInsurance/ns1:cancelExistingInsurance) )then
	                                  <ns2:cancelExistingInsurance>{ data($saleableProducts/ns1:assignedProducts/ns1:postpayInsurance/ns1:cancelExistingInsurance) }</ns2:cancelExistingInsurance>
	                                 else (
	                                <ns2:productId>{ data($saleableProducts/ns1:assignedProducts/ns1:postpayInsurance/ns1:productId) }</ns2:productId> union
	                                <ns2:productName>{ data($saleableProducts/ns1:assignedProducts/ns1:postpayInsurance/ns1:productName) }</ns2:productName> union
	                                
	                              (
	                              for $saleableProducts in $saleableProducts/ns1:assignedProducts/ns1:postpayInsurance/ns1:overridePrice
	                               return	                       			
	                       			 <ns0:overridePrice>
	                       			        <ns2:assignedProductOverrideAmount>{ xs:int( data($saleableProducts/ns1:assignedProductOverrideAmount) ) }</ns2:assignedProductOverrideAmount>
			                                <ns2:assignedProductOverridePeriod>{ xs:int( data($saleableProducts/ns1:assignedProductOverridePeriod) ) }</ns2:assignedProductOverridePeriod>
			                        </ns0:overridePrice>                 
			                       
                                  
			                         )union
			                           <ns2:assignedProductBillingFreq>{ data($saleableProducts/ns1:assignedProducts/ns1:postpayInsurance/ns1:assignedProductBillingFrequency) }</ns2:assignedProductBillingFreq> 
			                          )
			                          }
	                           </ns0:upgradePOI>
	                     else ""   
	                        }
	                       	{
	                       	if(data($saleableProducts/ns1:assignedProducts/ns1:postpaySim)) then
		                       	let $postpaySim := $saleableProducts/ns1:assignedProducts/ns1:postpaySim
		                       	return
		                       	<ns0:upgradePOS>
		                                        <ns2:productId>{ data($postpaySim/ns1:productId) }</ns2:productId>
		                                        <ns2:productName>{ data($postpaySim/ns1:productName) }</ns2:productName>
		                                        {
		                                        if(data($postpaySim/ns1:ssn)) then
		                                        <ns2:ssn>{ data($postpaySim/ns1:ssn) }</ns2:ssn>
		                                        else 
		                                      	let $dispatcherDetails := $postpaySim/ns1:dispatcherDetails
		                                            return
		                                                <ns0:dispatcherDetails>
		                                                    <ns2:skuId>{ data($dispatcherDetails/ns1:skuId) }</ns2:skuId>
		                                                    <ns2:skuName>{ data($dispatcherDetails/ns1:skuName) }</ns2:skuName>
		                                                    {
		                                                        if(data($dispatcherDetails/ns1:risk)) then
		                                                        <ns2:risk>{ data($dispatcherDetails/ns1:risk) }</ns2:risk>
		                                                        else ""
		                                                    }
		                                                </ns0:dispatcherDetails>
		                                        }
		                                        <ns2:isAutoSimSwap>{ data($postpaySim/ns1:isAutoSimSwap) }</ns2:isAutoSimSwap>
		                        </ns0:upgradePOS>	   
	                        else ""         		
	                       	}	       
	                       	{
	                       	if(data($saleableProducts/ns1:assignedProducts/ns1:postpayTariff/ns1:productId))    then
	                       	let $postpayTariff := $saleableProducts/ns1:assignedProducts/ns1:postpayTariff
	                       	return   		
	                       	 <ns0:upgradePOT>
	                                        <ns2:productId>{ data($postpayTariff/ns1:productId) }</ns2:productId>
	                                        <ns2:productName>{ data($postpayTariff/ns1:productName) }</ns2:productName>
	                                        {
	                                            for $tariffModifier in $postpayTariff/ns1:tariffModifier
	                                            return
	                                            <ns0:upgradeTAM>
	                                                    <ns2:productId>{ data($tariffModifier/ns1:productId) }</ns2:productId>
	                                                    <ns2:productName>{ data($tariffModifier/ns1:productName) }</ns2:productName>
	                                                    {
															if(data($tariffModifier/ns1:promotionId))then
																<ns2:promotionId>{ data($tariffModifier/ns1:promotionId) } </ns2:promotionId>
															else ""
														}
	                                             </ns0:upgradeTAM>
	                                        }
	                       </ns0:upgradePOT>	
	                       	else ""
	                       	}
	                       	{
	                       	if(data($saleableProducts/ns1:assignedProducts/ns1:standardDeliveryCharge)) then
		                        let $standardDeliveryCharge := $saleableProducts/ns1:assignedProducts/ns1:standardDeliveryCharge
		                        return
		                        <ns0:upgradeSDC>
		                            <ns2:productId>{ data($standardDeliveryCharge/ns1:productId) }</ns2:productId>
		                            <ns2:productName>{ data($standardDeliveryCharge/ns1:productName) }</ns2:productName>
		                        </ns0:upgradeSDC>
	                        else ""
	                       }
	                       </ns0:upgradeAssignedProducts>
	                       	{
                                        for $upgradePromotions in $saleableProducts/ns1:upgradePromotions
                                        return
                                            <ns0:upgradePromotion>
                                                <ns2:promotionId>{ data($upgradePromotions/ns1:promotionId) }</ns2:promotionId>
                                            </ns0:upgradePromotion>
												
							}
	                   
	                    </ns0:upgradeSaleProd>
	            }
	            
	            {
	            	if(data($submitUpgradeOrder_1/ns1:deliveryDetails)) then
	            	let $deliveryDetails:= $submitUpgradeOrder_1/ns1:deliveryDetails
	                return
	                    <ns0:upgradeDeliveryDetails>
	                  	 	{
	                  	 		let $chargeableDeliveryOptionDetails := $deliveryDetails/ns1:chargeableDeliveryOptionDetails
	                            return
	                        	if(data($deliveryDetails/ns1:chargeableDeliveryOptionDetails)) then
			                         <ns0:chargeableDeliveryOption>
			                           			<ns2:deliveryDate>{ data($chargeableDeliveryOptionDetails/ns1:deliveryDate) }</ns2:deliveryDate>
			                                    <ns2:despatchDate>{ data($chargeableDeliveryOptionDetails/ns1:despatchDate) }</ns2:despatchDate>
			                                    <ns2:timeslot>{ data($chargeableDeliveryOptionDetails/ns1:timeSlot) }</ns2:timeslot>
			                         </ns0:chargeableDeliveryOption>
	                           else 
	                       			 <ns2:isStandardDeliveryOption>{ data($deliveryDetails/ns1:isStandardDeliveryOption) }</ns2:isStandardDeliveryOption>
	                        } 
	                        <ns2:destinationName>{ data($deliveryDetails/ns1:destinationName) }</ns2:destinationName>
	                        {
	                            if(data($deliveryDetails/ns1:deliveryContactNumber)) then
	                            	<ns2:deliveryContactNumber>{ replace(data($deliveryDetails/ns1:deliveryContactNumber),"^44","0") }</ns2:deliveryContactNumber>
	                            else ""
	                        }
							{
	                            let $deliveryAddress := $deliveryDetails/ns1:deliveryAddress
	                            let $organisationName := if(data($deliveryAddress/ns3:organisationName)) then data($deliveryAddress/ns3:organisationName) else "'"
	                            let $departmentName := if(data($deliveryAddress/ns3:departmentName)) then data($deliveryAddress/ns3:departmentName) else "'"
								let $subBuildingName := if(data($deliveryAddress/ns3:subBuildingName)) then data($deliveryAddress/ns3:subBuildingName) else "'"
								let $buildingName := if(data($deliveryAddress/ns3:buildingName)) then data($deliveryAddress/ns3:buildingName) else "'"
								let $buildingNumber := if(data($deliveryAddress/ns3:buildingNumber)) then data($deliveryAddress/ns3:buildingNumber) else "'"
							
								let $result1:= xf:appendWithCommaAndSpace(xf:appendWithCommaAndSpace(xf:appendWithCommaAndSpace(xf:appendWithCommaAndSpace($buildingNumber, $subBuildingName), $buildingName), $organisationName), $departmentName)
								
								
								let $dependentThoroughfareNameAndDescriptor := if(data($deliveryAddress/ns3:dependentThoroughfareNameAndDescriptor)) then data($deliveryAddress/ns3:dependentThoroughfareNameAndDescriptor) else "'"
								let $thoroughfareNameAndDescriptor := if(data($deliveryAddress/ns3:thoroughfareNameAndDescriptor)) then data($deliveryAddress/ns3:thoroughfareNameAndDescriptor) else "'"
								let $doubleDependentLocality := if(data($deliveryAddress/ns3:doubleDependentLocality)) then data($deliveryAddress/ns3:doubleDependentLocality) else "'"
								let $dependentLocality := if(data($deliveryAddress/ns3:dependentLocality)) then data($deliveryAddress/ns3:dependentLocality) else "'"
								let $result5:= xf:appendWithCommaAndSpace(xf:appendWithCommaAndSpace(xf:appendWithCommaAndSpace($dependentThoroughfareNameAndDescriptor, $thoroughfareNameAndDescriptor), $doubleDependentLocality), $dependentLocality)
								
	                            return
	                            <ns0:deliveryAddress>
	                            {
		                        	if(fn:string-length($result1)< 80 ) then
		                        	     if(data($result1)!= "'") then
		                            	 <ns2:houseNameOrNumber>{data($result1)}</ns2:houseNameOrNumber>
		                            	 else
		                            	  <ns2:houseNameOrNumber></ns2:houseNameOrNumber>
		                         else
		                         	<ns2:houseNameOrNumber>{fn:substring(data($result1),1,80)}</ns2:houseNameOrNumber>
		                        }
		                      	{
		                        	if(fn:string-length($result5)< 140) then
		                        	       if(data($result5)!= "'") then
		                           		<ns2:postalStreet>{data($result5)}</ns2:postalStreet>
		                           		else
		                           		<ns2:postalStreet></ns2:postalStreet>
	                               	else 
		                           		<ns2:postalStreet>{fn:substring(data($result5),1,140)}</ns2:postalStreet>
	                          	}
	                            <ns2:postalCity>{data($deliveryAddress/ns3:postTown)}</ns2:postalCity>
	                            {
	                                if(data($deliveryAddress/ns3:county)) then
	                                       	<ns2:postalCounty>{ data($deliveryAddress/ns3:county) }</ns2:postalCounty>
	                                else ""
	                             }
	                             {
	                                if( data($deliveryAddress/ns3:countryCode)=data($countryNamePolitical)) then
	                                    <ns2:postalCountry>{ data($deliveryAddress/ns3:countryCode) }</ns2:postalCountry>
	                                else 
	                                    <ns2:postalCountry>{data($countryNamePolitical)}</ns2:postalCountry>
	                             }
	                             {
	           							
		      						if(fn:contains(data($deliveryAddress/ns3:postCode),' ')or fn:string-length(data($deliveryAddress/ns3:postCode))<=3)then
		      							<ns2:postcode>{ data($deliveryAddress/ns3:postCode) }</ns2:postcode>
		    		 				else
			    						let $postCode:=fn:concat(fn:substring(data($deliveryAddress/ns3:postCode),1,fn:string-length(data($deliveryAddress/ns3:postCode))-3),' ',fn:substring(data($deliveryAddress/ns3:postCode),fn:string-length(data($deliveryAddress/ns3:postCode))-2,fn:string-length(data($deliveryAddress/ns3:postCode))))
			           		 			return
			           					<ns2:postcode>{ fn:upper-case($postCode) }</ns2:postcode>
		    					 }
	                             </ns0:deliveryAddress>
	                        }
	                        
	                        { if($deliveryDetails/ns1:storeDetails) then
	                        <ns0:storeDetails>
                                  <ns2:storeNumber>{data($deliveryDetails/ns1:storeDetails/ns1:storeNumber)}</ns2:storeNumber>
                                  <ns2:storeName>{data($deliveryDetails/ns1:storeDetails/ns1:storeName)}</ns2:storeName>
                           </ns0:storeDetails>
	                       else "" 
	                        }
	                    </ns0:upgradeDeliveryDetails>
	                  else ""
	            }
				{
				  	if(data($submitUpgradeOrder_1/ns1:creditCheckDetails))then
	                let $creditCheckDetails:= $submitUpgradeOrder_1/ns1:creditCheckDetails
	                return
	                    <ns0:creditCheckDetails>
	                        <ns0:creditCheckStatus>{ data($configXML/creditCheckstatusTypes/creditCheckstatusType[value=data($creditCheckDetails/ns1:status)]/status)  }</ns0:creditCheckStatus>
	                        {
	                            if(data($creditCheckDetails/ns1:vetNumber)) then
	                          	  <ns0:creditCheckVetNumber>{ data($creditCheckDetails/ns1:vetNumber) }</ns0:creditCheckVetNumber>
	                          	else ""
	                        }
	                        {
	                           if(data($creditCheckDetails/ns1:score)) then
	                            <ns0:creditCheckScore>{ data($creditCheckDetails/ns1:score) }</ns0:creditCheckScore>
	                           else ""
	                        }
	                        {
	                            if(data($creditCheckDetails/ns1:lastCheckDate)) then
	                           	 <ns0:creditCheckDate>{ data($creditCheckDetails/ns1:lastCheckDate) }</ns0:creditCheckDate>
	                           	else ""
	                        }
	                    </ns0:creditCheckDetails>
	               else ""
	            }
				{
	                if(data($submitUpgradeOrder_1/ns1:returnedLeaseDeviceDetails))then
	                let $returnedLeaseDeviceDetails := $submitUpgradeOrder_1/ns1:returnedLeaseDeviceDetails
	                return
	                    <ns0:returnedLeasedDevice>
	                        <ns2:handsetMake>{ data($returnedLeaseDeviceDetails/ns1:handsetMake) }</ns2:handsetMake>
	                        <ns2:handsetModel>{ data($returnedLeaseDeviceDetails/ns1:handsetModel) }</ns2:handsetModel>
	                        <ns2:imei>{ data($returnedLeaseDeviceDetails/ns1:imei) }</ns2:imei>
	                    </ns0:returnedLeasedDevice>
	                else " "
	            }
	            {
	            if($submitUpgradeOrder_1/ns1:updateAccountRecurringPaymentDetails)then
	              <ns0:updateAccountRecurringPaymentDetails>
                <ns0:accountDirectDebitDetails>
                    <ns2:userAccountNumber>{ data($submitUpgradeOrder_1/ns1:updateAccountRecurringPaymentDetails/ns1:userAccountNumber) }</ns2:userAccountNumber>
                    {
                        if(data($submitUpgradeOrder_1/ns1:updateAccountRecurringPaymentDetails/ns1:bankAccountNumber))then
                            <ns2:bankAccountNumber>{ data($submitUpgradeOrder_1/ns1:updateAccountRecurringPaymentDetails/ns1:bankAccountNumber) }</ns2:bankAccountNumber>
                         else ""
                    }
                    <ns2:bankSortCode>{ data($submitUpgradeOrder_1/ns1:updateAccountRecurringPaymentDetails/ns1:bankSortCode) }</ns2:bankSortCode>
                    <ns2:bankAccountName>{ data($submitUpgradeOrder_1/ns1:updateAccountRecurringPaymentDetails/ns1:bankAccountName) }</ns2:bankAccountName>
                </ns0:accountDirectDebitDetails>
            </ns0:updateAccountRecurringPaymentDetails>
            else ""
            }
	  
	  {
               if (($submitUpgradeOrder_1/ns1:upgradePromotionsTaken)) then
              for $upgradePromotionsTaken in $submitUpgradeOrder_1/ns1:upgradePromotionsTaken
              return
          <ns0:upgradePromotionsTaken>
			{
			if (data($upgradePromotionsTaken/ns1:upgradeInstantPromotions)) then
			<ns0:upgradeInstantPromotions>
			<ns2:promotionId>{data($upgradePromotionsTaken/ns1:upgradeInstantPromotions/ns1:promotionId)} </ns2:promotionId>
			</ns0:upgradeInstantPromotions>
				else
				<ns0:upgradeTargetedPromotions>
				<ns2:promotionToken>{data($upgradePromotionsTaken/ns1:upgradeTargetedPromotions/ns1:promotionToken)}</ns2:promotionToken>
				</ns0:upgradeTargetedPromotions>
				}
				
				{
				 let $handsetTradeInDetails := $upgradePromotionsTaken/ns1:handsetTradeInDetails
                 return
                                            
				if($handsetTradeInDetails) then
				
				<ns0:upgradeTradeInDetails>
				
				<ns2:handsetMake>{data($handsetTradeInDetails/ns1:handsetMake)}</ns2:handsetMake>
				<ns2:handsetModel>{data($handsetTradeInDetails/ns1:handsetModel)}</ns2:handsetModel>
				{
				if(data($handsetTradeInDetails/ns1:imei)) then
				<ns2:imei>{data($handsetTradeInDetails/ns1:imei)}</ns2:imei>
				else ""
				}
				
				{
				if(data($upgradePromotionsTaken/ns1:handsetTradeInDetails/ns1:tradeInAmount)) then
				<ns2:tradeInAmount>{data($upgradePromotionsTaken/ns1:handsetTradeInDetails/ns1:tradeInAmount)}</ns2:tradeInAmount>
				else ""
				}
				</ns0:upgradeTradeInDetails>
				
		else ""
		}
				</ns0:upgradePromotionsTaken>
				else ""
				}
				
(: 27/09/2017       3.0.11      Megha N             Added "upgradeCustomerPromotions" details and "promotionId" element as part of Promotions And Airtime Discounts project :) 

 		 {
               if (($submitUpgradeOrder_1/ns1:upgradeCustomerPromotions)) then


              for $upgradeCustomerPromotions in $submitUpgradeOrder_1/ns1:upgradeCustomerPromotions
              return


          <ns0:upgradeCustomerPromotion>

			
			<ns2:promotionToken>{data($upgradeCustomerPromotions/ns1:promotionToken)}</ns2:promotionToken>
			<ns2:promotionId>{data($upgradeCustomerPromotions/ns1:promotionId)} </ns2:promotionId>
			{
				 let $handsetTradeInDetails := $upgradeCustomerPromotions/ns1:handsetTradeInDetails
                 return
                                            
				if($handsetTradeInDetails) then
				
				<ns0:upgradeTradeInDetails>
				
				<ns2:handsetMake>{data($handsetTradeInDetails/ns1:handsetMake)}</ns2:handsetMake>
				<ns2:handsetModel>{data($handsetTradeInDetails/ns1:handsetModel)}</ns2:handsetModel>
				{
				if(data($handsetTradeInDetails/ns1:imei)) then
				<ns2:imei>{data($handsetTradeInDetails/ns1:imei)}</ns2:imei>
				else ""
				}
				
				{
				<ns2:tradeInAmount>{data($upgradeCustomerPromotions/ns1:handsetTradeInDetails/ns1:tradeInAmount)}</ns2:tradeInAmount>
				}
				</ns0:upgradeTradeInDetails>
				
				else ""
			}
				
			</ns0:upgradeCustomerPromotion>
				
				
				else ""			
  }
				
				{
				
if(data ($submitUpgradeOrder_1/ns1:upgradeRecycleDetails) )then 
for $upgradeRecycleDetails in $submitUpgradeOrder_1/ns1:upgradeRecycleDetails
return
 <ns0:upgradeDeviceRecycle>
 <ns0:upgradeDeviceDetails>
  <ns2:handsetMake>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:handsetMake) }</ns2:handsetMake>
  <ns2:handsetModel>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:handsetModel) }</ns2:handsetModel>
    {
		if (data($upgradeRecycleDetails/ns1:deviceDetails/ns1:imei))then
		<ns2:imei>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:imei) }</ns2:imei>
		else ""
	}
  <ns2:quotedValue>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:quotedValue) }</ns2:quotedValue>
    {
		if (data($upgradeRecycleDetails/ns1:deviceDetails/ns1:gradingReduction))then
		<ns2:gradingReduction>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:gradingReduction) }</ns2:gradingReduction>
		else ""
    }
    <ns2:itemTypeId>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:deviceTypeId) }</ns2:itemTypeId>
    {
		if (data($upgradeRecycleDetails/ns1:deviceDetails/ns1:deviceNetwork))then
		<ns2:deviceNetwork>{ data($upgradeRecycleDetails/ns1:deviceDetails/ns1:deviceNetwork) }</ns2:deviceNetwork>
		else ""
    }
   </ns0:upgradeDeviceDetails>
   
 <ns0:upgradeRecyclePaymentDetails>
  <ns2:recyclePaymentMethod>{ data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:paymentMethod) }</ns2:recyclePaymentMethod>
  
  {
	if (data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:paymentMethod)= data($configXML/recyclePaymentDetails/paymentMethod) and data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:recycleBACSDetails) ) then
	
	<ns0:upgradeRecycleBACSDetails>
	
			
	<ns2:userAccountNumber>{data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:recycleBACSDetails/ns1:userAccountNumber)}</ns2:userAccountNumber>
	{		
	 if($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:recycleBACSDetails/ns1:bankAccountNumber)then
                       
   <ns2:bankAccountNumber>{data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:recycleBACSDetails/ns1:bankAccountNumber)}</ns2:bankAccountNumber>
       else ""
    }
 
	<ns2:bankSortCode>{ data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:recycleBACSDetails/ns1:bankSortCode) }</ns2:bankSortCode>
	<ns2:bankAccountName>{ data($upgradeRecycleDetails/ns1:recyclePaymentDetails/ns1:recycleBACSDetails/ns1:bankAccountHolder) }</ns2:bankAccountName>
	
	
   </ns0:upgradeRecycleBACSDetails>
  
 else ""
} 
</ns0:upgradeRecyclePaymentDetails>
 </ns0:upgradeDeviceRecycle>
 else ""
 }  
	         {
                if(data($submitUpgradeOrder_1/ns1:orderCollectionDetails))then
                
                    <ns0:orderCollectionDetails>
                        <ns2:orderCollectionVerificationLevel>{ data($submitUpgradeOrder_1/ns1:orderCollectionDetails/ns1:orderCollectionVerificationLevel) }</ns2:orderCollectionVerificationLevel>
                    </ns0:orderCollectionDetails>
                    else ""
            }     
             </ns0:utilSubmitUpgradeOrder>
      
      </ns0:companionMessage>
};

declare function xf:appendWithCommaAndSpace($str1 as xs:string, $str2 as xs:string)
as xs:string {
	if ($str1!="'")then
		if ($str2!="'") then
			let $result:= fn:concat($str1, ", " ,$str2)
			return $result
		else
		let $result:= $str1
		return $result
	else if ($str2="'")then
	"'"
	else
	let $result:= $str2
		return $result
};

declare variable $submitUpgradeOrder_1 as element(ns1:submitUpgradeOrder_1) external;
declare variable $cardCv2Value as element(*) external;
declare variable $countryNamePolitical as element(*) external;
declare variable $configXML as element(*) external;
declare variable $cardIssuer as xs:string external;
declare variable $header as element(*) external;

xf:ConstructSubmitUpgradeOrder_1RQ($submitUpgradeOrder_1,$cardCv2Value,$countryNamePolitical,$configXML,$cardIssuer,$header)