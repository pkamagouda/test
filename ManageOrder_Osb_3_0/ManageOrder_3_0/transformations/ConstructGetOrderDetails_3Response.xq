(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsResp" type="ns1:companionMessage/ns1:utilGetOrderDetailsResp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma  parameter="$configData" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 24/11/2014 		1.0.0 		Vanishree 			Initial version :)
(: 10/02/2016 		1.0.1 		Dolly K 			Added product description and classification for tariff and boltons for postpay tariff details as part of Telesales Franchise Phase :)
(: 25/05/2016 		1.0.2 		Subra Bose 			Changed utilGetOrderDetailsV5Resp to utilGetOrderDetailsResp as part of GlobalCre and Running :)
(: 10/06/2016       1.0.3       Chandrakala S       Added "promotionsTaken" details as part of Refresh Buy Out  project :)
(: 15/09/2017       1.0.4       Megha N             Added element "refreshFinalPayment" as part of Refresh Evolution Project :)
(: 27/09/2017       1.0.5       Megha N             Added element "promotionid" and "promotions" details as part of Promotions and Airtime Discount Project:)
(: 05/10/2017       1.0.6       Megha N             Added "postPayInsurance" details as part of Live issue Fix :)
(:30-04-2018        1.0.7       Kunal G             As part of Live fix, now we are fetching value(GB) from config for parameter country with in the complex block uGOD_previous_address :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructGetOrderDetails_3Response/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/product/referencedetailsdata_1";



declare function xf:ConstructGetOrderDetails_3Response($utilGetOrderDetailsResp as element(),
    $configData as element(*),$referenceDetailsResp as element(*),$getOrderDetailsrequest as element(*))
    as element(ns0:getOrderDetails_3Response) {
        <ns0:getOrderDetails_3Response>
            <ns0:responseCode>{ data($configData/getOrderDetails/successCode) }</ns0:responseCode>
            <ns0:orderHeaderDetails>
                <ns0:orderNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:orderNumber) }</ns0:orderNumber>
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:oid))then
                <ns0:oid>{ xs:integer( data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:oid) ) }</ns0:oid>
                else ""
                }
                <ns0:orderTimestamp>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:orderTimestamp) }</ns0:orderTimestamp>
                <ns0:orderType>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:orderType) }</ns0:orderType>
                <ns0:orderStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:orderStatus) }</ns0:orderStatus>
                {
                   if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:preOrderOfferingId))then
                    <ns0:preOrderOfferingId>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns2:preOrderOfferingId) }</ns0:preOrderOfferingId>
                  else ""
                }
                <ns0:portalEmail>
                    <ns0:commonRegistryUserName>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns1:uGOD_PortalEmail/ns2:commonRegistryUserName) }</ns0:commonRegistryUserName>
                    <ns0:commonRegistryUserDomain>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns1:uGOD_PortalEmail/ns2:commonRegistryUserDomain) }</ns0:commonRegistryUserDomain>
                </ns0:portalEmail>
                 {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns1:uGOD_MostRecentOrderEvent))then
                <ns0:mostRecentOrderEvent>
                    <ns0:orderEvent>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns1:uGOD_MostRecentOrderEvent/ns2:orderEvent) }</ns0:orderEvent>
                    <ns0:orderEventDescription>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHeader/ns1:uGOD_MostRecentOrderEvent/ns2:orderEventDescription) }</ns0:orderEventDescription>
                </ns0:mostRecentOrderEvent>
                else ""
                }
            </ns0:orderHeaderDetails>
            {
              if($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails)then
            <ns0:orderSourceDetails>
               {
               if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:orderMethod))then
                <ns0:orderMethod>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:orderMethod) }</ns0:orderMethod>
                else ""
                }
                {
                if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:partner))then
                <ns0:partner>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:partner) }</ns0:partner>
                else ""
                }
                 {
                if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:owningBusinessDivision))then
                <ns0:owningBusinessDivision>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:owningBusinessDivision) }</ns0:owningBusinessDivision>
                else ""
                }
                <ns0:sourceOfSale>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:sourceOfSale) }</ns0:sourceOfSale>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:retailerId))then
                    <ns0:retailerId>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:retailerId) }</ns0:retailerId>
                    else ""
                }
                {   
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:posBusinessUnit))then
                   <ns0:posBusinessUnit>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:posBusinessUnit) }</ns0:posBusinessUnit>
                    else ""
                   
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:storeName))then
                    <ns0:storeName>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:storeName) }</ns0:storeName>
                    else ""    
                }
                {
                   if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:storeType))then
                   
                        <ns0:storeType>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:storeType) }</ns0:storeType>
                   else ""     
                }
                {
                   if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:salesPerson))then
                   
                        <ns0:salesPerson>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:salesPerson) }</ns0:salesPerson>
                   else ""     
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:salesManager))then
                   
                        <ns0:salesManager>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:salesManager) }</ns0:salesManager>
                    else ""    
                }
                {
                   if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:csaId))then
                   
                        <ns0:csaId>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:csaId) }</ns0:csaId>
                   else ""     
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:userAlias))then
                   
                        <ns0:userAlias>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:userAlias) }</ns0:userAlias>
                        else ""
                }
                {
                   if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:callContactID))then
                   
                        <ns0:callContactID>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:callContactID) }</ns0:callContactID>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:callTypeIndicator))then
                   
                        <ns0:callTypeIndicator>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns2:callTypeIndicator) }</ns0:callTypeIndicator>
                        else ""
                }
                { 
                  if($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs)then  
                 <ns0:proofs>
                   {
                     if($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfAddress)then
                    <ns0:proofOfAddress>
                        <ns0:proofType>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfAddress/ns2:proofType) }</ns0:proofType>
                        {
                            if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfAddress/ns2:proofData))then
                            
                                <ns0:proofData>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfAddress/ns2:proofData) }</ns0:proofData>
                                else ""
                        }
                   </ns0:proofOfAddress> 
                    else ""
                    }
                    {
                     if($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfIdentity)then
                    <ns0:proofOfIdentity>
                        <ns0:proofType>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfIdentity/ns2:proofType) }</ns0:proofType>
                        {
                            if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfIdentity/ns2:proofData))then
                            
                                <ns0:proofData>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderSourceDetails/ns1:uGOD_Proofs/ns1:uGOD_ProofOfIdentity/ns2:proofData) }</ns0:proofData>
                               else "" 
                        }
                    </ns0:proofOfIdentity>
                   else ""
                   }
                   
                </ns0:proofs>
                else ""
                }
            </ns0:orderSourceDetails>
            else ""
           } 
           {
            if($utilGetOrderDetailsResp/ns1:uGOD_OrderReturnDetails)then
            <ns0:orderReturnDetails>
                <ns0:returnsOutstanding>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderReturnDetails/ns2:returnsOutstanding) }</ns0:returnsOutstanding>
                <ns0:returnReason>{ xs:integer( data($utilGetOrderDetailsResp/ns1:uGOD_OrderReturnDetails/ns2:returnReason) ) }</ns0:returnReason>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderReturnDetails/ns2:returnNotes))then
                    
                        <ns0:returnNotes>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                        else ""
                }
            </ns0:orderReturnDetails>
            else ""
            }
            {
             if(($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails)and data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails))then
               <ns0:initialPaymentDetails>
                 <ns0:cardDetails>
                    <ns0:cardNumber>{fn:concat(data($configData/masked),data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardNumberLastFourDigits))}</ns0:cardNumber>
                    <ns0:cardExpiryDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardExpiryDate) }</ns0:cardExpiryDate>
                    <ns0:cardHolderName>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardHolderName) }</ns0:cardHolderName>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardIssueDate))then
                       
                            <ns0:cardIssueDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardIssueDate) }</ns0:cardIssueDate>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardIssueNumber))then
                       
                            <ns0:cardIssueNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardIssueNumber) }</ns0:cardIssueNumber>
                           else "" 
                    }
                    <ns0:postCode>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:postcode) }</ns0:postCode>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:houseNameOrNumber))then
                       
                            <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                           else "" 
                    }
                    <ns0:bankCardIssuer>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_CardDetails/ns2:cardIssuerName) }</ns0:bankCardIssuer>
                </ns0:cardDetails>
                
                <ns0:paymentDetails>
                    <ns0:authorisationStatus>{ xs:integer( data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationStatus) ) }</ns0:authorisationStatus>
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationRespCode))then
                        
                            <ns0:authorisationRespCode>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationRespCode) }</ns0:authorisationRespCode>
                           else "" 
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationRespMessage))then
                        
                            <ns0:authorisationRespMessage>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationRespMessage) }</ns0:authorisationRespMessage>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationCode))then
                       
                            <ns0:authorisationCode>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authorisationCode) }</ns0:authorisationCode>
                        else ""
                     }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authMessage))then
                        
                            <ns0:authMessage>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:authMessage) }</ns0:authMessage>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:buynetId))then
                        
                            <ns0:buynetId>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:buynetId) }</ns0:buynetId>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:settlementRespCode))then
                        
                            <ns0:settlementRespCode>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_PaymentDetails/ns2:settlementRespCode) }</ns0:settlementRespCode>
                            else ""
                    }
                </ns0:paymentDetails>
                 <ns0:paymentMoney>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns2:paymentMoney) }</ns0:paymentMoney>
                 </ns0:initialPaymentDetails>
                
                
                 else if(($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails)and data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_TokenPaymentDetails/ns2:paymentReferenceNumber))then

                
                <ns0:initialPaymentDetails>
                <ns0:paymentReferenceNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_TokenPaymentDetails/ns2:paymentReferenceNumber) }</ns0:paymentReferenceNumber>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_TokenPaymentDetails/ns2:cardToken))then
                  
                        <ns0:cardToken>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_TokenPaymentDetails/ns2:cardToken) }</ns0:cardToken>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_TokenPaymentDetails/ns2:externalPaymentId))then
                    
                        <ns0:externalPaymentId>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns1:uGOD_TokenPaymentDetails/ns2:externalPaymentId) }</ns0:externalPaymentId>
                        else ""
                }
                 <ns0:paymentMoney>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns2:paymentMoney) }</ns0:paymentMoney>
                 </ns0:initialPaymentDetails>
                else if(($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails)and data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns2:billingAccountNumber))then

				<ns0:initialPaymentDetails>
                <ns0:billingAccountNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                 <ns0:paymentMoney>{ data($utilGetOrderDetailsResp/ns1:uGOD_InitialPaymentDetails/ns2:paymentMoney) }</ns0:paymentMoney>
			</ns0:initialPaymentDetails>
			else ""
               
            
             
            }
         {
                for $uGOD_RecurringPaymentDetails in $utilGetOrderDetailsResp/ns1:uGOD_RecurringPaymentDetails
                return
                    <ns0:recurringPaymentDetails>
                    {
                      if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount))then
                        <ns0:existingAccount>
                            <ns0:billingAccountNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                            <ns0:billingCustomerNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns2:billingCustomerNumber) }</ns0:billingCustomerNumber>
                              {
                              if($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns1:revisedDirectDebitDetails)then
                            <ns0:revisedDirectDebitDetails>
                                <ns0:userAccountNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:userAccountNumber) }</ns0:userAccountNumber>
                                {
                                    if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankAccountNumber))then
                                    
                                        <ns0:bankAccountNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankAccountNumber) }</ns0:bankAccountNumber>
                                        else ""
                                }
                                <ns0:bankSortCode>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankSortCode) }</ns0:bankSortCode>
                                <ns0:bankAccountName>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankAccountName) }</ns0:bankAccountName>
                            </ns0:revisedDirectDebitDetails>
                            else ""
                            }
                        </ns0:existingAccount>
                        else if($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount)then
                        <ns0:newAccount>
                            <ns0:billingAccountNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                            <ns0:billingCustomerNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns2:billingCustomerNumber) }</ns0:billingCustomerNumber>
                            <ns0:accountRecurringPaymentDetails>
                            {
                               if($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority)then
                                <ns0:accountContinuousCCAuthority>
                                    <ns0:cardNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardNumber) }</ns0:cardNumber>
                                    <ns0:cardExpiryDate>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardExpiryDate) }</ns0:cardExpiryDate>
                                    <ns0:cardHolderName>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardHolderName) }</ns0:cardHolderName>
                                    {
                                        if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardIssueDate))then
                                       
                                            <ns0:cardIssueDate>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardIssueDate) }</ns0:cardIssueDate>
                                           else "" 
                                    }
                                    {
                                        if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardIssueNumber))then
                                        
                                            <ns0:cardIssueNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardIssueNumber) }</ns0:cardIssueNumber>
                                            else ""
                                    }
                                    <ns0:postCode>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:postcode) }</ns0:postCode>
                                    {
                                        if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:houseNameOrNumber))then
                                       
                                            <ns0:houseNameOrNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                                            else ""
                                    }
                                    <ns0:cardType>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountContinuousCCAuthority/ns2:cardType) }</ns0:cardType>
                                </ns0:accountContinuousCCAuthority>
                                else if($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountDirectDebitDetails)then
                                <ns0:accountDirectDebitDetails>
                                    <ns0:userAccountNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountDirectDebitDetails/ns2:userAccountNumber) }</ns0:userAccountNumber>
                                    {
                                       if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountDirectDebitDetails/ns2:bankAccountNumber))then
                                       
                                            <ns0:bankAccountNumber>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountDirectDebitDetails/ns2:bankAccountNumber) }</ns0:bankAccountNumber>
                                            else ""
                                    }
                                    <ns0:bankSortCode>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountDirectDebitDetails/ns2:bankSortCode) }</ns0:bankSortCode>
                                    <ns0:bankAccountName>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns1:uGOD_AccountDirectDebitDetails/ns2:bankAccountName) }</ns0:bankAccountName>
                                </ns0:accountDirectDebitDetails>
                                else if(data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns2:continuousChequePayments))then
                                <ns0:continuousChequePayments>{ data($uGOD_RecurringPaymentDetails/ns1:uGOD_NewAccount/ns1:uGOD_AccountRecurringPaymentDetails/ns2:continuousChequePayments) }</ns0:continuousChequePayments>
                                else ""
                                }
                            </ns0:accountRecurringPaymentDetails>
                        </ns0:newAccount>
                        else ""
                        }
                    </ns0:recurringPaymentDetails>
           } 
               <ns0:orderTotalDetails>
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatTotal))then
                <ns0:vatTotal>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatTotal) }</ns0:vatTotal>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatCodeDescription))then
                <ns0:vatCodeDescription>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatCodeDescription) }</ns0:vatCodeDescription>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatReceiptRequired))then
                <ns0:vatReceiptRequired>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatReceiptRequired) }</ns0:vatReceiptRequired>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatExclusiveTotalPrice))then
                <ns0:vatExclusiveTotalPrice>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatExclusiveTotalPrice) }</ns0:vatExclusiveTotalPrice>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatReceiptProduced))then
                <ns0:vatReceiptProduced>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:vatReceiptProduced) }</ns0:vatReceiptProduced>
                else ""
                }
                <ns0:total>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderTotalDetails/ns2:total) }</ns0:total>
            </ns0:orderTotalDetails>  
            {
                for $uGOD_SaleProd in $utilGetOrderDetailsResp/ns1:uGOD_SaleProd
                return
                    <ns0:saleableProductDetails>
                        <ns0:saleableProductLineNumber>{ data($uGOD_SaleProd/ns2:saleableProductLineNumber) }</ns0:saleableProductLineNumber>
                        <ns0:saleableProductId>{ data($uGOD_SaleProd/ns2:saleableProductId) }</ns0:saleableProductId>
                        <ns0:saleableProductName>{ data($uGOD_SaleProd/ns2:saleableProductName) }</ns0:saleableProductName>
                        <ns0:saleableProductPrice>{ data($uGOD_SaleProd/ns2:saleableProductPrice) }</ns0:saleableProductPrice>
                        <ns0:originalPrice>{ data($uGOD_SaleProd/ns2:originalPrice) }</ns0:originalPrice>
                        <ns0:vatDetails>
                            <ns0:vatRate>{ data($uGOD_SaleProd/ns1:uGOD_VatDetails/ns2:vatRate) }</ns0:vatRate>
                            <ns0:vatAmount>{ data($uGOD_SaleProd/ns1:uGOD_VatDetails/ns2:vatAmount) }</ns0:vatAmount>
                             {
                              if(data($uGOD_SaleProd/ns1:uGOD_VatDetails/ns2:vatExclusivePrice))then
                            <ns0:vatExclusivePrice>{ data($uGOD_SaleProd/ns1:uGOD_VatDetails/ns2:vatExclusivePrice) }</ns0:vatExclusivePrice>
                            else ""
                            }
                            {
                             if(data($uGOD_SaleProd/ns1:uGOD_VatDetails/ns2:vatReversalReceiptStatus))then
                            <ns0:vatReversalReceiptStatus>{ data($uGOD_SaleProd/ns1:uGOD_VatDetails/ns2:vatReversalReceiptStatus) }</ns0:vatReversalReceiptStatus>
                            else ""
                            }
                        </ns0:vatDetails>
                        
                        {
                            if(data($uGOD_SaleProd/ns2:billingAccountNumber))then
                            
                                <ns0:billingAccountNumber>{ data($uGOD_SaleProd/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                                else ""
                        }
                        {
                            if(data($uGOD_SaleProd/ns2:billingCrossChargeAccountNumber))then
                            
                                <ns0:billingCrossChargeAccountNumber>{ data($uGOD_SaleProd/ns2:billingCrossChargeAccountNumber) }</ns0:billingCrossChargeAccountNumber>
                                else ""
                        }
                        {
                         if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct))then
                        <ns0:assignedProduct>
                          {
                                for $uGOD_ACC in $uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_ACC
                                return
                                    <ns0:accessoryDetails>
                                        <ns0:category>{ data($uGOD_ACC/ns2:category) }</ns0:category>
                                        {
                                           if(data($uGOD_ACC/ns2:groupId))then
                                           
                                                <ns0:groupId>{ data($uGOD_ACC/ns2:groupId) }</ns0:groupId>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_ACC/ns2:dispatchMethod))then
                                            
                                                <ns0:dispatchMethod>{ data($uGOD_ACC/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                                else ""
                                        }
                                        <ns0:productId>{ data($uGOD_ACC/ns2:productId) }</ns0:productId>
                                        <ns0:productName>{ data($uGOD_ACC/ns2:productName) }</ns0:productName>
                                        <ns0:assignedProductNumber>{ data($uGOD_ACC/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                        {
                                            if(data($uGOD_ACC/ns2:make))then
                                            
                                                <ns0:make>{ data($uGOD_ACC/ns2:make) }</ns0:make>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_ACC/ns2:model))then
                                          
                                                <ns0:model>{ data($uGOD_ACC/ns2:model) }</ns0:model>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_ACC/ns2:risk))then
                                            
                                                <ns0:risk>{ data($uGOD_ACC/ns2:risk) }</ns0:risk>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_ACC/ns2:skuId))then
                                            
                                                <ns0:skuId>{ data($uGOD_ACC/ns2:skuId) }</ns0:skuId>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_ACC/ns2:skuName))then
                                            
                                                <ns0:skuName>{ data($uGOD_ACC/ns2:skuName) }</ns0:skuName>
                                                else ""
                                        }
                                        {
                                           if(data($uGOD_ACC/ns2:serialNumber))then
                                          
                                                <ns0:serialNumber>{ data($uGOD_ACC/ns2:serialNumber) }</ns0:serialNumber>
                                                else ""
                                                
                                        }
                                        {
                                            if(data($uGOD_ACC/ns2:imei))then
                                          
                                                <ns0:imei>{ data($uGOD_ACC/ns2:imei) }</ns0:imei>
                                                else ""
                                                
                                        }
                                        <ns0:dispatchStatus>{ data($uGOD_ACC/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                        {
                                            if(data($uGOD_ACC/ns2:orderProductPrice))then
                                            
                                                <ns0:orderProductPrice>{ data($uGOD_ACC/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                                else ""
                                                                                        }
                                        {
                                         if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails))then
                                        <ns0:replacementReturnDetails>
                                            <ns0:orderNumberBeingReturned>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                            <ns0:returnSaleableProductLineNumber>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                            <ns0:returnAssignedProductNumber>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                             {
                                             if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode))then
                                            <ns0:returnReasonCode>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            else ""
                                             }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                               
                                                    <ns0:returnReasonSubTypeCode>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                               if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                                
                                                    <ns0:returnReasonOutOfPolicyUserName>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                                
                                                    <ns0:returnAuthorisationNumber>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes))then
                                               
                                                    <ns0:returnNotes>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                            {
                                               if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                               
                                                    <ns0:replacementPolicyId>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                               
                                                    <ns0:replacementPolicySOACode>{ data($uGOD_ACC/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:replacementReturnDetails>
                                        else ""
                                        }
                                        {
                                        if($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails)then
                                      
                                        <ns0:assignedProdReturnDetails>
                                            <ns0:returnReasonCode>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            <ns0:returnReasonDescription>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                               
                                                    <ns0:returnReasonSubTypeCode>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                                
                                                    <ns0:returnReasonSubTypeDescription>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod))then
                                                
                                                    <ns0:replacementMethod>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                                    else " "
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes))then
                                                
                                                    <ns0:returnNotes>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                            {
                                               if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition))then
                                                
                                                    <ns0:returnCondition>{ xs:integer( data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                               
                                                    <ns0:returnTimestamp>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                               
                                                    <ns0:returnAuthorisationNumber>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                               
                                                    <ns0:replacedByOrderNumber>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                                
                                                    <ns0:replacedByOrderLineNumber>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                                
                                                    <ns0:replacedByOrderAssignProdNumber>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                                
                                                    <ns0:replacementPolicyId>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                                
                                                    <ns0:replacementPolicySOACode>{ data($uGOD_ACC/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:assignedProdReturnDetails>
                                        else ""
                                        }
                                    </ns0:accessoryDetails>
                            }
                             {
                                for $uGOD_ADJ in $uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_ADJ
                                return
                                    <ns0:adjustmentDetails>
                                        <ns0:productId>{ data($uGOD_ADJ/ns2:productId) }</ns0:productId>
                                        {
                                            if(data($uGOD_ADJ/ns2:groupId))then
                                           
                                                <ns0:groupId>{ data($uGOD_ADJ/ns2:groupId) }</ns0:groupId>
                                                else ""
                                        }
                                        <ns0:productName>{ data($uGOD_ADJ/ns2:productName) }</ns0:productName>
                                        <ns0:creditOrDebit>{ data($uGOD_ADJ/ns2:creditOrDebit) }</ns0:creditOrDebit>
                                        <ns0:adjustmentAmount>{ data($uGOD_ADJ/ns2:adjustmentAmount) }</ns0:adjustmentAmount>
                                        <ns0:adjustmentReason>{ data($uGOD_ADJ/ns2:adjustmentReason) }</ns0:adjustmentReason>
                                        {
                                            if(data($uGOD_ADJ/ns2:adjustmentCircumstances))then
                                          
                                                <ns0:adjustmentCircumstances>{ data($uGOD_ADJ/ns2:adjustmentCircumstances) }</ns0:adjustmentCircumstances>
                                                else ""
                                        }
                                    </ns0:adjustmentDetails>
                            } 
                            {
                              if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN))then
                              <ns0:handsetDetails>
                                 <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:dispatchMethod))then
                                    
                                        <ns0:dispatchMethod>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                        else ""
                                }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                 {
                                 if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:handsetMake))then
                                <ns0:make>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:handsetMake) }</ns0:make>
                                else ""
                                }
                                {
                                if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:handsetModel))then
                                <ns0:model>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:handsetModel) }</ns0:model>
                                else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:handsetRisk))then
                                    
                                        <ns0:risk>{ xs:short( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:handsetRisk) ) }</ns0:risk>
                                        else ""
                                }
                                {
                                   if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:skuId))then
                                   
                                        <ns0:skuId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:skuId) }</ns0:skuId>
                                        else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:skuName))then
                                    
                                        <ns0:skuName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:skuName) }</ns0:skuName>
                                     else ""   
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:imei))then
                                   
                                        <ns0:imei>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:imei) }</ns0:imei>
                                        else ""
                                }
                                <ns0:dispatchStatus>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                 }
                                {
                                 if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails))then
                                <ns0:replacementReturnDetails>
                                    <ns0:orderNumberBeingReturned>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                    <ns0:returnSaleableProductLineNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                    <ns0:returnAssignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                    {
                                     if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode))then
                                    <ns0:returnReasonCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                       
                                            <ns0:returnReasonOutOfPolicyUserName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes))then
                                       
                                            <ns0:returnNotes>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                       
                                            <ns0:replacementPolicyId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                            
                                    }
                                </ns0:replacementReturnDetails>
                                else " "
                                }
                                {
                                 if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails))then
                                <ns0:assignedProdReturnDetails>
                                    <ns0:returnReasonCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    <ns0:returnReasonDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                       
                                            <ns0:returnReasonSubTypeDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod))then
                                       
                                            <ns0:replacementMethod>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes))then
                                       
                                            <ns0:returnNotes>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition))then
                                        
                                            <ns0:returnCondition>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                        
                                            <ns0:returnTimestamp>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                        
                                            <ns0:replacedByOrderNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                            else ""
                                    }
                                    {
                                       if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                       
                                            <ns0:replacedByOrderLineNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                       
                                            <ns0:replacedByOrderAssignProdNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                        
                                            <ns0:replacementPolicyId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                    }
                                </ns0:assignedProdReturnDetails>
                                else " "
                                }
                                {
                                 if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails))then
                                <ns0:CCADetails>
                                    <ns0:CCANumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns2:CCANumber) }</ns0:CCANumber>
                                    <ns0:CCAFinancialDetails>
                                        <ns0:hardwareDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:hardwareDescription) }</ns0:hardwareDescription>
                                        <ns0:hardwareRRP>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:hardwareRRP) ) }</ns0:hardwareRRP>
                                        <ns0:downPayment>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:downPayment) ) }</ns0:downPayment>
                                        <ns0:instalment>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:installment) ) }</ns0:instalment>
                                       
                                       {
									  if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo)) then   
              								
												if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo/ns0:parameterName)= data($configData/refreshFinalPayment)) then
				
												if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:finalPayment)) then
    						<ns0:refreshFinalPayment>
							{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:finalPayment) }
	
							</ns0:refreshFinalPayment>
											else ""
                  
									else ""							
								else ""		
										}	
											
                                        <ns0:term>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:term) ) }</ns0:term>
                                        <ns0:totalCredit>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:totalCredit) ) }</ns0:totalCredit>
                                   
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:tariffDiscount))then
                                            
                                                <ns0:tariffDiscount>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:tariffDiscount) ) }</ns0:tariffDiscount>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:discretionaryDiscount))then
                                            
                                                <ns0:discretionaryDiscount>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCAFinancials/ns2:discretionaryDiscount) ) }</ns0:discretionaryDiscount>
                                                else ""
                                        }
                                    </ns0:CCAFinancialDetails>
                                    <ns0:CCACustomerDetails>
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:partyTitle))then
                                            
                                                <ns0:title>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:partyTitle) }</ns0:title>
                                                else ""
                                        }
                                        <ns0:forename>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:partyForename) }</ns0:forename>
                                        <ns0:lastname>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:partySurname) }</ns0:lastname>
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:addressHouseName))then
                                            
                                                <ns0:addressHouseName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:addressHouseName) }</ns0:addressHouseName>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:addressHouseNumber))then
                                            
                                                <ns0:addressHouseNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:addressHouseNumber) }</ns0:addressHouseNumber>
                                                else ""
                                        }
                                        <ns0:address1stLine>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address1stLine) }</ns0:address1stLine>
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address2ndLine))then
                                            
                                                <ns0:address2ndLine>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address2ndLine) }</ns0:address2ndLine>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address3rdLine))then
                                            
                                                <ns0:address3rdLine>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address3rdLine) }</ns0:address3rdLine>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address4thLine))then
                                           
                                                <ns0:address4thLine>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:address4thLine) }</ns0:address4thLine>
                                                else ""
                                        }
                                        <ns0:postCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:postcode) }</ns0:postCode>
                                        <ns0:postalCountry>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_HAN/ns1:uGOD_CCADetails/ns1:uGOD_CCACustomerDetails/ns2:postalCountry) }</ns0:postalCountry>
                                    </ns0:CCACustomerDetails>
                                </ns0:CCADetails>
                                else " "
                                }
                              </ns0:handsetDetails>
                              else ""
                            } 
                             {
                                for $uGOD_LIT in $uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_LIT
                                return
                                    <ns0:literatureDetails>
                                        <ns0:category>{ data($uGOD_LIT/ns2:category) }</ns0:category>
                                        {
                                            if(data($uGOD_LIT/ns2:groupId))then
                                            
                                                <ns0:groupId>{ data($uGOD_LIT/ns2:groupId) }</ns0:groupId>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_LIT/ns2:dispatchMethod))then
                                            
                                                <ns0:dispatchMethod>{ data($uGOD_LIT/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                                else ""
                                        }
                                        <ns0:productId>{ data($uGOD_LIT/ns2:productId) }</ns0:productId>
                                        <ns0:productName>{ data($uGOD_LIT/ns2:productName) }</ns0:productName>
                                        <ns0:assignedProductNumber>{ data($uGOD_LIT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                        {
                                            if(data($uGOD_LIT/ns2:skuId))then
                                            
                                                <ns0:skuId>{ data($uGOD_LIT/ns2:skuId) }</ns0:skuId>
                                                else ""
                                        }
                                        {
                                            if(data($uGOD_LIT/ns2:skuName))then
                                           
                                                <ns0:skuName>{ data($uGOD_LIT/ns2:skuName) }</ns0:skuName>
                                                else ""
                                        }
                                        <ns0:dispatchStatus>{ data($uGOD_LIT/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                        {
                                         if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails))then
                                        <ns0:replacementReturnDetails>
                                            <ns0:orderNumberBeingReturned>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                            <ns0:returnSaleableProductLineNumber>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                            <ns0:returnAssignedProductNumber>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                            {
                                             if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode))then
                                            <ns0:returnReasonCode>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                               
                                                    <ns0:returnReasonSubTypeCode>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                                
                                                    <ns0:returnReasonOutOfPolicyUserName>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                                    else""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                                
                                                    <ns0:returnAuthorisationNumber>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes))then
                                                
                                                    <ns0:returnNotes>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                             {
                                               if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                                
                                                    <ns0:replacementPolicyId>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                             }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                                
                                                    <ns0:replacementPolicySOACode>{ data($uGOD_LIT/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:replacementReturnDetails>
                                        else ""
                                        }
                                        {
                                         if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails))then
                                        <ns0:assignedProdReturnDetails>
                                            <ns0:returnReasonCode>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            <ns0:returnReasonDescription>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                                
                                                    <ns0:returnReasonSubTypeCode>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                                
                                                    <ns0:returnReasonSubTypeDescription>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod))then
                                                
                                               
                                                    <ns0:replacementMethod>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                                    else " "
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes))then
                                               
                                                    <ns0:returnNotes>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition))then
                                                
                                                    <ns0:returnCondition>{ xs:integer( data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                             
                                                    <ns0:returnTimestamp>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                                    else ""
                                            }
                                            {
                                               if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                               
                                                    <ns0:returnAuthorisationNumber>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                               
                                                    <ns0:replacedByOrderNumber>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                                
                                                    <ns0:replacedByOrderLineNumber>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                                    else " "
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                            
                                                    <ns0:replacedByOrderAssignProdNumber>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                                
                                                    <ns0:replacementPolicyId>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                            }
                                            {
                                                if(data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                                
                                                    <ns0:replacementPolicySOACode>{ data($uGOD_LIT/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:assignedProdReturnDetails>
                                        else ""
                                        }
                                    </ns0:literatureDetails>
                            }
                            { 
                             if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS)then
                            <ns0:postPaySimDetails>
                                <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                {
                                   if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:dispatchMethod))then
                                   
                                        <ns0:dispatchMethod>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                        else ""
                                }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:msisdn))then
                                    
                                        <ns0:msisdn>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:msisdn) }</ns0:msisdn>
                                        else ""
                                }
                                {
                                 if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails)then
                                <ns0:migratePortInDetails>
                                {
                                if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns2:instantMigration))then
                                    <ns0:instantMigration>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns2:instantMigration) }</ns0:instantMigration>
                                    else if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns1:uGOD_PortIn))then
                                    <ns0:portIn>
                                        <ns0:pac>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns1:uGOD_PortIn/ns2:pac) }</ns0:pac>
                                        <ns0:newMSISDN>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns1:uGOD_PortIn/ns2:newMSISDN) }</ns0:newMSISDN>
                                        {
                                            if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns1:uGOD_PortIn/ns2:pacExpiry))then
                                            
                                                <ns0:pacExpiry>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_migratePortInDetails/ns1:uGOD_PortIn/ns2:pacExpiry) }</ns0:pacExpiry>
                                                else ""
                                        }
                                    </ns0:portIn>
                                    else ""
                                    }
                                </ns0:migratePortInDetails>
                                else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:skuId))then
                                   
                                        <ns0:skuId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:skuId) }</ns0:skuId>
                                        else""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:skuName))then
                                   
                                        <ns0:skuName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:skuName) }</ns0:skuName>
                                        else""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:ssn))then
                                   
                                        <ns0:ssn>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:ssn) }</ns0:ssn>
                                        else ""
                                }
                                <ns0:dispatchStatus>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                                {
                                 if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails)then
                                <ns0:replacementReturnDetails>
                                    <ns0:orderNumberBeingReturned>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                    <ns0:returnSaleableProductLineNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                    <ns0:returnAssignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                    {
                                      if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode))then
                                      <ns0:returnReasonCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                      else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                        
                                            <ns0:returnReasonOutOfPolicyUserName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                            else ""
            
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                      
                                            <ns0:returnAuthorisationNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes))then
                                       
                                            <ns0:returnNotes>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                        
                                            <ns0:replacementPolicyId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                    }
                                </ns0:replacementReturnDetails>
                                else ""
                                }
                                {
                                 if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails)then
                                <ns0:assignedProdReturnDetails>
                                    <ns0:returnReasonCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    <ns0:returnReasonDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                       
                                            <ns0:returnReasonSubTypeDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                            else""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod))then
                                        
                                            <ns0:replacementMethod>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                            else ""
                                    }
                                    {
                                        for $returnNotes in $uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes
                                        return
                                            <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition))then
                                       
                                            <ns0:returnCondition>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                        
                                            <ns0:returnTimestamp>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                        
                                            <ns0:replacedByOrderNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                       
                                            <ns0:replacedByOrderLineNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                       
                                            <ns0:replacedByOrderAssignProdNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                       
                                            <ns0:replacementPolicyId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                        
                                    }
                                </ns0:assignedProdReturnDetails>
                                else ""
                                }
                            </ns0:postPaySimDetails>
                         else ""
                         }
                         {
                          if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT)then
                          <ns0:postPayTariffDetails>
                                <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:groupId) }</ns0:groupId>
                                        else ""
                                 }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:productName) }</ns0:productName>
                                {
								if(data($referenceDetailsResp))then
								<ns0:productDescription>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/tariffs/TariffProduct[longProductId=data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:productId)]/description)}</ns0:productDescription>
								else ""
								}
								{
								if(data($referenceDetailsResp))then
								<ns0:productClassification>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/tariffs/TariffProduct[longProductId=data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:productId)]/classification)}</ns0:productClassification>
                                else ""
								}
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    for $uGOD_TAM in $uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns1:uGOD_TAM
                                    return
                                        <ns0:additionalServiceDetails>
                                            <ns0:productId>{ data($uGOD_TAM/ns2:productId) }</ns0:productId>
                                            <ns0:productName>{ data($uGOD_TAM/ns2:productName) }</ns0:productName>
                                                        {
								if(data($referenceDetailsResp))then
								<ns0:productDescription>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/boltons/BoltonProduct[longProductId=data($uGOD_TAM/ns2:productId)]/description)}</ns0:productDescription>
								else ""
								}
								{
								if(data($referenceDetailsResp))then
								<ns0:productClassification>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/boltons/BoltonProduct[longProductId=data($uGOD_TAM/ns2:productId)]/classification)}</ns0:productClassification>
                                else ""
								}
                                            <ns0:assignedProductNumber>{ data($uGOD_TAM/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                            {
                                                if(data($uGOD_TAM/ns2:orderProductCharge))then
                                               
                                                    <ns0:orderProductCharge>{ data($uGOD_TAM/ns2:orderProductCharge) }</ns0:orderProductCharge>
                                                    else ""
                                            }
                                            
                                            {
				 								 if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo)) then   
              										if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo/ns0:parameterName)= data($configData/additionalPromotions)) then
				
															if(data($uGOD_TAM/ns2:promotionId)) then
    															<ns0:promotionId>
																	{ xs:integer(data($uGOD_TAM/ns2:promotionId) ) }
	
																</ns0:promotionId>
															else ""
                  
														else ""							
												else ""		
											}		
                                        </ns0:additionalServiceDetails>
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:orderProductCharge))then
                                    
                                        <ns0:orderProductCharge>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:orderProductCharge) }</ns0:orderProductCharge>
                                        else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:contractTerm))then
                                  
                                        <ns0:contractTerm>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:contractTerm) ) }</ns0:contractTerm>
                                        else ""
                                }
                                <ns0:dataServiceGeneration>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:dataServiceGeneration) }</ns0:dataServiceGeneration>
                                <ns0:tariffType>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POT/ns2:tariffType) }</ns0:tariffType>
                            </ns0:postPayTariffDetails>
                            else ""
                            }
                            {
                             if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS)then
                             <ns0:prePaySimDetails>
                                <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:dispatchMethod))then
                                   
                                        <ns0:dispatchMethod>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                        else ""
                                }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:msisdn))then
                                    
                                        <ns0:msisdn>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:msisdn) }</ns0:msisdn>
                                        else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:skuId))then
                                   
                                        <ns0:skuId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:skuId) }</ns0:skuId>
                                        else " "
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:skuName))then
                                   
                                        <ns0:skuName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:skuName) }</ns0:skuName>
                                        else ""
                                }
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:ssn))then
                                    
                                        <ns0:ssn>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:ssn) }</ns0:ssn>
                                        else ""
                                }
                                <ns0:dispatchStatus>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                {
                                   if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                                {
                                 if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:orderNumberBeingReturned)then
                                <ns0:replacementReturnDetails>
                                    <ns0:orderNumberBeingReturned>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                    <ns0:returnSaleableProductLineNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                    <ns0:returnAssignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                    {
                                     if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode))then
                                     <ns0:returnReasonCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                     else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                        
                                            <ns0:returnReasonOutOfPolicyUserName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes))then
                                        
                                            <ns0:returnNotes>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                       
                                            <ns0:replacementPolicyId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else " "
                                    }
                                </ns0:replacementReturnDetails>
                                else ""
                                }
                                {
                                 if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails)then
                                <ns0:assignedProdReturnDetails>
                                    <ns0:returnReasonCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    <ns0:returnReasonDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                        
                                            <ns0:returnReasonSubTypeDescription>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod))then
                                        
                                            <ns0:replacementMethod>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes))then
                                        
                                            <ns0:returnNotes>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition))then
                                       
                                            <ns0:returnCondition>{ xs:integer( data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                        
                                            <ns0:returnTimestamp>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                            else ""
                                    }
                                     {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                     }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                        
                                            <ns0:replacedByOrderNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                        
                                            <ns0:replacedByOrderLineNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                        
                                            <ns0:replacedByOrderAssignProdNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                        
                                            <ns0:replacementPolicyId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRS/ns1:uGOD_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                    }
                                </ns0:assignedProdReturnDetails>
                                else ""
                                }
                            </ns0:prePaySimDetails>
                            else ""
                            
                            }
                            {
                              if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT)then
                              <ns0:prePayTariffDetails>
                                <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_PRT/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                            </ns0:prePayTariffDetails>
                            else ""
                            }
                            {
                             if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO)then
                             <ns0:chargeableDeliveryDetails>
                                <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:groupId) }</ns0:groupId>
                                        else""
                                }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_CDO/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                            </ns0:chargeableDeliveryDetails>
                            else ""
                            }
                            
(: 05/10/2017       1.0.4       Megha N             Added "postPayInsurance" details as part of Live issue Fix :)
                            
                            {		
                          
                          	if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POI)then
                              for $uGOD_POI in $uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_POI
									return
                               <ns0:postPayInsuranceDetails>
                                <ns0:category>{ data($uGOD_POI/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_POI/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGOD_POI/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                <ns0:productId>{ data($uGOD_POI/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_POI/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_POI/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGOD_POI/ns2:imei))then
                                    
                                        <ns0:imei>{ data($uGOD_POI/ns2:imei) }</ns0:imei>
                                        else "" 
                                }
                                {
                                    if(data($uGOD_POI/ns2:msisdn))then
                                   
                                        <ns0:msisdn>{ data($uGOD_POI/ns2:msisdn) }</ns0:msisdn>
                                     else ""   
                                }
                                {
                                    if(data($uGOD_POI/ns2:serialNumber))then
                                    
                                        <ns0:serialNumber>{ data($uGOD_POI/ns2:serialNumber) }</ns0:serialNumber>
                                    else ""    
                                }
                                {
                                 if(data($uGOD_POI/ns1:uGOD_CancelExistingInsurance/ns2:insuranceEndDate))then
                                <ns0:cancelExistingInsurance>
                                    <ns0:insuranceEndDate>{ data($uGOD_POI/ns1:uGOD_CancelExistingInsurance/ns2:insuranceEndDate) }</ns0:insuranceEndDate>
                                </ns0:cancelExistingInsurance>
                                else 
                                <ns0:addNewInsurance>
                                    <ns0:assignedProductBillingFreq>{ data($uGOD_POI/ns1:uGOD_AddNewInsurance/ns2:assignedProductBillingFreq) }</ns0:assignedProductBillingFreq>
                                </ns0:addNewInsurance>
                                }
                                {
                                 if(data($uGOD_POI/ns2:orderProductPrice))then
                                <ns0:orderProductPrice>{ data($uGOD_POI/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                else 
                                <ns0:orderProductCharge>{ data($uGOD_POI/ns2:orderProductCharge) }</ns0:orderProductCharge>
                              }
                            </ns0:postPayInsuranceDetails>
                            else ""
                            }
                          {
                           if($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC)then
                           <ns0:standardDeliveryDetails>
                                <ns0:category>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:category) }</ns0:category>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:groupId))then
                                   
                                        <ns0:groupId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:groupId) }</ns0:groupId>
                                        else""
                                }
                                <ns0:productId>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGOD_SaleProd/ns1:uGOD_AssignedProduct/ns1:uGOD_SDC/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                            </ns0:standardDeliveryDetails>
                            else ""
                          }
                        </ns0:assignedProduct>
                        else ""
                        }
                        
              (:Added uGOD_Promotion details as part of Promotions and Airtime Discounts Project:) 
                        
           {
              if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo)) then  
				
				if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo/ns0:parameterName)= data($configData/additionalPromotions)) then
				
				if(($uGOD_SaleProd/ns1:uGOD_Promotion))then
				
				for $uGOD_Promotion in $uGOD_SaleProd/ns1:uGOD_Promotion
                return 
				
				<ns0:promotions>
				
				
				<ns0:promotionToken>{data($uGOD_Promotion/ns2:promotionToken)}</ns0:promotionToken>
				
				<ns0:promotionId>{data($uGOD_Promotion/ns2:promotionId)}</ns0:promotionId>
			   
				<ns0:promotionDescription>{data($uGOD_Promotion/ns2:promotionDescription)}</ns0:promotionDescription>  
				
				<ns0:promotionName>{data($uGOD_Promotion/ns2:promotionName)}</ns0:promotionName>
				
				<ns0:status>{data($uGOD_Promotion/ns2:status)}</ns0:status>
			   
				<ns0:createdTimestamp>{data($uGOD_Promotion/ns2:createdTimestamp)}</ns0:createdTimestamp>  
				
				{
				if(data($uGOD_Promotion/ns2:consumedTimestamp))then
				<ns0:consumedTimestamp>{data($uGOD_Promotion/ns2:consumedTimestamp)}</ns0:consumedTimestamp>
				else ""
			   }	
			  
			
			   {
				if(data($uGOD_Promotion/ns2:orderNumber))then
				<ns0:orderNumber>{data($uGOD_Promotion/ns2:orderNumber)}</ns0:orderNumber>
				else ""
			   }	
	
				{
				if(data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails))then
				
				<ns0:handsetTradeInDetails>
				
				<ns0:tradeInAmount>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns2:tradeInAmount)}</ns0:tradeInAmount>
				
				<ns0:expectedHandset>
				
				<ns0:handsetMake>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_ExpectedHandset/ns2:handsetMake)}</ns0:handsetMake>
				<ns0:handsetModel>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_ExpectedHandset/ns2:handsetModel)}</ns0:handsetModel>
				</ns0:expectedHandset>
				
				{
				if(data($uGOD_SaleProd/ns1:uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails)) then
				
				<ns0:recyclingPartnerDetails>
				
				<ns0:handsetMake>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:handsetMake)}</ns0:handsetMake>
				<ns0:handsetModel>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:handsetModel)}</ns0:handsetModel>
				<ns0:imei>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:imei)}</ns0:imei>
				<ns0:deviceValuation>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:deviceValuation)}</ns0:deviceValuation>
				<ns0:receivedDate>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:receivedDate)}</ns0:receivedDate>
				<ns0:tradeInReference>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:tradeInReference)}</ns0:tradeInReference>
				
				
				</ns0:recyclingPartnerDetails>
				
				else ""
				}
				
				{
				if(data($uGOD_SaleProd/ns1:uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_StoreReturnDetails))then
				
				<ns0:storeReturnDetails>
				
				<ns0:storeNumber>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_StoreReturnDetails/ns2:storeNumber)}</ns0:storeNumber>
				
				<ns0:storeReceivedTimestamp>{data($uGOD_Promotion/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_StoreReturnDetails/ns2:storeReceivedTimestamp)}</ns0:storeReceivedTimestamp>
				
				</ns0:storeReturnDetails>
				
				else ""
				
				}
				</ns0:handsetTradeInDetails>
				 
				
				else ""
				}
				</ns0:promotions>
				
				else ""	
			else ""							
else ""		
}	
      </ns0:saleableProductDetails>   
            }  
           {  
             if(($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails) and data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_ChargeableDeliveryOption))then 
             <ns0:deliveryDetails>
               <ns0:chargeableDeliveryOption>
                    <ns0:deliveryDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_ChargeableDeliveryOption/ns2:deliveryDate) }</ns0:deliveryDate>
                    <ns0:timeslot>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_ChargeableDeliveryOption/ns2:timeslot) }</ns0:timeslot>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_ChargeableDeliveryOption/ns2:despatchDate))then
                        
                            <ns0:despatchDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_ChargeableDeliveryOption/ns2:despatchDate) }</ns0:despatchDate>
                            else ""
                    }
                </ns0:chargeableDeliveryOption>
				 {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:requestedCarrier))then
                   
                        <ns0:requestedCarrier>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:requestedCarrier) }</ns0:requestedCarrier>
                      else ""  
                 }
                <ns0:destinationName>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:destinationName) }</ns0:destinationName>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:deliveryContactNumber))then
                    
                        <ns0:deliveryContactNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:deliveryContactNumber) }</ns0:deliveryContactNumber>
                        else ""
                }
				
                {
                  if($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress)then
                <ns0:standardAddress>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:addressStatus))then
                       
                            <ns0:addressStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber))then
                       
                            <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:street))then
                       
                            <ns0:street>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:street) }</ns0:street>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:city))then
                        
                            <ns0:city>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:city) }</ns0:city>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:county))then
                        
                            <ns0:county>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:county) }</ns0:county>
                            else ""
                    }
                    <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                    <ns0:postcode>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                </ns0:standardAddress>
                else ""
                }
                <ns0:deliveryAddressModified>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:deliveryAddressModified) }</ns0:deliveryAddressModified>
               {
                if($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_StoreDetails)then
                <ns0:storeDetails>
                    <ns0:storeNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_StoreDetails/ns2:storeNumber) }</ns0:storeNumber>
                    <ns0:storeName>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_StoreDetails/ns2:storeName) }</ns0:storeName>
                </ns0:storeDetails>
                else ""
                }
                {
                    for $uGOD_DespatchDetails in $utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_DespatchDetails
                    return
                        <ns0:despatchDetails>
                            {
                                if(data($uGOD_DespatchDetails/ns2:parcelNumber))then
                                
                                    <ns0:parcelNumber>{ data($uGOD_DespatchDetails/ns2:parcelNumber) }</ns0:parcelNumber>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:actualCarrier))then
                                
                                    <ns0:actualCarrier>{ data($uGOD_DespatchDetails/ns2:actualCarrier) }</ns0:actualCarrier>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:actualServiceType))then
                                
                                    <ns0:actualServiceType>{ data($uGOD_DespatchDetails/ns2:actualServiceType) }</ns0:actualServiceType>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:despatchDate))then
                                
                                    <ns0:despatchDate>{ data($uGOD_DespatchDetails/ns2:despatchDate) }</ns0:despatchDate>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:despatchReference))then
                               
                                    <ns0:despatchReference>{ data($uGOD_DespatchDetails/ns2:despatchReference) }</ns0:despatchReference>
                                    else " "
                            }
                            {
                               if(data($uGOD_DespatchDetails/ns2:storeReceivedTimestamp))then
                                
                                    <ns0:storeReceivedTimestamp>{ data($uGOD_DespatchDetails/ns2:storeReceivedTimestamp) }</ns0:storeReceivedTimestamp>
                                    else ""
                            }
                            {
                               if(data($uGOD_DespatchDetails/ns2:customerCollectedTimestamp))then
                                
                                    <ns0:customerCollectedTimestamp>{ data($uGOD_DespatchDetails/ns2:customerCollectedTimestamp) }</ns0:customerCollectedTimestamp>
                                    else " "
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:storeReturnedTimestamp))then
                                
                                    <ns0:storeReturnedTimestamp>{ data($uGOD_DespatchDetails/ns2:storeReturnedTimestamp) }</ns0:storeReturnedTimestamp>
                                    else ""
                            }
                        </ns0:despatchDetails>
                }
            </ns0:deliveryDetails>
            else if(($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails) and data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:isStandardDeliveryOption))then 
			
			<ns0:deliveryDetails>
                 <ns0:isStandardDeliveryOption>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:isStandardDeliveryOption) }</ns0:isStandardDeliveryOption>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:requestedCarrier))then
                   
                        <ns0:requestedCarrier>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:requestedCarrier) }</ns0:requestedCarrier>
                      else ""  
                }
                <ns0:destinationName>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:destinationName) }</ns0:destinationName>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:deliveryContactNumber))then
                    
                        <ns0:deliveryContactNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:deliveryContactNumber) }</ns0:deliveryContactNumber>
                        else ""
                }
                
				
                
                 {
                  if($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress)then
                <ns0:standardAddress>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:addressStatus))then
                       
                            <ns0:addressStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber))then
                       
                            <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:street))then
                       
                            <ns0:street>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:street) }</ns0:street>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:city))then
                        
                            <ns0:city>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:city) }</ns0:city>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:county))then
                        
                            <ns0:county>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:county) }</ns0:county>
                            else ""
                    }
                    <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                    <ns0:postcode>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                </ns0:standardAddress>
                else ""
                }
                <ns0:deliveryAddressModified>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns2:deliveryAddressModified) }</ns0:deliveryAddressModified>
               {
                if($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_StoreDetails)then
                <ns0:storeDetails>
                    <ns0:storeNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_StoreDetails/ns2:storeNumber) }</ns0:storeNumber>
                    <ns0:storeName>{ data($utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_StoreDetails/ns2:storeName) }</ns0:storeName>
                </ns0:storeDetails>
                else ""
                }
                {
                    for $uGOD_DespatchDetails in $utilGetOrderDetailsResp/ns1:uGOD_DeliveryDetails/ns1:uGOD_DespatchDetails
                    return
                        <ns0:despatchDetails>
                            {
                                if(data($uGOD_DespatchDetails/ns2:parcelNumber))then
                                
                                    <ns0:parcelNumber>{ data($uGOD_DespatchDetails/ns2:parcelNumber) }</ns0:parcelNumber>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:actualCarrier))then
                                
                                    <ns0:actualCarrier>{ data($uGOD_DespatchDetails/ns2:actualCarrier) }</ns0:actualCarrier>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:actualServiceType))then
                                
                                    <ns0:actualServiceType>{ data($uGOD_DespatchDetails/ns2:actualServiceType) }</ns0:actualServiceType>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:despatchDate))then
                                
                                    <ns0:despatchDate>{ data($uGOD_DespatchDetails/ns2:despatchDate) }</ns0:despatchDate>
                                    else ""
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:despatchReference))then
                               
                                    <ns0:despatchReference>{ data($uGOD_DespatchDetails/ns2:despatchReference) }</ns0:despatchReference>
                                    else " "
                            }
                            {
                               if(data($uGOD_DespatchDetails/ns2:storeReceivedTimestamp))then
                                
                                    <ns0:storeReceivedTimestamp>{ data($uGOD_DespatchDetails/ns2:storeReceivedTimestamp) }</ns0:storeReceivedTimestamp>
                                    else ""
                            }
                            {
                               if(data($uGOD_DespatchDetails/ns2:customerCollectedTimestamp))then
                                
                                    <ns0:customerCollectedTimestamp>{ data($uGOD_DespatchDetails/ns2:customerCollectedTimestamp) }</ns0:customerCollectedTimestamp>
                                    else " "
                            }
                            {
                                if(data($uGOD_DespatchDetails/ns2:storeReturnedTimestamp))then
                                
                                    <ns0:storeReturnedTimestamp>{ data($uGOD_DespatchDetails/ns2:storeReturnedTimestamp) }</ns0:storeReturnedTimestamp>
                                    else ""
                            }
                        </ns0:despatchDetails>
                }
            </ns0:deliveryDetails>
			else ""
			
            }
            {
             if($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails)then
             <ns0:creditCheckDetails>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:orderCreditCheckStatus))then
                   
                        <ns0:orderCreditCheckStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:orderCreditCheckStatus) }</ns0:orderCreditCheckStatus>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:creditVetNumber))then
                    
                        <ns0:creditVetNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:creditVetNumber) }</ns0:creditVetNumber>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:creditScore))then
                    
                        <ns0:creditScore>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:creditScore) }</ns0:creditScore>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:lastCreditCheckDate))then
                    
                        <ns0:lastCreditCheckDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:lastCreditCheckDate) }</ns0:lastCreditCheckDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:creditClassId))then
                    
                        <ns0:creditClassId>{ xs:integer( data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:creditClassId) ) }</ns0:creditClassId>
                        else ""
                }
                {
                 if($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails)then
                <ns0:depositDetails>
                    <ns0:depositType>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails/ns2:depositType) }</ns0:depositType>
                    <ns0:depositAmount>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails/ns2:depositAmount) }</ns0:depositAmount>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails/ns2:depositDuration))then
                       
                            <ns0:depositDuration>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails/ns2:depositDuration) }</ns0:depositDuration>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails/ns2:depositReference))then
                        
                            <ns0:depositReference>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_DepositDetails/ns2:depositReference) }</ns0:depositReference>
                            else ""
                    }
                </ns0:depositDetails>
                else ""
                }
                {
                 if($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_TransactCreditCheckDetails)then
                <ns0:transactCreditCheckDetails>
                    <ns0:creditCheckResultCode>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_TransactCreditCheckDetails/ns2:creditCheckResultCode) }</ns0:creditCheckResultCode>
                    <ns0:totalMonthlyCharge>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_TransactCreditCheckDetails/ns2:totalMonthlyCharge) }</ns0:totalMonthlyCharge>
                    {
                        if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_TransactCreditCheckDetails/ns2:creditLimit))then
                       
                            <ns0:creditLimit>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_TransactCreditCheckDetails/ns2:creditLimit) }</ns0:creditLimit>
                            else ""
                    }
                </ns0:transactCreditCheckDetails>
                else " "
                }
                <ns0:legalEntityAddress>
                    <ns0:legalEntityCustomerName>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns2:legalEntityCustomerName) }</ns0:legalEntityCustomerName>
                    <ns0:standardAddress>
                        {
                            if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:addressStatus))then
                            
                                <ns0:addressStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                                else ""
                        }
                        {
                           if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:houseNameOrNumber))then
                           
                                <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                                else ""
                        }
                        {
                            if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:street))then
                            
                                <ns0:street>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:street) }</ns0:street>
                                else ""
                        }
                        {
                            if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:city))then
                            
                                <ns0:city>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:city) }</ns0:city>
                                else ""
                        }
                        {
                            if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:county))then
                             <ns0:county>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:county) }</ns0:county>
                                else ""
                        }
                        <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                        <ns0:postcode>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_legal_entity_address/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                    </ns0:standardAddress>
                </ns0:legalEntityAddress>
                {
                 if($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_previous_address)then
                <ns0:previousAddress>
                    {
                        let $standardAddress := $utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns1:uGOD_previous_address/ns1:standardAddress
                        return
                            <ns0:standardAddress>
                                {
                                    if(data($standardAddress/ns2:addressStatus))then
                                    
                                        <ns0:addressStatus>{ data($standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                                        else ""
                                }
                                {
                                    if(data($standardAddress/ns2:houseNameOrNumber))then
                                    
                                        <ns0:houseNameOrNumber>{ data($standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                                        else ""
                                }
                                {
                                    if(data($standardAddress/ns2:street))then
                                   
                                        <ns0:street>{ data($standardAddress/ns2:street) }</ns0:street>
                                        else ""
                                }
                                {
                                    if(data($standardAddress/ns2:city))then
                                    
                                        <ns0:city>{ data($standardAddress/ns2:city) }</ns0:city>
                                        else ""
                                }
                                {
                                    if(data($standardAddress/ns2:county))then
                                    
                                        <ns0:county>{ data($standardAddress/ns2:county) }</ns0:county>
                                        else ""
                                }
                                <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                                <ns0:postcode>{ data($standardAddress/ns2:postcode) }</ns0:postcode>
                            </ns0:standardAddress>
                    }
                </ns0:previousAddress>
                else " "
                }
                {
                   if(data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:referralReason))then
                    
                        <ns0:referralReason>{ data($utilGetOrderDetailsResp/ns1:uGOD_CreditCheckDetails/ns2:referralReason) }</ns0:referralReason>
                        else ""
                }
            </ns0:creditCheckDetails>
            else ""
            }
            {
              if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails))then
              <ns0:upgradeDetails>
                    <ns0:msisdnDetails>
                        <ns0:upgradeMSISDN>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_MsisdnDetails/ns2:upgradeMSISDN) }</ns0:upgradeMSISDN>
                        {
                         if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_MsisdnDetails/ns2:msisdn))then
                        
                            <ns0:msisdn>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_MsisdnDetails/ns2:msisdn) }</ns0:msisdn>
                            else ""
                       }
                    </ns0:msisdnDetails> 
                    <ns0:upgradeDiscounts>
                    <ns0:upgradeDiscountApplicable>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeDiscounts/ns2:upgradeDiscountApplicable) }</ns0:upgradeDiscountApplicable>
                    <ns0:upgradeDiscountActual>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeDiscounts/ns2:upgradeDiscountActual) }</ns0:upgradeDiscountActual>
                </ns0:upgradeDiscounts>
                {
                 if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails) and data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement) and data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:CCASettlementAmount))then
                   <ns0:upgradeEntitlementDetails>
                      <ns0:advancedEntitlement>
                        <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                        <ns0:upgradePaymentStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:upgradePaymentStatus) }</ns0:upgradePaymentStatus>
                        <ns0:CCASettlementAmount>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:CCASettlementAmount) }</ns0:CCASettlementAmount>
                        
                     </ns0:advancedEntitlement>
                   </ns0:upgradeEntitlementDetails>
                   else if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails) and data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement) and data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:earlyUpgradeOffered))then
                   <ns0:upgradeEntitlementDetails>
                      <ns0:advancedEntitlement>
                        <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                        <ns0:upgradePaymentStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:upgradePaymentStatus) }</ns0:upgradePaymentStatus>
                        <ns0:earlyUpgradeOffered>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                        <ns0:earlyUpgradeTaken>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                        <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns1:uGOD_AdvancedEntitlement/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                      </ns0:advancedEntitlement>
                   </ns0:upgradeEntitlementDetails>
                  else if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails) and data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns2:earlyUpgradeOffered))then
                  
                  <ns0:upgradeEntitlementDetails>
                    <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                    <ns0:earlyUpgradeOffered>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns2:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                    <ns0:earlyUpgradeTaken>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns2:earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                    <ns0:earlyUpgradeReference>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeDetails/ns1:uGOD_UpgradeEntitlementDetails/ns2:earlyUpgradeReference) }</ns0:earlyUpgradeReference>
                  </ns0:upgradeEntitlementDetails>
                  else ""
                 }
                 
               </ns0:upgradeDetails>
               else ""
            }  
            (:: upgrade should add - Clarification ::)
            {
             if(data($utilGetOrderDetailsResp/ns1:returnedLeasedDevice))then
             <ns0:returnedLeasedDevice>
                <ns0:handsetMake>{ data($utilGetOrderDetailsResp/ns1:returnedLeasedDevice/ns2:handsetMake) }</ns0:handsetMake>
                <ns0:handsetModel>{ data($utilGetOrderDetailsResp/ns1:returnedLeasedDevice/ns2:handsetModel) }</ns0:handsetModel>
                <ns0:imei>{ data($utilGetOrderDetailsResp/ns1:returnedLeasedDevice/ns2:imei) }</ns0:imei>
            </ns0:returnedLeasedDevice>
            else " "
            }
            
            {
              if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails))then
               <ns0:upgradeOfferDetails>
                <ns0:msisdn>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:msisdn) }</ns0:msisdn>
                <ns0:channel>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:channel) }</ns0:channel>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:storeType))then
                   
                        <ns0:storeType>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:storeType) }</ns0:storeType>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:retailerId))then
                    
                        <ns0:retailerId>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:retailerId) }</ns0:retailerId>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:userId))then
                   
                        <ns0:userId>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:userId) }</ns0:userId>
                        else ""
                }
                <ns0:upgradeEntitlementReference>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:upgradeEntitlementReference) }</ns0:upgradeEntitlementReference>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:tariffProductId))then
                  
                        <ns0:tariffProductId>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:tariffProductId) }</ns0:tariffProductId>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:tenure))then
                   
                        <ns0:tenure>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:tenure) }</ns0:tenure>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:contractStartDate))then
                    
                        <ns0:contractStartDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:contractStartDate) }</ns0:contractStartDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:contractEndDate))then
                    
                        <ns0:contractEndDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:contractEndDate) }</ns0:contractEndDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:serviceTenure))then
                 
                        <ns0:serviceTenure>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:serviceTenure) }</ns0:serviceTenure>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:lastUpgradeDate))then
                   
                        <ns0:lastUpgradeDate>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:lastUpgradeDate) }</ns0:lastUpgradeDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:currentMonthlySpend))then
                    
                        <ns0:currentMonthlySpend>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:currentMonthlySpend) }</ns0:currentMonthlySpend>
                        else ""
                }
                <ns0:eligibleForUpgrade>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:eligibleForUpgrade) }</ns0:eligibleForUpgrade>
                <ns0:upgradeAvailable>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:upgradeAvailable) }</ns0:upgradeAvailable>
                <ns0:overrideAllowed>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:overrideAllowed) }</ns0:overrideAllowed>
                
                <ns0:upgradeOfferExpiry>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns2:upgradeOfferExpiry) }</ns0:upgradeOfferExpiry>
                {
                    for $uGOD_UpgradeOptions in $utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradeOptions
                    return
                        <ns0:upgradeOptions>
                            <ns0:upgradeType>{ data($uGOD_UpgradeOptions/ns2:upgradeType) }</ns0:upgradeType>
                            <ns0:isUpgradeAllowed>{ data($uGOD_UpgradeOptions/ns2:isUpgradeAllowed) }</ns0:isUpgradeAllowed>
                            <ns0:onAccountPaymentAccepted>{ data($uGOD_UpgradeOptions/ns2:onAccountPaymentAccepted) }</ns0:onAccountPaymentAccepted>
                            {
                             if(data($uGOD_UpgradeOptions/ns1:uGOD_StandardUpgradeDetails))then
                            <ns0:standardUpgradeDetails>
                                <ns0:upgradeEligibilityDate>{ data($uGOD_UpgradeOptions/ns1:uGOD_StandardUpgradeDetails/ns2:upgradeEligibilityDate) }</ns0:upgradeEligibilityDate>
                            </ns0:standardUpgradeDetails>
                            else ""
                            }
                            {
                             if(data($uGOD_UpgradeOptions/ns1:uGOD_PaidUpgradeDetails))then
                            <ns0:paidUpgradeDetails>
                                <ns0:upgradeEligibilityDate>{ data($uGOD_UpgradeOptions/ns1:uGOD_PaidUpgradeDetails/ns2:upgradeEligibilityDate) }</ns0:upgradeEligibilityDate>
                            </ns0:paidUpgradeDetails>
                            else ""
                            }
                        </ns0:upgradeOptions>
                }
                {
                  if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment) and data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:CCANumber) )then
                   <ns0:upgradePayment>
                      <ns0:CCANumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:CCANumber) }</ns0:CCANumber> 
                      <ns0:CCASettlementAmount>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:CCASettlementAmount) }</ns0:CCASettlementAmount> 
                      <ns0:isCCAPaymentAllowed>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:isCCAPaymentAllowed) }</ns0:isCCAPaymentAllowed>
                   
                    </ns0:upgradePayment>
                    
                    else if(data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:earlyUpgradeFee))then
                    <ns0:upgradePayment>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee> 
                    <ns0:isFTUPaymentAllowed>{ data($utilGetOrderDetailsResp/ns1:uGOD_UpgradeOfferDetails/ns1:uGOD_UpgradePayment/ns2:isFTUPaymentAllowed) }</ns0:isFTUPaymentAllowed>
                    </ns0:upgradePayment>
                    else ""
                   }
                       
                    
				   
                
            </ns0:upgradeOfferDetails>
            else ""
            
            }
            {
             if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory))then
             <ns0:orderHistory>
                <ns0:createdTimestamp>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:createdTimestamp) }</ns0:createdTimestamp>
                <ns0:createdBy>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:createdBy) }</ns0:createdBy>
                <ns0:orderEvent>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:orderEvent) }</ns0:orderEvent>
                <ns0:orderEventDescription>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:orderEventDescription) }</ns0:orderEventDescription>
                <ns0:deleted>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:deleted) }</ns0:deleted>
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:lastUpdated))then
                   
                        <ns0:lastUpdated>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:lastUpdated) }</ns0:lastUpdated>
                      else " "  
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:lastUpdatedBy))then
                    
                        <ns0:lastUpdatedBy>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:lastUpdatedBy) }</ns0:lastUpdatedBy>
                     else ""    
                }
                {
                    if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:freeFormText))then
                   
                        <ns0:freeFormText>{ data($utilGetOrderDetailsResp/ns1:uGOD_OrderHistory[1]/ns2:freeFormText) }</ns0:freeFormText>
                    else " " 
                }  
            </ns0:orderHistory>
            else ""
            
            }
            {
             if(data($utilGetOrderDetailsResp/ns1:uGOD_CollectionStatus))then
            <ns0:collectionStatus>
                <ns0:orderCollectionVerificationLevel>{ data($utilGetOrderDetailsResp/ns1:uGOD_CollectionStatus/ns2:orderCollectionVerificationLevel) }</ns0:orderCollectionVerificationLevel>
                <ns0:storeNumber>{ data($utilGetOrderDetailsResp/ns1:uGOD_CollectionStatus/ns2:storeNumber) }</ns0:storeNumber>
                <ns0:collectionReference>{ data($utilGetOrderDetailsResp/ns1:uGOD_CollectionStatus/ns2:collectionReference) }</ns0:collectionReference>
                <ns0:collectionStatus>{ data($utilGetOrderDetailsResp/ns1:uGOD_CollectionStatus/ns2:collectionStatus) }</ns0:collectionStatus>
                
            </ns0:collectionStatus>
            else ""
            }
              {
                if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails))then
                 <ns0:orderPartyDetails>
                        {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:title))then
                          <ns0:title>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:title)}</ns0:title>
                          else ""
                        } 
                         {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:forename))then
                          <ns0:forename>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:forename)}</ns0:forename>
                          else ""
                        } 
                         
                          <ns0:surname>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:surname)}</ns0:surname>
                        
                       
                         {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:alternativeContactNumber))then
                          <ns0:alternativeContactNumber>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:alternativeContactNumber)}</ns0:alternativeContactNumber>
                          else ""
                        } 
                        {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:emailAddress))then
                          <ns0:emailAddress>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyDetails/ns2:emailAddress)}</ns0:emailAddress>
                          else ""
                        } 
                        
                 </ns0:orderPartyDetails>
                else "" 
              }
                 {
                if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress))then
                 <ns0:orderPartyAddress>
                        {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:houseNameOrNumber))then
                          <ns0:houseNameorNumber>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:houseNameOrNumber)}</ns0:houseNameorNumber>
                          else ""
                        } 
                         {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:street))then
                          <ns0:street>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:street)}</ns0:street>
                          else ""
                        } 
                          {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:city))then
                          <ns0:city>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:city)}</ns0:city>
                          else ""
                        } 
                         {
                          if(data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:county))then
                          <ns0:county>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:county)}</ns0:county>
                          else ""
                        } 
                      
                          <ns0:postcode>{data($utilGetOrderDetailsResp/ns1:uGOD_OrderPartyAddress/ns2:postcode)}</ns0:postcode>
                          <ns0:country>{data($configData/countryNameGeographical)}</ns0:country>
                          
                 </ns0:orderPartyAddress>
                else "" 
              }
              
           
 {
              if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo)) then  
			 
				if(data($getOrderDetailsrequest/ns0:retrieveAdditionalInfo/ns0:parameterName)= data($configData/getOrderDetails_3/parameterName)) then
				
				if(($utilGetOrderDetailsResp/ns1:uGOD_PromotionsTaken))then
				
				for $uGOD_PromotionsTaken in $utilGetOrderDetailsResp/ns1:uGOD_PromotionsTaken
                return 
				
				<ns0:promotionsTaken>
				
				<ns0:promotionId>{data($uGOD_PromotionsTaken/ns2:promotionId)}</ns0:promotionId>
			   {
				if(data($uGOD_PromotionsTaken/ns2:promotionToken))then
				<ns0:promotionToken>{data($uGOD_PromotionsTaken/ns2:promotionToken)}</ns0:promotionToken>
				else ""
			   }	
				<ns0:promotionDescription>{data($uGOD_PromotionsTaken/ns2:promotionDescription)}</ns0:promotionDescription>  
				
				{
				if(data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails))then
				
				<ns0:deviceTradeInDetails>
				
				<ns0:tradeInAmount>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns2:tradeInAmount)}</ns0:tradeInAmount>
				
				<ns0:expectedHandset>
				
				<ns0:handsetMake>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_ExpectedHandset/ns2:handsetMake)}</ns0:handsetMake>
				<ns0:handsetModel>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_ExpectedHandset/ns2:handsetModel)}</ns0:handsetModel>
				</ns0:expectedHandset>
				
				{
				if(data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails))then
				
				<ns0:recyclingPartnerDetails>
				
				<ns0:handsetMake>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:handsetMake)}</ns0:handsetMake>
				<ns0:handsetModel>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:handsetModel)}</ns0:handsetModel>
				<ns0:imei>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:imei)}</ns0:imei>
				<ns0:deviceValuation>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:deviceValuation)}</ns0:deviceValuation>
				<ns0:receivedDate>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:receivedDate)}</ns0:receivedDate>
				<ns0:tradeInReference>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_RecyclingPartnerDetails/ns2:tradeInReference)}</ns0:tradeInReference>
				
				
				</ns0:recyclingPartnerDetails>
				
				else ""
				}
				
				{
				if(data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_StoreReturnDetails))then
				
				<ns0:storeReturnDetails>
				
				<ns0:storeNumber>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_StoreReturnDetails/ns2:storeNumber)}</ns0:storeNumber>
				
				<ns0:storeReceivedTimestamp>{data($uGOD_PromotionsTaken/ns1:uGOD_DeviceTradeInDetails/ns1:uGOD_StoreReturnDetails/ns2:storeReceivedTimestamp)}</ns0:storeReceivedTimestamp>
				
				</ns0:storeReturnDetails>
				
				else ""
				
				}
				</ns0:deviceTradeInDetails>  
				
				else ""
				}
				</ns0:promotionsTaken>
				
				else ""
				
				
			else ""				
				
else ""		
}		
                      
               
           
        </ns0:getOrderDetails_3Response>
};

declare variable $utilGetOrderDetailsResp as element() external;
declare variable $configData as element(*) external;
declare variable $referenceDetailsResp as element(*) external;
declare variable $getOrderDetailsrequest as element(*) external;

xf:ConstructGetOrderDetails_3Response($utilGetOrderDetailsResp,
    $configData,$referenceDetailsResp,$getOrderDetailsrequest)