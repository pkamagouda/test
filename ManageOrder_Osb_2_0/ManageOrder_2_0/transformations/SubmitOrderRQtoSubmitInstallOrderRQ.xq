(:: pragma bea:global-element-parameter parameter="$submitOrder" element="ns0:submitOrder" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:submitInstallOrder" location="../../NorthBoundInterfaces/submitinstallorderdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 29/03/2010 		2.0.0 		Amit Kumar 			Initial version :)
(: 19/05/2010 		2.0.1 		Shaik sadiq 		Added Default value for dateOfBirth :)
(: 25/05/2012 		2.0.2 		Dinsa Devassy 		Added mapping for the new element storeDetails as a part of  Click To Collect Project :)
(: 18/01/2013 		3.0.1 		Deepthi Narayan		Added elements related to CCA details as part of project 76 :)
(: 13/05/2013       3.0.2       Dinsa Devassy       Added cardReferenceDetails complex structure as a choice as a part of OATC Acquisition Shop project :)
(: 26/07/2013 		3.0.3 		Ravichandran R		'Title' field in "CCACustomerDetailsType" has been made optional :)
(: 20/09/2013 		3.0.4 		Deepthi Narayan		Added "isPreOrder" element as part of SmartPhone project :)
(: 25/09/2014       3.0.6       Dolly K             Added "orderCollectionDetails" element as part of click and collect now project :)
(: 9/12/2014        3.0.7       Subra Bose          Added mapping for the elements inside OrderHeader and  SaleableProducts as per ARShop Replacement project :)
(: 15/09/2017       3.0.8       Megha N             Added "refreshFinalPayment" element as part of Refresh Evolution project :)
(: 27/09/2017       3.0.9       Megha N             Added "promotionId" element as part of Promotions and Airtime Discount project :)
(: 12/04/2018       3.0.10      Kunal G             Added consentId and deprecated acceptO2Marketing & acceptOtherMarketing elements as part of GDPR project :)
(: 27/08/2018       3.1.11       Meghana K R         Added mapping for elements under CCADetails and documentation as part of IDD Phase 2 project :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/SubmitOrderRQtoSubmitInstallOrderRQ/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/submitinstallorderdata_1";
declare namespace ns2 = "http://soa.o2.co.uk/pscommonpostpaydata_2";

declare function xf:SubmitOrderRQtoSubmitInstallOrderRQ($submitOrder as element(ns0:submitOrder),
	$configData as element(*))
    as element(ns1:submitInstallOrder) {
        <ns1:submitInstallOrder>
            <ns1:orderHeader>
                <ns1:orderNumber>{ data($submitOrder/ns0:orderHeader/ns0:orderNumber) }</ns1:orderNumber>
                <ns1:orderPlacedByPartyReference>{ data($submitOrder/ns0:orderHeader/ns0:orderPlacedByPartyReference) }</ns1:orderPlacedByPartyReference>
                <ns1:legalEntityPartyReference>{ data($submitOrder/ns0:orderHeader/ns0:legalEntityPartyReference) }</ns1:legalEntityPartyReference>
                <ns1:orderTimestamp>{ data($submitOrder/ns0:orderHeader/ns0:orderTimestamp) }</ns1:orderTimestamp>
                {
                    if( data( $submitOrder/ns0:orderHeader/ns0:useValidateRules)) then
                        <ns1:useValidateRules>{ data($submitOrder/ns0:orderHeader/ns0:useValidateRules) }</ns1:useValidateRules>
                   	else 
                   		<ns1:useValidateRules>{ data($configData/useValidateRules) }</ns1:useValidateRules>
                }
                {
                    if(data($submitOrder/ns0:orderHeader/ns0:isPreOrder))then
                        <ns1:isPreOrder>{ data($submitOrder/ns0:orderHeader/ns0:isPreOrder) }</ns1:isPreOrder>
                        else ""
                }
                {
                if(data($submitOrder/ns0:orderHeader/ns0:isHardcopyRequested))then
                <ns1:isHardcopyRequested>{data($submitOrder/ns0:orderHeader/ns0:isHardcopyRequested)}</ns1:isHardcopyRequested>
                else""
                }
                {
                if(data($submitOrder/ns0:orderHeader/ns0:isVerifiedByOTAC))then
                <ns1:isVerifiedByOTAC>{data($submitOrder/ns0:orderHeader/ns0:isVerifiedByOTAC)}</ns1:isVerifiedByOTAC>
                else ""
                }
                
            </ns1:orderHeader>
            <ns1:orderSourceDetails>
                <ns1:orderMethod>{ data($submitOrder/ns0:orderSourceDetails/ns0:orderMethod) }</ns1:orderMethod>
                <ns1:partner>{ data($submitOrder/ns0:orderSourceDetails/ns0:partner) }</ns1:partner>
                <ns1:owningBusinessDivision>{ data($submitOrder/ns0:orderSourceDetails/ns0:owningBusinessDivision) }</ns1:owningBusinessDivision>
                <ns1:sourceOfSale>{ data($submitOrder/ns0:orderSourceDetails/ns0:sourceOfSale) }</ns1:sourceOfSale>
                {
                    if( data( $submitOrder/ns0:orderSourceDetails/ns0:posBusinessUnit)) then
                        <ns1:posBusinessUnit>{ data($submitOrder/ns0:orderSourceDetails/ns0:posBusinessUnit) }</ns1:posBusinessUnit>
                   	else ""
                }
                {
                    if( data( $submitOrder/ns0:orderSourceDetails/ns0:salesPerson)) then
                        <ns1:salesPerson>{ data($submitOrder/ns0:orderSourceDetails/ns0:salesPerson) }</ns1:salesPerson>
                   	else ""
                }
                {
                    if( data( $submitOrder/ns0:orderSourceDetails/ns0:salesManager)) then
                        <ns1:salesManager>{ data($submitOrder/ns0:orderSourceDetails/ns0:salesManager) }</ns1:salesManager>
                   	else ""
                }
                {
                    if( data( $submitOrder/ns0:orderSourceDetails/ns0:callContactID)) then
                        <ns1:callContactID>{ data($submitOrder/ns0:orderSourceDetails/ns0:callContactID) }</ns1:callContactID>
                   	else ""
                }
                {
                    if( data( $submitOrder/ns0:orderSourceDetails/ns0:csaId)) then
                        <ns1:csaId>{ data($submitOrder/ns0:orderSourceDetails/ns0:csaId) }</ns1:csaId>
                   	else ""
                }
                {
                    if( data( $submitOrder/ns0:orderSourceDetails/ns0:callTypeIndicator )) then
                        <ns1:callTypeIndicator>{ data($submitOrder/ns0:orderSourceDetails/ns0:callTypeIndicator) }</ns1:callTypeIndicator>
                  	else ""
                }
            </ns1:orderSourceDetails>
            {
            	let $initialPaymentDetails := $submitOrder/ns0:initialPaymentDetails
				return
				if (data($initialPaymentDetails))then
        	    	<ns1:initialPaymentDetails>
        	    	{
        	    		if ( data ($initialPaymentDetails/ns0:paymentByCard)) then
            	    		<ns1:paymentByCard>
            	    		{
            	    			if(fn:not(fn:exists($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardReferenceDetails/ns0:cardToken)) ) then
				              
				                <ns1:cardDetails>
    		    		        	<ns1:cardNumber>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardNumber) }</ns1:cardNumber>
        		        		    {	
        		        		    	if (data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardCV2)) then
        		        		    <ns1:cardCV2>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardCV2) }</ns1:cardCV2>
            		            		else ""
            		            	}
            		            	<ns1:cardExpiryDate>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardExpiryDate) }</ns1:cardExpiryDate>
		        		            <ns1:cardHolderName>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardHolderName) }</ns1:cardHolderName>
        		    		        {
                				    	if (data( $initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardIssueDate )) then
                                			<ns1:cardIssueDate>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardIssueDate) }</ns1:cardIssueDate>
                                		else ""
					            	}
            			        	{
				                    	if (data(  $initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardIssueNumber )) then
		                		        	<ns1:cardIssueNumber>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardIssueNumber) }</ns1:cardIssueNumber>
		                		       	else ""
				                   	}
        		                	<ns1:addressPostCode>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:addressPostCode) }</ns1:addressPostCode>
		                		    {
				                    	if (data(  $initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:addressHouseName )) then
		                		        	<ns1:addressHouseName>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:addressHouseName) }</ns1:addressHouseName>
		                		       	else ""
				                  	}
        				            {
                				    	if (data(  $initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:addressHouseNumber )) then
		                                	<ns1:addressHouseNumber>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
		                               	else ""
				                     }
        		                	<ns1:bankCardIssuer>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:bankCardIssuer) }</ns1:bankCardIssuer>
		                		</ns1:cardDetails>
                		  union
		                    	<ns1:paymentDetails>
		                    		<ns1:paymentAuthStatus>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:paymentAuthStatus) }</ns1:paymentAuthStatus>
			                        {
            			                if ( data( $initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authorisationRespCode )) then
                               		 		<ns1:authorisationRespCode>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authorisationRespCode) }</ns1:authorisationRespCode>
                               		 	else ""
			                        }
            			            {
                        			    if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authorisationRespMessage )) then
            		                    	<ns1:authorisationRespMessage>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authorisationRespMessage) }</ns1:authorisationRespMessage>
            		                    else ""
			                        }
            			            {
                        			    if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authorisationCode )) then
            			                    <ns1:authorisationCode>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authorisationCode) }</ns1:authorisationCode>
            			               	else ""
                        			}
			                        {
            			                if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authMessage)) then
                        			        <ns1:authMessage>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:authMessage) }</ns1:authMessage>
		                                else ""
        			                }
                        			{
			                            if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:buynetId)) then
            			                    <ns1:buynetId>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:buynetId) }</ns1:buynetId>
                        		        else ""
			                        }
            			            {
                        			    if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:settlementRespCode)) then
			                                <ns1:settlementRespCode>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:settlementRespCode) }</ns1:settlementRespCode>
            		                    else ""
                    			    }
                        			{
			                            if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:cv2AvsCode)) then
            			                    <ns1:cv2AvsCode>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:cv2AvsCode) }</ns1:cv2AvsCode>
                        		        else ""
			                        }
                        			{
			                            if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:cv2AvsAction)) then
            			                    <ns1:cv2AvsAction>{ data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:cv2AvsAction) }</ns1:cv2AvsAction>
                        			   	else ""
                        			}
                        			{
                        				if ( data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:threeDSecure)) then
                        					<ns1:threeDSecure>
                        						<ns1:verify>{data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:threeDSecure/ns2:verify)}</ns1:verify>
                        						{
                        							if (data ($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:threeDSecure/ns2:browser)) then
                        								<ns1:browser>
                        									<ns1:deviceCategory>{data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:threeDSecure/ns2:browser/ns2:deviceCategory)}</ns1:deviceCategory>
															<ns1:acceptHeaders>{data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:threeDSecure/ns2:browser/ns2:acceptHeaders)}</ns1:acceptHeaders>
															<ns1:userAgent>{data($initialPaymentDetails/ns0:paymentByCard/ns0:paymentDetails/ns0:threeDSecure/ns2:browser/ns2:userAgent)}</ns1:userAgent>
                        								</ns1:browser>
                        							else ""
                        						}
                        					</ns1:threeDSecure>
                        				else ""
                        			}
                    			</ns1:paymentDetails>
                    			else
                    
                      <ns1:cardReferenceDetails>
                                 <ns1:cardToken>{ data($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardReferenceDetails/ns0:cardToken) }</ns1:cardToken>
                                 <ns1:cardReferencePaymentId>{ data($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardReferenceDetails/ns0:cardReferencePaymentId) }</ns1:cardReferencePaymentId>
                                 {
                                     if(data($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardReferenceDetails/ns0:externalPaymentId))then
                                         <ns1:externalPaymentId>{ data($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardReferenceDetails/ns0:externalPaymentId) }</ns1:externalPaymentId>
                                     else ""
                                 }
                       </ns1:cardReferenceDetails>
                    			
                    		}
                		</ns1:paymentByCard>
                	else 
                		<ns1:paymentAgainstAccount>
                		{
                			if ( data ($initialPaymentDetails/ns0:paymentAgainstAccount/ns0:accountSetReference )) then
                    			<ns1:accountSetReference>{ data($initialPaymentDetails/ns0:paymentAgainstAccount/ns0:accountSetReference) }</ns1:accountSetReference>
                    		else
                    			<ns1:chargeToCrossChargeAccountReference>{ data($initialPaymentDetails/ns0:paymentAgainstAccount/ns0:chargeToCrossChargeAccountReference) }</ns1:chargeToCrossChargeAccountReference>
                    	}
                		</ns1:paymentAgainstAccount>
                	}
                		<ns1:paymentMoney>{ data($initialPaymentDetails/ns0:paymentMoney) }</ns1:paymentMoney>
            		</ns1:initialPaymentDetails>
            	else ""
            }
            {
                for $CCADetails in $submitOrder/ns0:CCADetails
                return
                    <ns1:CCADetails>
                        <ns1:CCANumber>{ data($CCADetails/ns0:CCANumber) }</ns1:CCANumber>
                        {
                            let $CCAFinancialDetails := $CCADetails/ns0:CCAFinancialDetails
                            return
                                <ns1:CCAFinancialDetails>
                                    <ns1:hardwareDescription>{ data($CCAFinancialDetails/ns0:hardwareDescription) }</ns1:hardwareDescription>
                                    <ns1:hardwareRRP>{ data($CCAFinancialDetails/ns0:hardwareRRP) }</ns1:hardwareRRP>
                                    <ns1:downPayment>{ data($CCAFinancialDetails/ns0:downPayment) }</ns1:downPayment>
                                    <ns1:instalment>{ data($CCAFinancialDetails/ns0:instalment) }</ns1:instalment>
                                     {
                                     if(data($CCAFinancialDetails/ns0:refreshFinalPayment))then
                                            <ns1:refreshFinalPayment>{ data($CCAFinancialDetails/ns0:refreshFinalPayment) }</ns1:refreshFinalPayment>
                                        else ""
                                     }
                                    <ns1:term>{ data($CCAFinancialDetails/ns0:term) }</ns1:term>
                                    <ns1:totalCredit>{ data($CCAFinancialDetails/ns0:totalCredit) }</ns1:totalCredit>
                                    {
                                       if(data($CCAFinancialDetails/ns0:tariffDiscount))then
                                            <ns1:tariffDiscount>{ data($CCAFinancialDetails/ns0:tariffDiscount) }</ns1:tariffDiscount>
                                        else ""
                                    }
                                     {
                                        if(data($CCAFinancialDetails/ns0:discretionaryDiscount))then
                                            <ns1:discretionaryDiscount>{ data($CCAFinancialDetails/ns0:discretionaryDiscount) }</ns1:discretionaryDiscount>
                                        else ""
                                     }
                                    
                                </ns1:CCAFinancialDetails>
                        }
                        {
                            let $CCACustomerDetails := $CCADetails/ns0:CCACustomerDetails
                            return
                                <ns1:CCACustomerDetails>
                                	{
                                		if(data($CCACustomerDetails/ns0:title)) then
                                    		<ns1:title>{ data($CCACustomerDetails/ns0:title) }</ns1:title>
                                    	else ''
                                    }
                                    <ns1:forename>{ data($CCACustomerDetails/ns0:forename) }</ns1:forename>
                                    <ns1:lastname>{ data($CCACustomerDetails/ns0:lastname) }</ns1:lastname>
                                    
                                    {
                                        if(data($CCACustomerDetails/ns0:addressHouseName))then
                                          <ns1:addressHouseName>{ data($CCACustomerDetails/ns0:addressHouseName) }</ns1:addressHouseName>
                                         else ""
                                    }
                                    
                                    
                                    
                                    {
                                        if(data($CCACustomerDetails/ns0:addressHouseNumber))then
                                            <ns1:addressHouseNumber>{ data($CCACustomerDetails/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                         else ""
                                    }
                                    <ns1:address1stLine>{ data($CCACustomerDetails/ns0:address1stLine) }</ns1:address1stLine>
                                    {
                                        if(data($CCACustomerDetails/ns0:address2ndLine))then
                                            <ns1:address2ndLine>{ data($CCACustomerDetails/ns0:address2ndLine) }</ns1:address2ndLine>
                                        else ""
                                    }
                                    {
                                        if(data($CCACustomerDetails/ns0:address3rdLine))then
                                            <ns1:address3rdLine>{ data($CCACustomerDetails/ns0:address3rdLine) }</ns1:address3rdLine>
                                        else ""
                                    }
                                    {
                                        if(data($CCACustomerDetails/ns0:address4thLine))then
                                            <ns1:address4thLine>{ data($CCACustomerDetails/ns0:address4thLine) }</ns1:address4thLine>
                                         else ""
                                    }
                                    <ns1:postCode>{ data($CCACustomerDetails/ns0:postCode) }</ns1:postCode>
                                    <ns1:postalCountry>{ data($CCACustomerDetails/ns0:postalCountry) }</ns1:postalCountry>
                                </ns1:CCACustomerDetails>
                        }
                        {
                            let $CCA := $CCADetails/ns0:CCA
                            return
                                <ns1:CCA>
                                    <ns2:fileContent>{ data($CCA/ns2:fileContent) }</ns2:fileContent>
                                    <ns2:fileType>{ data($CCA/ns2:fileType) }</ns2:fileType>
                                    {
                                        if(data($CCA/ns2:fileName))then
                                            <ns2:fileName>{ data($CCA/ns2:fileName) }</ns2:fileName>
                                        else ""
                                    }
                                     {
                                        if(data($CCA/ns2:signatureStatus))then
                                            <ns2:signatureStatus>{ data($CCA/ns2:signatureStatus) }</ns2:signatureStatus>
                                        else ""
                                       
                                    }
									 {
                                        if(data($CCA/ns2:documentSignedTimestamp))then
                                            <ns2:documentSignedTimestamp>{ data($CCA/ns2:documentSignedTimestamp) }</ns2:documentSignedTimestamp>
                                        else ""
                                    }
                                </ns1:CCA>
                        }
                    </ns1:CCADetails>
            }
            <ns1:totalOrderPriceDetails>
                <ns1:vatTotal>{ data($submitOrder/ns0:totalOrderPriceDetails/ns0:vatTotal) }</ns1:vatTotal>
                <ns1:vatCodeDescription>{ data($submitOrder/ns0:totalOrderPriceDetails/ns0:vatCodeDescription) }</ns1:vatCodeDescription>
                <ns1:vatReceiptRequired>{ data($submitOrder/ns0:totalOrderPriceDetails/ns0:vatReceiptRequired) }</ns1:vatReceiptRequired>
                <ns1:vatExclusiveTotalPrice>{ data($submitOrder/ns0:totalOrderPriceDetails/ns0:vatExclusiveTotalPrice) }</ns1:vatExclusiveTotalPrice>
                <ns1:grandTotal>{ data($submitOrder/ns0:totalOrderPriceDetails/ns0:grandTotal) }</ns1:grandTotal>
            </ns1:totalOrderPriceDetails>
            {
                for $saleableProducts in $submitOrder/ns0:saleableProducts
                return
                    <ns1:saleableProducts>
                        <ns1:saleableProductLineNumber>{ data($saleableProducts/ns0:saleableProductLineNumber) }</ns1:saleableProductLineNumber>
                        <ns1:saleableProductId>{ data($saleableProducts/ns0:saleableProductId) }</ns1:saleableProductId>
                        <ns1:saleableProductName>{ data($saleableProducts/ns0:saleableProductName) }</ns1:saleableProductName>
                        <ns1:saleableProductPrice>{ data($saleableProducts/ns0:saleableProductPrice) }</ns1:saleableProductPrice>
                        {
                        if(data($saleableProducts/ns0:saleableProductOriginalPrice))then
                        
                        <ns1:saleableProductOriginalPrice>{data($saleableProducts/ns0:saleableProductOriginalPrice)}</ns1:saleableProductOriginalPrice>
                        else ""
                        }
                       {
                       if(data($saleableProducts/ns0:systemSuggestedDiscountPrice))then
                       
                        <ns1:systemSuggestedDiscountPrice>{data($saleableProducts/ns0:systemSuggestedDiscountPrice)}</ns1:systemSuggestedDiscountPrice>
                      else ""
                       }
                       {
                       if(data($saleableProducts/ns0:overridePriceDescription))then
                       
                      <ns1:overridePriceDescription>{data($saleableProducts/ns0:overridePriceDescription)}</ns1:overridePriceDescription>
                       else ""
                       } <ns1:vatRate>{ data($saleableProducts/ns0:vatRate) }</ns1:vatRate>
                        <ns1:vatAmount>{ data($saleableProducts/ns0:vatAmount) }</ns1:vatAmount>
                        <ns1:vatExclusivePrice>{ data($saleableProducts/ns0:vatExclusivePrice) }</ns1:vatExclusivePrice>
                        {
                            if ( data( $saleableProducts/ns0:mobileAssignedProduct)) then
                                <ns1:mobileAssignedProduct>
                                    {
                                        for $accessory in $saleableProducts/ns0:mobileAssignedProduct/ns0:accessory
                                        return
                                            <ns1:accessory>
                                                <ns1:productId>{ data($accessory/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($accessory/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($accessory/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if ( data( $accessory/ns0:make )) then
                                                        <ns1:make>{ data($accessory/ns0:make) }</ns1:make>
													else ""                                                       
                                                }
                                                {
                                                    if ( data( $accessory/ns0:model )) then
                                                        <ns1:model>{ data($accessory/ns0:model) }</ns1:model>
                                                   	else ""
                                                }
                                                {
                                                	if ($accessory/ns0:skuDetailsWithSerialNumber)then
                                                    let $skuDetailsWithSerialNumber := $accessory/ns0:skuDetailsWithSerialNumber
                                                    return
                                                        <ns1:skuDetailsWithSerialNumber>
                                                            {
                                                                if (data( $skuDetailsWithSerialNumber/ns0:skuId )) then
                                                                    <ns1:skuId>{ data($skuDetailsWithSerialNumber/ns0:skuId) }</ns1:skuId>
                                                               	else ""
                                                            }
                                                            {
                                                                if (data( $skuDetailsWithSerialNumber/ns0:skuName )) then
                                                                    <ns1:skuName>{ data($skuDetailsWithSerialNumber/ns0:skuName) }</ns1:skuName>
                                                               	else ""
                                                            }
                                                            {
                                                                if (data( $skuDetailsWithSerialNumber/ns0:serialNumber )) then
                                                                    <ns1:serialNumber>{ data($skuDetailsWithSerialNumber/ns0:serialNumber) }</ns1:serialNumber>
                                                               	else ""
                                                            }
                                                        </ns1:skuDetailsWithSerialNumber>
                                                	else
                                                    let $dispatcherDetailsWithRisk := $accessory/ns0:dispatcherDetailsWithRisk
                                                    return
                                                        <ns1:dispatcherDetailsWithRisk>
                                                            <ns1:skuId>{ data($dispatcherDetailsWithRisk/ns0:skuId) }</ns1:skuId>
                                                            <ns1:skuName>{ data($dispatcherDetailsWithRisk/ns0:skuName) }</ns1:skuName>
                                                            {
                                                                if ( data ( $dispatcherDetailsWithRisk/ns0:risk )) then
                                                                    <ns1:risk>{ data($dispatcherDetailsWithRisk/ns0:risk) }</ns1:risk>
                                                               	else ""
                                                            }
                                                        </ns1:dispatcherDetailsWithRisk>
                                                }
                                                {
                                                    if ( data ( $accessory/ns0:orderProductPrice )) then
                                                        <ns1:orderProductPrice>{ data($accessory/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                   	else ""
                                                }
                                            </ns1:accessory>
                                    }
                                    {
                                       	if ( data ( $saleableProducts/ns0:mobileAssignedProduct/ns0:handset )) then
                                       	let $handset := $saleableProducts/ns0:mobileAssignedProduct/ns0:handset
                                        return
                                            <ns1:handset>
                                                <ns1:productId>{ data($handset/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($handset/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($handset/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                <ns1:handsetMake>{ data($handset/ns0:handsetMake) }</ns1:handsetMake>
                                                <ns1:handsetModel>{ data($handset/ns0:handsetModel) }</ns1:handsetModel>
                                                {
                                                    if ($handset/ns0:skuDetailsWithImei) then
                                                    let $skuDetailsWithImei := $handset/ns0:skuDetailsWithImei
                                                    return
                                                        <ns1:skuDetailsWithImei>
                                                            {
                                                                if ( data ($skuDetailsWithImei/ns0:skuId)) then
                                                                    <ns1:skuId>{ data($skuDetailsWithImei/ns0:skuId) }</ns1:skuId>
                                                               	else ""
                                                            }
                                                            {
                                                                if ( data ($skuDetailsWithImei/ns0:skuName)) then
                                                                    <ns1:skuName>{ data($skuDetailsWithImei/ns0:skuName) }</ns1:skuName>
                                                              	else ""
                                                            }
                                                            <ns1:imei>{ data($skuDetailsWithImei/ns0:imei) }</ns1:imei>
                                                        </ns1:skuDetailsWithImei>
                                                   	else
                                                    let $dispatcherDetailsWithRisk := $handset/ns0:dispatcherDetailsWithRisk
                                                    return
                                                        <ns1:dispatcherDetailsWithRisk>
                                                            <ns1:skuId>{ data($dispatcherDetailsWithRisk/ns0:skuId) }</ns1:skuId>
                                                            <ns1:skuName>{ data($dispatcherDetailsWithRisk/ns0:skuName) }</ns1:skuName>
                                                            {
                                                                if ( data ($dispatcherDetailsWithRisk/ns0:risk )) then
                                                                    <ns1:risk>{ data($dispatcherDetailsWithRisk/ns0:risk) }</ns1:risk>
                                                              	else ""
                                                            }
                                                        </ns1:dispatcherDetailsWithRisk>
                                                }
                                                {
                                                    if (data( $handset/ns0:orderProductPrice )) then
                                                        <ns1:orderProductPrice>{ data($handset/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                  	else ""
                                                }
                                                {
                                    			if(data($handset/ns0:CCANumber))then
                                       			<ns1:CCANumber>{ data($handset/ns0:CCANumber) }</ns1:CCANumber>
                                        		else ""
                                				}
                                            </ns1:handset>
                                     	else ""
                                    }
                                    {
                                        for $literature in $saleableProducts/ns0:mobileAssignedProduct/ns0:literature
                                        return
                                            <ns1:literature>
                                                <ns1:productId>{ data($literature/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($literature/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($literature/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if ($literature/ns0:skuDetails) then
                                                    let $skuDetails := $literature/ns0:skuDetails
                                                    return
                                                        <ns1:skuDetails>
                                                            {
                                                                if (data ($skuDetails/ns0:skuId)) then
                                                                    <ns1:skuId>{ data($skuDetails/ns0:skuId) }</ns1:skuId>
                                                               	else ""
                                                            }
                                                            {
                                                                if (data($skuDetails/ns0:skuName)) then
                                                                    <ns1:skuName>{ data($skuDetails/ns0:skuName) }</ns1:skuName>
                                                              	else ""
                                                            }
                                                        </ns1:skuDetails>
                                                   	else
                                                    let $dispatcherDetails := $literature/ns0:dispatcherDetails
                                                    return
                                                        <ns1:dispatcherDetails>
                                                            <ns1:skuId>{data($dispatcherDetails/ns0:skuId)}</ns1:skuId>
                                                            <ns1:skuName>{data($dispatcherDetails/ns0:skuName)}</ns1:skuName>
                                                        </ns1:dispatcherDetails>
                                                }
                                            </ns1:literature>
                                    }
                                    {
                                    	if (data ($saleableProducts/ns0:mobileAssignedProduct/ns0:postpaySim) ) then
                                        let $postpaySim := $saleableProducts/ns0:mobileAssignedProduct/ns0:postpaySim
                                        return
                                            <ns1:postpaySim>
                                                <ns1:productId>{ data($postpaySim/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($postpaySim/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($postpaySim/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if (data ($postpaySim/ns0:msisdn )) then
                                                        <ns1:msisdn>{ data($postpaySim/ns0:msisdn) }</ns1:msisdn>
                                                   	else ""
                                                }
                                                {
                                                    if (data ($postpaySim/ns0:migratePortInDetailsType))then
                                                    let $migratePortInDetailsType := $postpaySim/ns0:migratePortInDetailsType
                                                    return
                                                        <ns1:migratePortInDetailsType>
                                                        	{
                                                        		if (data ($migratePortInDetailsType/ns0:instantMigration)) then
                                                            		<ns1:instantMigration>{ data($migratePortInDetailsType/ns0:instantMigration) }</ns1:instantMigration>
                                                            	else                                                                
                                                                let $portIn := $migratePortInDetailsType/ns0:portIn
                                                                return
                                                                <ns1:portIn>
                                                                        <ns1:pac>{ data($portIn/ns0:pac) }</ns1:pac>
                                                                        <ns1:newMSISDN>{ data($portIn/ns0:newMSISDN) }</ns1:newMSISDN>
                                                                        {
                                                                            if (data( $portIn/ns0:pacExpiry)) then
                                                                                <ns1:pacExpiry>{ data($portIn/ns0:pacExpiry) }</ns1:pacExpiry>
                                                                           	else ""
                                                                        }
                                                                </ns1:portIn>
                                                         	}
                                                        </ns1:migratePortInDetailsType>
                                                  	else ""
                                                }
                                                {
                                                    if ($postpaySim/ns0:skuDetailsWithSsn) then
                                                    let $skuDetailsWithSsn := $postpaySim/ns0:skuDetailsWithSsn
                                                    return
                                                        <ns1:skuDetailsWithSsn>
                                                            {
                                                                if (data( $skuDetailsWithSsn/ns0:skuId )) then
                                                                    <ns1:skuId>{ data($skuDetailsWithSsn/ns0:skuId) }</ns1:skuId>
                                                               	else ""
                                                            }
                                                            {
                                                                if ( data ($skuDetailsWithSsn/ns0:skuName)) then
                                                                    <ns1:skuName>{ data($skuDetailsWithSsn/ns0:skuName) }</ns1:skuName>
                                                                else ""
                                                            }
                                                            <ns1:ssn>{ data($skuDetailsWithSsn/ns0:ssn) }</ns1:ssn>
                                                        </ns1:skuDetailsWithSsn>
                                                    else
                                                    let $dispatcherDetails := $postpaySim/ns0:dispatcherDetails
                                                    return
                                                        <ns1:dispatcherDetails>
                                                            <ns1:skuId>{ data($dispatcherDetails/ns0:skuId) }</ns1:skuId>
                                                            <ns1:skuName>{ data($dispatcherDetails/ns0:skuName) }</ns1:skuName>
                                                        </ns1:dispatcherDetails>
                                                }
                                                {
                                                    if ( data( $postpaySim/ns0:orderProductPrice )) then
                                                        <ns1:orderProductPrice>{ data($postpaySim/ns0:orderProductPrice) }</ns1:orderProductPrice>
													else ""
                                                }
                                                {
                                                    if ( data( $postpaySim/ns0:consentId )) then
                                                        <ns1:consentId>{ data($postpaySim/ns0:consentId) }</ns1:consentId>
													else ""
                                                }
                                            </ns1:postpaySim>
                                      	else ""
                                    }
                                    {
                                        if (data ($saleableProducts/ns0:mobileAssignedProduct/ns0:postpayTariff)) then
                                        let $postpayTariff := $saleableProducts/ns0:mobileAssignedProduct/ns0:postpayTariff
                                        return
                                            <ns1:postpayTariff>
                                                <ns1:productId>{ data($postpayTariff/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($postpayTariff/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($postpayTariff/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    for $tariffModifier in $postpayTariff/ns0:tariffModifier
                                                    return
                                                        <ns1:tariffModifier>
                                                            <ns1:productId>{ data($tariffModifier/ns0:productId) }</ns1:productId>
                                                            <ns1:productName>{ data($tariffModifier/ns0:productName) }</ns1:productName>
                                                            <ns1:assignedProductNumber>{ data($tariffModifier/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                            {
                                                                if (data( $tariffModifier/ns0:orderProductCharge)) then
                                                                    <ns1:orderProductCharge>{ data($tariffModifier/ns0:orderProductCharge) }</ns1:orderProductCharge>
                                                                else ""
                                                            }
                                                            {
                                                                if (data( $tariffModifier/ns0:promotionId)) then
                                                                    <ns1:promotionId>{ data($tariffModifier/ns0:promotionId) }</ns1:promotionId>
                                                                else ""
                                                            }
                                                        </ns1:tariffModifier>
                                                }
                                                {
                                                    if ( data($postpayTariff/ns0:orderProductCharge )) then
                                                        <ns1:orderProductCharge>{ data($postpayTariff/ns0:orderProductCharge) }</ns1:orderProductCharge>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $postpayTariff/ns0:contractTerm )) then
                                                        <ns1:contractTerm>{ data($postpayTariff/ns0:contractTerm) }</ns1:contractTerm>
                                                   	else ""
                                                }
                                            </ns1:postpayTariff>
                                       	else ""
                                    }
                                    {
                                    	if (data ($saleableProducts/ns0:mobileAssignedProduct/ns0:prepaySim)) then
                                        let $prepaySim := $saleableProducts/ns0:mobileAssignedProduct/ns0:prepaySim
                                        return
                                            <ns1:prepaySim>
                                                <ns1:productId>{ data($prepaySim/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($prepaySim/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($prepaySim/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if ( data( $prepaySim/ns0:msisdn)) then
                                                        <ns1:msisdn>{ data($prepaySim/ns0:msisdn) }</ns1:msisdn>
                                                   	else ""
                                                }
                                                {
                                                    if ($prepaySim/ns0:skuDetailsWithSsn) then
                                                    let $skuDetailsWithSsn := $prepaySim/ns0:skuDetailsWithSsn
                                                    return
                                                        <ns1:skuDetailsWithSsn>
                                                            {
                                                                if (data( $skuDetailsWithSsn/ns0:skuId )) then
                                                                    <ns1:skuId>{ data($skuDetailsWithSsn/ns0:skuId) }</ns1:skuId>
                                                               	else ""
                                                            }
                                                            {
                                                                if (data( $skuDetailsWithSsn/ns0:skuName)) then
                                                                    <ns1:skuName>{ data($skuDetailsWithSsn/ns0:skuName) }</ns1:skuName>
                                                              	else ""
                                                            }
                                                            <ns1:ssn>{ data($skuDetailsWithSsn/ns0:ssn) }</ns1:ssn>
                                                        </ns1:skuDetailsWithSsn>
                                                else
                                                	<ns1:dispatcherDetails>
                                                    	<ns1:skuId>{ data($prepaySim/ns0:dispatcherDetails/ns0:skuId) }</ns1:skuId>
	                                                    <ns1:skuName>{ data($prepaySim/ns0:dispatcherDetails/ns0:skuName) }</ns1:skuName>
    	                                            </ns1:dispatcherDetails>
                                             	}
                                                {
                                                    for $orderProductPrice in $prepaySim/ns0:orderProductPrice
                                                    return
                                                        <ns1:orderProductPrice>{ data($orderProductPrice) }</ns1:orderProductPrice>
                                                }
                                                {
                                                    if ( data( $prepaySim/ns0:consentId )) then
                                                        <ns1:consentId>{ data($prepaySim/ns0:consentId) }</ns1:consentId>
													else ""
                                                }
                                            </ns1:prepaySim>
                                      	else ""
                                    }
                                    {
                                    	if (data($saleableProducts/ns0:mobileAssignedProduct/ns0:prepayTariff)) then
                                        let $prepayTariff := $saleableProducts/ns0:mobileAssignedProduct/ns0:prepayTariff
                                        return
                                            <ns1:prepayTariff>
                                                <ns1:productId>{ data($prepayTariff/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($prepayTariff/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($prepayTariff/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if (data( $prepayTariff/ns0:orderProductPrice )) then
                                                        <ns1:orderProductPrice>{ data($prepayTariff/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                   	else ""
                                                }
                                            </ns1:prepayTariff>
                                      	else ""
                                    }
                                </ns1:mobileAssignedProduct>
                         	else ""
                        }
                        {
                        	if (data($saleableProducts/ns0:generalProducts)) then
                            let $generalProducts := $saleableProducts/ns0:generalProducts
                            return
                                <ns1:generalProducts>
                                    {
                                        if (data($generalProducts/ns0:chargeableDeliveryOption)) then
                                        let $chargeableDeliveryOption := $generalProducts/ns0:chargeableDeliveryOption
                                        return
                                            <ns1:chargeableDeliveryOption>
                                                <ns1:productId>{ data($chargeableDeliveryOption/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($chargeableDeliveryOption/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($chargeableDeliveryOption/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if (data( $chargeableDeliveryOption/ns0:orderProductPrice)) then
                                                        <ns1:orderProductPrice>{ data($chargeableDeliveryOption/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                   	else ""
                                                }
                                            </ns1:chargeableDeliveryOption>
                                      	else ""
                                    }
                                    {
                                    	if (data($generalProducts/ns0:postpayInsurance)) then
                                        let $postpayInsurance := $generalProducts/ns0:postpayInsurance
                                        return
                                            <ns1:postpayInsurance>
                                                <ns1:productId>{ data($postpayInsurance/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($postpayInsurance/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($postpayInsurance/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if (data( $postpayInsurance/ns0:imei)) then
                                                        <ns1:imei>{ data($postpayInsurance/ns0:imei) }</ns1:imei>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $postpayInsurance/ns0:msisdn)) then
                                                        <ns1:msisdn>{ data($postpayInsurance/ns0:msisdn) }</ns1:msisdn>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $postpayInsurance/ns0:serialNumber )) then
                                                        <ns1:serialNumber>{ data($postpayInsurance/ns0:serialNumber) }</ns1:serialNumber>
                                                  	else ""
                                                }
                                                {
                                                    if (data($postpayInsurance/ns0:cancelExistingInsurance )) then
                                                        <ns1:cancelExistingInsurance>
                                                            <ns1:insuranceEndDate>{ data($postpayInsurance/ns0:cancelExistingInsurance/ns0:insuranceEndDate) }</ns1:insuranceEndDate>
                                                        </ns1:cancelExistingInsurance>
                                                   	else
                                                        <ns1:addNewInsurance>
                                                            <ns1:assignedProductBillingFreq>{ data($postpayInsurance/ns0:addNewInsurance/ns0:assignedProductBillingFreq) }</ns1:assignedProductBillingFreq>
                                                        </ns1:addNewInsurance>
                                                }
                                                {
                                                	if (data($postpayInsurance/ns0:orderProductPrice)) then
                                                		<ns1:orderProductPrice>{ data($postpayInsurance/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                	else
                                                		<ns1:orderProductCharge>{ data($postpayInsurance/ns0:orderProductCharge) }</ns1:orderProductCharge>
                                                }
                                            </ns1:postpayInsurance>
                                      	else ""
                                    }
                                    {
                                        if (data($generalProducts/ns0:prepayInsurance)) then
                                        let $prepayInsurance := $generalProducts/ns0:prepayInsurance
                                        return
                                            <ns1:prepayInsurance>
                                                <ns1:productId>{ data($prepayInsurance/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($prepayInsurance/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($prepayInsurance/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if (data( $prepayInsurance/ns0:imei)) then
                                                        <ns1:imei>{ data($prepayInsurance/ns0:imei) }</ns1:imei>
                                                  	else ""
                                                }
                                                {
                                                    if ( data( $prepayInsurance/ns0:msisdn)) then
                                                        <ns1:msisdn>{ data($prepayInsurance/ns0:msisdn) }</ns1:msisdn>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $prepayInsurance/ns0:serialNumber )) then
                                                        <ns1:serialNumber>{ data($prepayInsurance/ns0:serialNumber) }</ns1:serialNumber>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $prepayInsurance/ns0:cancelExistingInsurance)) then
                                                        <ns1:cancelExistingInsurance>
                                                            <ns1:insuranceEndDate>{ data($prepayInsurance/ns0:cancelExistingInsurance/ns0:insuranceEndDate) }</ns1:insuranceEndDate>
                                                        </ns1:cancelExistingInsurance>
                                                    else
                                                        <ns1:addNewInsurance>
                                                            <ns1:assignedProductBillingFreq>{ data($prepayInsurance/ns0:addNewInsurance/ns0:assignedProductBillingFreq) }</ns1:assignedProductBillingFreq>
                                                        </ns1:addNewInsurance>
                                                }
                                                {
                                                	if (data ($prepayInsurance/ns0:orderProductPrice)) then
                                                		<ns1:orderProductPrice>{ data($prepayInsurance/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                	else
                                                		<ns1:orderProductCharge>{ data($prepayInsurance/ns0:orderProductCharge) }</ns1:orderProductCharge>
                                               	}
                                            </ns1:prepayInsurance>
                                      	else ""
                                    }
                                    {
                                    	if (data($generalProducts/ns0:standardDeliveryCharge)) then
                                        let $standardDeliveryCharge := $generalProducts/ns0:standardDeliveryCharge
                                        return
                                            <ns1:standardDeliveryCharge>
                                                <ns1:productId>{ data($standardDeliveryCharge/ns0:productId) }</ns1:productId>
                                                <ns1:productName>{ data($standardDeliveryCharge/ns0:productName) }</ns1:productName>
                                                <ns1:assignedProductNumber>{ data($standardDeliveryCharge/ns0:assignedProductNumber) }</ns1:assignedProductNumber>
                                                {
                                                    if (data( $standardDeliveryCharge/ns0:orderProductPrice)) then
                                                        <ns1:orderProductPrice>{ data($standardDeliveryCharge/ns0:orderProductPrice) }</ns1:orderProductPrice>
                                                   	else ""
                                                }
                                            </ns1:standardDeliveryCharge>
                                       	else ""
                                    }
                                </ns1:generalProducts>
                          	else ""
                        }
                        {
                            if (data( $saleableProducts/ns0:accountSetReference )) then
                                <ns1:accountSetReference>{ data($saleableProducts/ns0:accountSetReference) }</ns1:accountSetReference>
                           	else ""
                        }
                        {
                            if (data( $saleableProducts/ns0:chargeToCrossChargeAccountReference )) then
                                <ns1:chargeToCrossChargeAccountReference>{ data($saleableProducts/ns0:chargeToCrossChargeAccountReference) }</ns1:chargeToCrossChargeAccountReference>
                           	else ""
                        }
                        {
                             for $promotions in $saleableProducts/ns0:promotions
                               return
                                   <ns1:promotions>
                                        <ns1:promotionId>{ data($promotions/ns0:promotionId) }</ns1:promotionId>
                                    </ns1:promotions>
												
						}
                        
                        
                    </ns1:saleableProducts>
            }
            {
                for $accountSet in $submitOrder/ns0:accountSet
                return
                    <ns1:accountSet>
                        <ns1:accountSetReference>{ data($accountSet/ns0:accountSetReference) }</ns1:accountSetReference>
                        {
                            if (data ($accountSet/ns0:existingAccount)) then
                            let $existingAccount := $accountSet/ns0:existingAccount
                            return
                                <ns1:existingAccount>
                                    <ns1:billingAccountNumber>{ data($existingAccount/ns0:billingAccountNumber) }</ns1:billingAccountNumber>
                                    <ns1:billingCustomerNumber>{ data($existingAccount/ns0:billingCustomerNumber) }</ns1:billingCustomerNumber>
                                </ns1:existingAccount>
                          	else
                            let $newAccount := $accountSet/ns0:newAccount
                            return
                                <ns1:newAccount>
                                    <ns1:billingAccountName>{ data($newAccount/ns0:billingAccountName) }</ns1:billingAccountName>
                                    <ns1:accountBillingContactReference>{ data($newAccount/ns0:accountBillingContactReference) }</ns1:accountBillingContactReference>
                                    <ns1:accountLegalEntityReference>{ data($newAccount/ns0:accountLegalEntityReference) }</ns1:accountLegalEntityReference>
                                    {
                                        if (data( $newAccount/ns0:accountAdditionalChooserReference)) then
                                            <ns1:accountAdditionalChooserReference>{ data($newAccount/ns0:accountAdditionalChooserReference) }</ns1:accountAdditionalChooserReference>
                                      	else ""
                                    }
                                    {
                                        if (data( $newAccount/ns0:billingCustomerNumber)) then
                                            <ns1:billingCustomerNumber>{ data($newAccount/ns0:billingCustomerNumber) }</ns1:billingCustomerNumber>
                                       	else ""
                                    }
                                    {
                                        let $accountRecurringPaymentDetails := $newAccount/ns0:accountRecurringPaymentDetails
                                        return
                                            <ns1:accountRecurringPaymentDetails>
                                                {
                                                    if (data($accountRecurringPaymentDetails/ns0:creditCardDetails)) then
                                                    let $creditCardDetails := $accountRecurringPaymentDetails/ns0:creditCardDetails
                                                    return
                                                        <ns1:creditCardDetails>
                                                            <ns1:cardNumber>{ data($creditCardDetails/ns0:cardNumber) }</ns1:cardNumber>
                                                            <ns1:cardExpiryDate>{ data($creditCardDetails/ns0:cardExpiryDate) }</ns1:cardExpiryDate>
                                                            <ns1:cardHolderName>{ data($creditCardDetails/ns0:cardHolderName) }</ns1:cardHolderName>
                                                            {
                                                                if (data( $creditCardDetails/ns0:cardIssueDate )) then
                                                                    <ns1:cardIssueDate>{ data($creditCardDetails/ns0:cardIssueDate) }</ns1:cardIssueDate>
                                                               	else ""
                                                            }
                                                            {
                                                                if (data( $creditCardDetails/ns0:cardIssueNumber)) then
                                                                    <ns1:cardIssueNumber>{ data($creditCardDetails/ns0:cardIssueNumber) }</ns1:cardIssueNumber>
                                                              	else ""
                                                            }
                                                            <ns1:addressPostCode>{ data($creditCardDetails/ns0:addressPostCode) }</ns1:addressPostCode>
                                                            {
                                                                if (data ( $creditCardDetails/ns0:addressHouseName)) then
                                                                    <ns1:addressHouseName>{ data($creditCardDetails/ns0:addressHouseName) }</ns1:addressHouseName>
                                                               	else ""
                                                            }
                                                            {
                                                                if (data( $creditCardDetails/ns0:addressHouseNumber )) then
                                                                    <ns1:addressHouseNumber>{ data($creditCardDetails/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                               	else ""
                                                            }
                                                            <ns1:bankCardIssuer>{ data($creditCardDetails/ns0:bankCardIssuer) }</ns1:bankCardIssuer>
                                                        </ns1:creditCardDetails>
                                                    else if (data($accountRecurringPaymentDetails/ns0:directDebitDetails)) then
                                                    let $directDebitDetails := $accountRecurringPaymentDetails/ns0:directDebitDetails
                                                    return
                                                        <ns1:directDebitDetails>
                                                            <ns1:userAccountNumber>{ data($directDebitDetails/ns0:userAccountNumber) }</ns1:userAccountNumber>
                                                            {
                                                                if (data( $directDebitDetails/ns0:bankAccountNumber )) then
                                                                    <ns1:bankAccountNumber>{ data($directDebitDetails/ns0:bankAccountNumber) }</ns1:bankAccountNumber>
                                                              	else ""
                                                            }
                                                            <ns1:bankSortCode>{ data($directDebitDetails/ns0:bankSortCode) }</ns1:bankSortCode>
                                                            <ns1:bankAccountName>{ data($directDebitDetails/ns0:bankAccountName) }</ns1:bankAccountName>
                                                        </ns1:directDebitDetails>
                                                	else
                                                		<ns1:chequePayments>{ data($accountRecurringPaymentDetails/ns0:chequePayments) }</ns1:chequePayments>
                                             	}
                                            </ns1:accountRecurringPaymentDetails>
                                    }
                                </ns1:newAccount>
                        }
                    </ns1:accountSet>
            }
            {
                for $partySet in $submitOrder/ns0:partySet
                let $DOB := $configData/dateOfBirth
                return
                    <ns1:partySet>
                        <ns1:partySetReference>{ data($partySet/ns0:partySetReference) }</ns1:partySetReference>
                        {
                            if (data($partySet/ns0:existingParty)) then
                            let $existingParty := $partySet/ns0:existingParty
                                                        	
                            return
                                <ns1:existingParty>
                                    {
                                        let $existingDetails := $existingParty/ns0:existingDetails
                                        return
                                            <ns1:existingDetails>
                                                <ns1:customerNumber>{ data($existingDetails/ns0:customerNumber) }</ns1:customerNumber>
                                                <ns1:commonRegistryUserName>{ data($existingDetails/ns0:commonRegistryUserName) }</ns1:commonRegistryUserName>
                                                <ns1:commonRegistryUserDomain>{ data($existingDetails/ns0:commonRegistryUserDomain) }</ns1:commonRegistryUserDomain>
                                                {
                                                    if (data( $existingDetails/ns0:commonRegistryUserPassword )) then
                                                        <ns1:commonRegistryUserPassword>{ data($existingDetails/ns0:commonRegistryUserPassword) }</ns1:commonRegistryUserPassword>
                                                   	else ""
                                                }
                                            </ns1:existingDetails>
                                    }
                                    {
                                        let $personalDetails := $existingParty/ns0:personalDetails
                                        return
                                            <ns1:personalDetails>
                                                <ns1:partyTitle>{ data($personalDetails/ns0:partyTitle) }</ns1:partyTitle>
                                                <ns1:partyForename>{ data($personalDetails/ns0:partyForename) }</ns1:partyForename>
                                                {
                                                    if (data( $personalDetails/ns0:partyMiddleName )) then
                                                        <ns1:partyMiddleName>{ data($personalDetails/ns0:partyMiddleName) }</ns1:partyMiddleName>
                                                  	else ""
                                                }
                                                
                                                <ns1:partySurname>{ data($personalDetails/ns0:partySurname) }</ns1:partySurname>
                                                {	
                                                	if (data($personalDetails/ns0:dateOfBirth))then
                                                <ns1:dateOfBirth>{ data($personalDetails/ns0:dateOfBirth) }</ns1:dateOfBirth>
                                                	else
                                                	 <ns1:dateOfBirth>{ data($DOB) }</ns1:dateOfBirth>
                                                }
                                                {
                                                    if (data( $personalDetails/ns0:adultUser)) then
                                                        <ns1:adultUser>{ data($personalDetails/ns0:adultUser) }</ns1:adultUser>
                                                   	else ""
                                                }
                                            </ns1:personalDetails>
                                    }
                                    {
                                    	if (data($existingParty/ns0:contactDetails)) then
                                        let $contactDetails := $existingParty/ns0:contactDetails
                                        return
                                            <ns1:contactDetails>
                                                {
                                                    if ( data ($contactDetails/ns0:emailAddress)) then
                                                        <ns1:emailAddress>{ data($contactDetails/ns0:emailAddress) }</ns1:emailAddress>
                                                  	else ""
                                                }
                                                {
                                                    if (data ( $contactDetails/ns0:homePhoneNumber)) then
                                                        <ns1:homePhoneNumber>{ data($contactDetails/ns0:homePhoneNumber) }</ns1:homePhoneNumber>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:mobilePhoneNumber)) then
                                                        <ns1:mobilePhoneNumber>{ data($contactDetails/ns0:mobilePhoneNumber) }</ns1:mobilePhoneNumber>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:faxNumber)) then
                                                        <ns1:faxNumber>{ data($contactDetails/ns0:faxNumber) }</ns1:faxNumber>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:businessNumber)) then
                                                        <ns1:businessNumber>{ data($contactDetails/ns0:businessNumber) }</ns1:businessNumber>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:preferredContactMethod)) then
                                                        <ns1:preferredContactMethod>{ data($contactDetails/ns0:preferredContactMethod) }</ns1:preferredContactMethod>
                                                   	else ""
                                                }
                                            </ns1:contactDetails>
                                       	else ""
                                    }
                                    {
                                        let $customerProfile := $existingParty/ns0:customerProfile
                                        return
                                            <ns1:customerProfile>
                                                <ns1:customerType>{ data($customerProfile/ns0:customerType) }</ns1:customerType>                                                
                                                {
                                                    if ( data( $customerProfile/ns0:segmentation )) then
                                                        <ns1:segmentation>{ data($customerProfile/ns0:segmentation) }</ns1:segmentation>
                                                   	else ""
                                                }
                                            </ns1:customerProfile>
                                    }
                                    {
                                        let $currentAddress := $existingParty/ns0:currentAddress
                                        return
                                            <ns1:currentAddress>
                                                {
                                                    if (data( $currentAddress/ns0:addressHouseName )) then
                                                        <ns1:addressHouseName>{ data($currentAddress/ns0:addressHouseName) }</ns1:addressHouseName>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressHouseNumber )) then
                                                        <ns1:addressHouseNumber>{ data($currentAddress/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                   	else ""
                                                }
                                                <ns1:address1stLine>{ data($currentAddress/ns0:address1stLine) }</ns1:address1stLine>
                                                {
                                                    if (data ( $currentAddress/ns0:address2ndLine )) then
                                                        <ns1:address2ndLine>{ data($currentAddress/ns0:address2ndLine) }</ns1:address2ndLine>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressDistrict)) then
                                                        <ns1:addressDistrict>{ data($currentAddress/ns0:addressDistrict) }</ns1:addressDistrict>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressTown )) then
                                                        <ns1:addressTown>{ data($currentAddress/ns0:addressTown) }</ns1:addressTown>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressCounty )) then
                                                        <ns1:addressCounty>{ data($currentAddress/ns0:addressCounty) }</ns1:addressCounty>
                                                   	else ""
                                                }
                                                <ns1:addressPostCode>{ data($currentAddress/ns0:addressPostCode) }</ns1:addressPostCode>
                                                <ns1:postalCountry>{ data($currentAddress/ns0:postalCountry) }</ns1:postalCountry>
                                                {
                                                    if (data( $currentAddress/ns0:equifaxPTCABSID )) then
                                                        <ns1:equifaxPTCABSID>{ data($currentAddress/ns0:equifaxPTCABSID) }</ns1:equifaxPTCABSID>
                                                   	else ""
                                                }
                                                <ns1:addressValidationStatus>{ data($currentAddress/ns0:addressValidationStatus) }</ns1:addressValidationStatus>
                                            </ns1:currentAddress>
                                    }
                                    {
                                        if (data($existingParty/ns0:previousAddress1)) then
                                        let $previousAddress1 := $existingParty/ns0:previousAddress1
                                        return
                                            <ns1:previousAddress1>
                                                {
                                                    if (data( $previousAddress1/ns0:addressHouseName )) then
                                                        <ns1:addressHouseName>{ data($previousAddress1/ns0:addressHouseName) }</ns1:addressHouseName>
                                                   	else ""
                                                }
                                                {
                                                    if (data ( $previousAddress1/ns0:addressHouseNumber )) then
                                                        <ns1:addressHouseNumber>{ data($previousAddress1/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                   	else ""
                                                }
                                                <ns1:address1stLine>{ data($previousAddress1/ns0:address1stLine) }</ns1:address1stLine>
                                                {
                                                    if ( data( $previousAddress1/ns0:address2ndLine)) then
                                                        <ns1:address2ndLine>{ data($previousAddress1/ns0:address2ndLine) }</ns1:address2ndLine>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressDistrict)) then
                                                        <ns1:addressDistrict>{ data($previousAddress1/ns0:addressDistrict) }</ns1:addressDistrict>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressTown)) then
                                                        <ns1:addressTown>{ data($previousAddress1/ns0:addressTown) }</ns1:addressTown>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressCounty)) then
                                                        <ns1:addressCounty>{ data($previousAddress1/ns0:addressCounty) }</ns1:addressCounty>
                                                   	else ""
                                                }
                                                <ns1:addressPostCode>{ data($previousAddress1/ns0:addressPostCode) }</ns1:addressPostCode>
                                                <ns1:postalCountry>{ data($previousAddress1/ns0:postalCountry) }</ns1:postalCountry>
                                                {
                                                    if (data( $previousAddress1/ns0:equifaxPTCABSID)) then
                                                        <ns1:equifaxPTCABSID>{ data($previousAddress1/ns0:equifaxPTCABSID) }</ns1:equifaxPTCABSID>
                                                   	else ""
                                                }
                                                <ns1:addressValidationStatus>{ data($previousAddress1/ns0:addressValidationStatus) }</ns1:addressValidationStatus>
                                            </ns1:previousAddress1>
                                       	else ""
                                    }
                                    {
                                    	if (data($existingParty/ns0:previousAddress2)) then
                                        let $previousAddress2 := $existingParty/ns0:previousAddress2
                                        return
                                            <ns1:previousAddress2>
                                                {
                                                    if (data( $previousAddress2/ns0:addressHouseName )) then
                                                        <ns1:addressHouseName>{ data($previousAddress2/ns0:addressHouseName) }</ns1:addressHouseName>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressHouseNumber )) then
                                                        <ns1:addressHouseNumber>{ data($previousAddress2/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                  	else ""
                                                }
                                                <ns1:address1stLine>{ data($previousAddress2/ns0:address1stLine) }</ns1:address1stLine>
                                                {
                                                    if (data( $previousAddress2/ns0:address2ndLine )) then
                                                        <ns1:address2ndLine>{ data($previousAddress2/ns0:address2ndLine) }</ns1:address2ndLine>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressDistrict )) then
                                                        <ns1:addressDistrict>{ data($previousAddress2/ns0:addressDistrict) }</ns1:addressDistrict>
                                                    else ""
                                                }
                                                {
                                                    if (data($previousAddress2/ns0:addressTown )) then
                                                        <ns1:addressTown>{ data($previousAddress2/ns0:addressTown) }</ns1:addressTown>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressCounty )) then
                                                        <ns1:addressCounty>{ data($previousAddress2/ns0:addressCounty) }</ns1:addressCounty>
                                                   	else ""
                                                }
                                                <ns1:addressPostCode>{ data($previousAddress2/ns0:addressPostCode) }</ns1:addressPostCode>
                                                <ns1:postalCountry>{ data($previousAddress2/ns0:postalCountry) }</ns1:postalCountry>
                                                {
                                                    if (data( $previousAddress2/ns0:equifaxPTCABSID )) then
                                                        <ns1:equifaxPTCABSID>{ data($previousAddress2/ns0:equifaxPTCABSID) }</ns1:equifaxPTCABSID>
                                                   	else ""
                                                }
                                                <ns1:addressValidationStatus>{ data($previousAddress2/ns0:addressValidationStatus) }</ns1:addressValidationStatus>
                                            </ns1:previousAddress2>
                                      	else ""
                                    }
                                    {
                                        if (data($existingParty/ns0:proofs)) then
                                        let $proofs := $existingParty/ns0:proofs
                                        return
                                            <ns1:proofs>
                                                {
                                                    if (data( $proofs/ns0:proofOfAddressDetails )) then
                                                        <ns1:proofOfAddressDetails>
                                                            <ns1:proofOfAddress>{ data($proofs/ns0:proofOfAddressDetails/ns0:proofOfAddress) }</ns1:proofOfAddress>
                                                            <ns1:proofOfAddressDate>{ data($proofs/ns0:proofOfAddressDetails/ns0:proofOfAddressDate) }</ns1:proofOfAddressDate>
                                                        </ns1:proofOfAddressDetails>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $proofs/ns0:proofOfIdentityDetails)) then
                                                        <ns1:proofOfIdentityDetails>
                                                            <ns1:proofOfIdentity>{ data($proofs/ns0:proofOfIdentityDetails/ns0:proofOfIdentity) }</ns1:proofOfIdentity>
                                                            <ns1:proofOfIdentityReference>{ data($proofs/ns0:proofOfIdentityDetails/ns0:proofOfIdentityReference) }</ns1:proofOfIdentityReference>
                                                        </ns1:proofOfIdentityDetails>
                                                  	else ""
                                                }
                                            </ns1:proofs>
                                      	else ""
                                    }
                                    {
                                        if (data ($existingParty/ns0:company)) then
                                        let $company := $existingParty/ns0:company
                                        return
                                            <ns1:company>
                                                <ns1:jobTitle>{ data($company/ns0:jobTitle) }</ns1:jobTitle>
                                                <ns1:jobFunction>{ data($company/ns0:jobFunction) }</ns1:jobFunction>
                                                <ns1:companyName>{ data($company/ns0:companyName) }</ns1:companyName>
                                                <ns1:companyRegistrationNo>{ data($company/ns0:companyRegistrationNo) }</ns1:companyRegistrationNo>
                                                <ns1:companyPhoneNumber>{ data($company/ns0:companyPhoneNumber) }</ns1:companyPhoneNumber>
                                                <ns1:numberOfEmployees>{ data($company/ns0:numberOfEmployees) }</ns1:numberOfEmployees>
                                            </ns1:company>
                                      	else ""
                                    }
                                </ns1:existingParty>
                            else                             
                            let $newParty := $partySet/ns0:newParty
                            return
                                <ns1:newParty>
                                    {
                                        let $personalDetails := $newParty/ns0:personalDetails
                                        return
                                            <ns1:personalDetails>
                                                <ns1:partyTitle>{ data($personalDetails/ns0:partyTitle) }</ns1:partyTitle>
                                                <ns1:partyForename>{ data($personalDetails/ns0:partyForename) }</ns1:partyForename>
                                                {
                                                    if (data( $personalDetails/ns0:partyMiddleName )) then
                                                        <ns1:partyMiddleName>{ data($personalDetails/ns0:partyMiddleName) }</ns1:partyMiddleName>
                                                   	else ""
                                                }
                                                <ns1:partySurname>{ data($personalDetails/ns0:partySurname) }</ns1:partySurname>
                                                {
                                                	if (data($personalDetails/ns0:dateOfBirth)) then
                                                <ns1:dateOfBirth>{ data($personalDetails/ns0:dateOfBirth) }</ns1:dateOfBirth>
                                                	else
                                                		<ns1:dateOfBirth>{ data($DOB) }</ns1:dateOfBirth>
                                                }	
                                                {
                                                    if (data( $personalDetails/ns0:adultUser )) then
                                                        <ns1:adultUser>{ data($personalDetails/ns0:adultUser) }</ns1:adultUser>
                                                   	else ""
                                                }
                                            </ns1:personalDetails>
                                    }
                                    {
                                        if (data($newParty/ns0:contactDetails)) then
                                        let $contactDetails := $newParty/ns0:contactDetails
                                        return
                                            <ns1:contactDetails>
                                                {
                                                    if (data( $contactDetails/ns0:emailAddress)) then
                                                        <ns1:emailAddress>{ data($contactDetails/ns0:emailAddress) }</ns1:emailAddress>
                                                  	else ""
                                                        
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:homePhoneNumber)) then
                                                        <ns1:homePhoneNumber>{ data($contactDetails/ns0:homePhoneNumber) }</ns1:homePhoneNumber>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:mobilePhoneNumber)) then
                                                        <ns1:mobilePhoneNumber>{ data($contactDetails/ns0:mobilePhoneNumber) }</ns1:mobilePhoneNumber>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:faxNumber)) then
                                                        <ns1:faxNumber>{ data($contactDetails/ns0:faxNumber) }</ns1:faxNumber>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:businessNumber)) then
                                                        <ns1:businessNumber>{ data($contactDetails/ns0:businessNumber) }</ns1:businessNumber>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $contactDetails/ns0:preferredContactMethod)) then
                                                        <ns1:preferredContactMethod>{ data($contactDetails/ns0:preferredContactMethod) }</ns1:preferredContactMethod>
                                                   	else ""
                                                }
                                            </ns1:contactDetails>
                                      	else ""
                                    }
                                    {
                                        let $customerProfile := $newParty/ns0:customerProfile
                                        return
                                            <ns1:customerProfile>
                                                <ns1:customerType>{ data($customerProfile/ns0:customerType) }</ns1:customerType>                                               
                                                {
                                                    if (data( $customerProfile/ns0:segmentation)) then
                                                        <ns1:segmentation>{ data($customerProfile/ns0:segmentation) }</ns1:segmentation>
                                                  	else ""
                                                }
                                            </ns1:customerProfile>
                                    }
                                    {
                                        let $currentAddress := $newParty/ns0:currentAddress
                                        return
                                            <ns1:currentAddress>
                                                {
                                                    if (data( $currentAddress/ns0:addressHouseName)) then
                                                        <ns1:addressHouseName>{ data($currentAddress/ns0:addressHouseName) }</ns1:addressHouseName>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressHouseNumber)) then
                                                        <ns1:addressHouseNumber>{ data($currentAddress/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                   	else ""
                                                }
                                                <ns1:address1stLine>{ data($currentAddress/ns0:address1stLine) }</ns1:address1stLine>
                                                {
                                                    if (data( $currentAddress/ns0:address2ndLine)) then
                                                        <ns1:address2ndLine>{ data($currentAddress/ns0:address2ndLine) }</ns1:address2ndLine>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressDistrict)) then
                                                        <ns1:addressDistrict>{ data($currentAddress/ns0:addressDistrict) }</ns1:addressDistrict>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressTown)) then
                                                        <ns1:addressTown>{ data($currentAddress/ns0:addressTown) }</ns1:addressTown>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $currentAddress/ns0:addressCounty)) then
                                                        <ns1:addressCounty>{ data($currentAddress/ns0:addressCounty) }</ns1:addressCounty>
                                                   	else ""
                                                }
                                                <ns1:addressPostCode>{ data($currentAddress/ns0:addressPostCode) }</ns1:addressPostCode>
                                                <ns1:postalCountry>{ data($currentAddress/ns0:postalCountry) }</ns1:postalCountry>
                                                {
                                                    if (data( $currentAddress/ns0:equifaxPTCABSID)) then
                                                        <ns1:equifaxPTCABSID>{ data($currentAddress/ns0:equifaxPTCABSID) }</ns1:equifaxPTCABSID>
                                                    else ""
                                                }
                                                <ns1:addressValidationStatus>{ data($currentAddress/ns0:addressValidationStatus) }</ns1:addressValidationStatus>
                                            </ns1:currentAddress>
                                    }
                                    {
                                        if (data($newParty/ns0:previousAddress1))then
                                        let $previousAddress1 := $newParty/ns0:previousAddress1
                                        return
                                            <ns1:previousAddress1>
                                                {
                                                    if (data( $previousAddress1/ns0:addressHouseName )) then
                                                        <ns1:addressHouseName>{ data($previousAddress1/ns0:addressHouseName) }</ns1:addressHouseName>
                                                   	else""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressHouseNumber )) then
                                                        <ns1:addressHouseNumber>{ data($previousAddress1/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                   	else""
                                                }
                                                <ns1:address1stLine>{ data($previousAddress1/ns0:address1stLine) }</ns1:address1stLine>
                                                {
                                                    if (data( $previousAddress1/ns0:address2ndLine )) then
                                                        <ns1:address2ndLine>{ data($previousAddress1/ns0:address2ndLine) }</ns1:address2ndLine>
                                                   	else""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressDistrict )) then
                                                        <ns1:addressDistrict>{ data($previousAddress1/ns0:addressDistrict) }</ns1:addressDistrict>
                                                   	else""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressTown )) then
                                                        <ns1:addressTown>{ data($previousAddress1/ns0:addressTown) }</ns1:addressTown>
                                                   	else""
                                                }
                                                {
                                                    if (data( $previousAddress1/ns0:addressCounty )) then
                                                        <ns1:addressCounty>{ data($previousAddress1/ns0:addressCounty) }</ns1:addressCounty>
                                                   	else""
                                                }
                                                <ns1:addressPostCode>{ data($previousAddress1/ns0:addressPostCode) }</ns1:addressPostCode>
                                                <ns1:postalCountry>{ data($previousAddress1/ns0:postalCountry) }</ns1:postalCountry>
                                                {
                                                    if (data( $previousAddress1/ns0:equifaxPTCABSID )) then
                                                        <ns1:equifaxPTCABSID>{ data($previousAddress1/ns0:equifaxPTCABSID) }</ns1:equifaxPTCABSID>
                                                   	else""
                                                }
                                                <ns1:addressValidationStatus>{ data($previousAddress1/ns0:addressValidationStatus) }</ns1:addressValidationStatus>
                                            </ns1:previousAddress1>
                                      	else ""
                                    }
                                    {
                                        if (data($newParty/ns0:previousAddress2))then
                                        let $previousAddress2 := $newParty/ns0:previousAddress2
                                        return
                                            <ns1:previousAddress2>
                                                {
                                                    if (data( $previousAddress2/ns0:addressHouseName )) then
                                                        <ns1:addressHouseName>{ data($previousAddress2/ns0:addressHouseName) }</ns1:addressHouseName>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressHouseNumber )) then
                                                        <ns1:addressHouseNumber>{ data($previousAddress2/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                                   	else ""
                                                }
                                                <ns1:address1stLine>{ data($previousAddress2/ns0:address1stLine) }</ns1:address1stLine>
                                                {
                                                    if (data( $previousAddress2/ns0:address2ndLine )) then
                                                        <ns1:address2ndLine>{ data($previousAddress2/ns0:address2ndLine) }</ns1:address2ndLine>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressDistrict )) then
                                                        <ns1:addressDistrict>{ data($previousAddress2/ns0:addressDistrict) }</ns1:addressDistrict>
                                                  	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressTown )) then
                                                        <ns1:addressTown>{ data($previousAddress2/ns0:addressTown) }</ns1:addressTown>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $previousAddress2/ns0:addressCounty )) then
                                                        <ns1:addressCounty>{ data($previousAddress2/ns0:addressCounty) }</ns1:addressCounty>
                                                   	else ""
                                                }
                                                <ns1:addressPostCode>{ data($previousAddress2/ns0:addressPostCode) }</ns1:addressPostCode>
                                                <ns1:postalCountry>{ data($previousAddress2/ns0:postalCountry) }</ns1:postalCountry>
                                                {
                                                    if (data( $previousAddress2/ns0:equifaxPTCABSID )) then
                                                        <ns1:equifaxPTCABSID>{ data($previousAddress2/ns0:equifaxPTCABSID) }</ns1:equifaxPTCABSID>
                                                   	else ""
                                                }
                                                <ns1:addressValidationStatus>{ data($previousAddress2/ns0:addressValidationStatus) }</ns1:addressValidationStatus>
                                            </ns1:previousAddress2>
                                      	else ""
                                    }
                                    {
                                        if (data($newParty/ns0:proofs))then
                                        let $proofs := $newParty/ns0:proofs
                                        return
                                            <ns1:proofs>
                                                {
                                                    if (data( $proofs/ns0:proofOfAddressDetails )) then
                                                        <ns1:proofOfAddressDetails>
                                                            <ns1:proofOfAddress>{ data($proofs/ns0:proofOfAddressDetails/ns0:proofOfAddress) }</ns1:proofOfAddress>
                                                            <ns1:proofOfAddressDate>{ data($proofs/ns0:proofOfAddressDetails/ns0:proofOfAddressDate) }</ns1:proofOfAddressDate>
                                                        </ns1:proofOfAddressDetails>
                                                   	else ""
                                                }
                                                {
                                                    if (data( $proofs/ns0:proofOfIdentityDetails )) then
                                                        <ns1:proofOfIdentityDetails>
                                                            <ns1:proofOfIdentity>{ data($proofs/ns0:proofOfIdentityDetails/ns0:proofOfIdentity) }</ns1:proofOfIdentity>
                                                            <ns1:proofOfIdentityReference>{ data($proofs/ns0:proofOfIdentityDetails/ns0:proofOfIdentityReference) }</ns1:proofOfIdentityReference>
                                                        </ns1:proofOfIdentityDetails>
                                                 	else ""
                                                }
                                            </ns1:proofs>
                                       	else ""
                                    }
                                    {
                                        for $company in $newParty/ns0:company
                                        return
                                            <ns1:company>
                                                <ns1:jobTitle>{ data($company/ns0:jobTitle) }</ns1:jobTitle>
                                                <ns1:jobFunction>{ data($company/ns0:jobFunction) }</ns1:jobFunction>
                                                <ns1:companyName>{ data($company/ns0:companyName) }</ns1:companyName>
                                                <ns1:companyRegistrationNo>{ data($company/ns0:companyRegistrationNo) }</ns1:companyRegistrationNo>
                                                <ns1:companyPhoneNumber>{ data($company/ns0:companyPhoneNumber) }</ns1:companyPhoneNumber>
                                                <ns1:numberOfEmployees>{ data($company/ns0:numberOfEmployees) }</ns1:numberOfEmployees>
                                            </ns1:company>
                                    }
                                </ns1:newParty>
                        }
                    </ns1:partySet>
            }
            {
                if (data( $submitOrder/ns0:orderDeliveryDetails )) then
                let $orderDeliveryDetails := $submitOrder/ns0:orderDeliveryDetails
                return
                    <ns1:orderDeliveryDetails>
                        {
                            if ( data ($orderDeliveryDetails/ns0:chargeableDeliveryOption) )then
                            let $chargeableDeliveryOption := $orderDeliveryDetails/ns0:chargeableDeliveryOption
                            return
                                <ns1:chargeableDeliveryOption>
                                    <ns1:deliveryDate>{ data($chargeableDeliveryOption/ns0:deliveryDate) }</ns1:deliveryDate>
                                    <ns1:despatchDate>{ data($chargeableDeliveryOption/ns0:despatchDate) }</ns1:despatchDate>
                                    <ns1:timeslot>{ data($chargeableDeliveryOption/ns0:timeslot) }</ns1:timeslot>
                                </ns1:chargeableDeliveryOption>
                        	else
                        		<ns1:isStandardDeliveryOption>{ data($orderDeliveryDetails/ns0:isStandardDeliveryOption) }</ns1:isStandardDeliveryOption>
                        }
                        <ns1:destinationName>{ data($orderDeliveryDetails/ns0:destinationName) }</ns1:destinationName>
                        {
                            if (data( $orderDeliveryDetails/ns0:deliveryContactNumber )) then
                                <ns1:deliveryContactNumber>{ data($orderDeliveryDetails/ns0:deliveryContactNumber) }</ns1:deliveryContactNumber>
                           	else ""
                        }
                      
                      
                      
                      (: 25/05/2012 		2.0.2 		Dinsa Devassy 		Added mapping for the new element storeDetails as a part of  Click To Collect Project :)
                        
                     	{
						if (($orderDeliveryDetails/ns0:storeDetails)) then
                           <ns1:storeDetails>
                                  <ns1:storeNumber>{data($orderDeliveryDetails/ns0:storeDetails/ns0:storeNumber)}</ns1:storeNumber>
								  <ns1:storeName>{data($orderDeliveryDetails/ns0:storeDetails/ns0:storeName)}</ns1:storeName>
						   </ns1:storeDetails>
                        else ""
						}   
                      
                      
                      
                      
                      
                      
                        {
                            let $deliveryAddress := $orderDeliveryDetails/ns0:deliveryAddress
                            return
                                <ns1:deliveryAddress>
                                    {
                                        if (data( $deliveryAddress/ns0:addressHouseName )) then
                                            <ns1:addressHouseName>{ data($deliveryAddress/ns0:addressHouseName) }</ns1:addressHouseName>
                                       	else ""
                                    }
                                    {
                                        if (data( $deliveryAddress/ns0:addressHouseNumber )) then
                                            <ns1:addressHouseNumber>{ data($deliveryAddress/ns0:addressHouseNumber) }</ns1:addressHouseNumber>
                                       	else ""
                                    }
                                    <ns1:address1stLine>{ data($deliveryAddress/ns0:address1stLine) }</ns1:address1stLine>
                                    {
                                        if (data( $deliveryAddress/ns0:address2ndLine )) then
                                            <ns1:address2ndLine>{ data($deliveryAddress/ns0:address2ndLine) }</ns1:address2ndLine>
                                       	else ""
                                    }
                                    {
                                        if (data( $deliveryAddress/ns0:addressDistrict )) then
                                            <ns1:addressDistrict>{ data($deliveryAddress/ns0:addressDistrict) }</ns1:addressDistrict>
                                       	else ""
                                    }
                                    {
                                        if (data( $deliveryAddress/ns0:addressTown )) then
                                            <ns1:addressTown>{ data($deliveryAddress/ns0:addressTown) }</ns1:addressTown>
                                       	else ""
                                    }
                                    {
                                        if (data( $deliveryAddress/ns0:addressCounty )) then
                                            <ns1:addressCounty>{ data($deliveryAddress/ns0:addressCounty) }</ns1:addressCounty>
                                       	else ""
                                    }
                                    <ns1:addressPostCode>{ data($deliveryAddress/ns0:addressPostCode) }</ns1:addressPostCode>
                                    <ns1:postalCountry>{ data($deliveryAddress/ns0:postalCountry) }</ns1:postalCountry>
                                </ns1:deliveryAddress>
                        }
                        <ns1:deliveryAddressModified>{ data($orderDeliveryDetails/ns0:deliveryAddressModified) }</ns1:deliveryAddressModified>
                    </ns1:orderDeliveryDetails>
              	else ""
            }
            {
                if (data( $submitOrder/ns0:orderCreditCheckDetails )) then
                let $orderCreditCheckDetails := $submitOrder/ns0:orderCreditCheckDetails
                return
                    <ns1:orderCreditCheckDetails>
                        <ns1:creditCheckStatus>{ data($orderCreditCheckDetails/ns0:creditCheckStatus) }</ns1:creditCheckStatus>
                        {
                            if (data ($orderCreditCheckDetails/ns0:creditVetDetails) ) then
                            let $creditVetDetails := $orderCreditCheckDetails/ns0:creditVetDetails
                            return
                                <ns1:creditVetDetails>
                                    <ns1:creditVetNumber>{ data($creditVetDetails/ns0:creditVetNumber) }</ns1:creditVetNumber>
                                    {
                                        if (data( $creditVetDetails/ns0:creditScore )) then
                                            <ns1:creditScore>{ data($creditVetDetails/ns0:creditScore) }</ns1:creditScore>
                                      	else ""
                                    }
                                    <ns1:lastCreditCheckDate>{ data($creditVetDetails/ns0:lastCreditCheckDate) }</ns1:lastCreditCheckDate>
                                    {
                                        if (data( $creditVetDetails/ns0:creditClassId )) then
                                            <ns1:creditClassId>{ data($creditVetDetails/ns0:creditClassId) }</ns1:creditClassId>
                                      	else ""
                                    }
                                    {
                                        if (data($creditVetDetails/ns0:depositDetails)) then
                                        let $depositDetails := $creditVetDetails/ns0:depositDetails
                                        return
                                            <ns1:depositDetails>
                                                <ns1:depositKind>{ data($depositDetails/ns0:depositKind) }</ns1:depositKind>
                                                <ns1:depositAmount>{ data($depositDetails/ns0:depositAmount) }</ns1:depositAmount>
                                                <ns1:depositDuration>{ data($depositDetails/ns0:depositDuration) }</ns1:depositDuration>
                                                {
                                                    if (data( $depositDetails/ns0:depositReference )) then
                                                        <ns1:depositReference>{ data($depositDetails/ns0:depositReference) }</ns1:depositReference>
                                                   	else ""
                                                }
                                            </ns1:depositDetails>
                                       	else ""
                                    }
                                    {	
                                    	if (data($creditVetDetails/ns0:transactCreditCheckDetails)) then
                                        let $transactCreditCheckDetails := $creditVetDetails/ns0:transactCreditCheckDetails
                                        return
                                    		<ns1:transactCreditCheckDetails>
		                                        <ns1:creditCheckResultCode>{ data($transactCreditCheckDetails/ns0:creditCheckResultCode) }</ns1:creditCheckResultCode>
        		                                <ns1:totalMonthlyCharge>{ data($transactCreditCheckDetails/ns0:totalMonthlyCharge) }</ns1:totalMonthlyCharge>
                		                        {
                                            		if(data( $transactCreditCheckDetails/ns0:creditLimit )) then
                                                		<ns1:creditLimit>{ data($transactCreditCheckDetails/ns0:creditLimit) }</ns1:creditLimit>
                                          			else ""
                                        		}
                                        		{
                                            		if (data ($transactCreditCheckDetails/ns0:conditionalBars)) then
                                            		let $conditionalBars := $transactCreditCheckDetails/ns0:conditionalBars
                                            		return
                                                		<ns1:conditionalBars>
                                                    		<ns1:internationalBar>{ data($conditionalBars/ns0:internationalBar) }</ns1:internationalBar>
                                                    		<ns1:premiumBar>{ data($conditionalBars/ns0:premiumBar) }</ns1:premiumBar>
                                                    		<ns1:roamingBar>{ data($conditionalBars/ns0:roamingBar) }</ns1:roamingBar>
                                                		</ns1:conditionalBars>
                                               		else ""
                                        		}
                                    		</ns1:transactCreditCheckDetails>
                                    	else ""
                                    }
                                    {
                                        if (data( $creditVetDetails/ns0:referralReason )) then
                                            <ns1:referralReason>{ data($creditVetDetails/ns0:referralReason) }</ns1:referralReason>
                                       	else ""
                                    }
                                </ns1:creditVetDetails>
                           	else ""
                        }
                    </ns1:orderCreditCheckDetails>
               	else ""
            }
            
            {
                if(data($submitOrder/ns0:orderCollectionDetails))then
                
                    <ns1:orderCollectionDetails>
                        <ns1:orderCollectionVerificationLevel>{ data($submitOrder/ns0:orderCollectionDetails/ns0:orderCollectionVerificationLevel) }</ns1:orderCollectionVerificationLevel>
                    </ns1:orderCollectionDetails>
                    else " "
            }
            {
            if(data($submitOrder/ns0:documentation))then
			<ns1:documentation>
			{
            if(data($submitOrder/ns0:documentation/ns0:insProdInfoDoc))then
			<ns1:insProdInfoDoc>
			{
			for $insProdInfoDocDetails in $submitOrder/ns0:documentation/ns0:insProdInfoDoc/ns0:insProdInfoDocDetails
                                        return
                                       
									<ns1:insProdInfoDocDetails>
                                                <ns1:IPIDType>{ data($insProdInfoDocDetails/ns0:IPIDType) }</ns1:IPIDType>
                                                <ns1:signatureStatus>{ data($insProdInfoDocDetails/ns0:signatureStatus) }</ns1:signatureStatus>
												{
												if(data($insProdInfoDocDetails/ns0:documentSignedTimestamp))then
												
												<ns1:documentSignedTimestamp>{ data($insProdInfoDocDetails/ns0:documentSignedTimestamp) }</ns1:documentSignedTimestamp>
												else""
												}
									</ns1:insProdInfoDocDetails>
									
												}
												
									<ns1:IPIDDurableMedium>{ data($submitOrder/ns0:documentation/ns0:insProdInfoDoc/ns0:IPIDDurableMedium)}</ns1:IPIDDurableMedium>
									</ns1:insProdInfoDoc>
									 else ""
                                    }
									</ns1:documentation>
									else ""
									}
        </ns1:submitInstallOrder>
};

declare variable $submitOrder as element(ns0:submitOrder) external;
declare variable $configData as element(*) external;


xf:SubmitOrderRQtoSubmitInstallOrderRQ($submitOrder,$configData)