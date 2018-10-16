(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsV5Resp" type="ns1:companionMessage/ns1:utilGetOrderDetailsV5Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma  parameter="$configData" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 24/11/2014 		1.0.0 		Vanishree 			Initial version :)
(: 10/02/2016 		1.0.1 		Dolly K 			Added product description and classification for tariff and boltons for postpay tariff details as part of Telesales Franchise Phase :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructGetOrderDetails_3RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/product/referencedetailsdata_1";



declare function xf:ConstructGetOrderDetails_3RS($utilGetOrderDetailsV5Resp as element(),
    $configData as element(*),$referenceDetailsResp as element(*))
    as element(ns0:getOrderDetails_3Response) {
        <ns0:getOrderDetails_3Response>
            <ns0:responseCode>{ data($configData/getOrderDetails/successCode) }</ns0:responseCode>
            <ns0:orderHeaderDetails>
                <ns0:orderNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderNumber) }</ns0:orderNumber>
                {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:oid))then
                <ns0:oid>{ xs:integer( data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:oid) ) }</ns0:oid>
                else ""
                }
                <ns0:orderTimestamp>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderTimestamp) }</ns0:orderTimestamp>
                <ns0:orderType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderType) }</ns0:orderType>
                <ns0:orderStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderStatus) }</ns0:orderStatus>
                {
                   if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:preOrderOfferingId))then
                    <ns0:preOrderOfferingId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:preOrderOfferingId) }</ns0:preOrderOfferingId>
                  else ""
                }
                <ns0:portalEmail>
                    <ns0:commonRegistryUserName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns1:uGODV5_PortalEmail/ns2:commonRegistryUserName) }</ns0:commonRegistryUserName>
                    <ns0:commonRegistryUserDomain>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns1:uGODV5_PortalEmail/ns2:commonRegistryUserDomain) }</ns0:commonRegistryUserDomain>
                </ns0:portalEmail>
                 {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns1:uGODV5_MostRecentOrderEvent))then
                <ns0:mostRecentOrderEvent>
                    <ns0:orderEvent>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns1:uGODV5_MostRecentOrderEvent/ns2:orderEvent) }</ns0:orderEvent>
                    <ns0:orderEventDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns1:uGODV5_MostRecentOrderEvent/ns2:orderEventDescription) }</ns0:orderEventDescription>
                </ns0:mostRecentOrderEvent>
                else ""
                }
            </ns0:orderHeaderDetails>
            {
              if($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails)then
            <ns0:orderSourceDetails>
               {
               if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:orderMethod))then
                <ns0:orderMethod>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:orderMethod) }</ns0:orderMethod>
                else ""
                }
                {
                if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:partner))then
                <ns0:partner>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:partner) }</ns0:partner>
                else ""
                }
                 {
                if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:owningBusinessDivision))then
                <ns0:owningBusinessDivision>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:owningBusinessDivision) }</ns0:owningBusinessDivision>
                else ""
                }
                <ns0:sourceOfSale>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:sourceOfSale) }</ns0:sourceOfSale>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:retailerId))then
                    <ns0:retailerId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:retailerId) }</ns0:retailerId>
                    else ""
                }
                {   
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:posBusinessUnit))then
                   <ns0:posBusinessUnit>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:posBusinessUnit) }</ns0:posBusinessUnit>
                    else ""
                   
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:storeName))then
                    <ns0:storeName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:storeName) }</ns0:storeName>
                    else ""    
                }
                {
                   if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:storeType))then
                   
                        <ns0:storeType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:storeType) }</ns0:storeType>
                   else ""     
                }
                {
                   if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:salesPerson))then
                   
                        <ns0:salesPerson>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:salesPerson) }</ns0:salesPerson>
                   else ""     
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:salesManager))then
                   
                        <ns0:salesManager>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:salesManager) }</ns0:salesManager>
                    else ""    
                }
                {
                   if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:csaId))then
                   
                        <ns0:csaId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:csaId) }</ns0:csaId>
                   else ""     
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:userAlias))then
                   
                        <ns0:userAlias>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:userAlias) }</ns0:userAlias>
                        else ""
                }
                {
                   if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:callContactID))then
                   
                        <ns0:callContactID>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:callContactID) }</ns0:callContactID>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:callTypeIndicator))then
                   
                        <ns0:callTypeIndicator>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:callTypeIndicator) }</ns0:callTypeIndicator>
                        else ""
                }
                { 
                  if($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs)then  
                 <ns0:proofs>
                   {
                     if($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfAddress)then
                    <ns0:proofOfAddress>
                        <ns0:proofType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfAddress/ns2:proofType) }</ns0:proofType>
                        {
                            if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfAddress/ns2:proofData))then
                            
                                <ns0:proofData>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfAddress/ns2:proofData) }</ns0:proofData>
                                else ""
                        }
                   </ns0:proofOfAddress> 
                    else ""
                    }
                    {
                     if($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfIdentity)then
                    <ns0:proofOfIdentity>
                        <ns0:proofType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfIdentity/ns2:proofType) }</ns0:proofType>
                        {
                            if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfIdentity/ns2:proofData))then
                            
                                <ns0:proofData>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfIdentity/ns2:proofData) }</ns0:proofData>
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
            if($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderReturnDetails)then
            <ns0:orderReturnDetails>
                <ns0:returnsOutstanding>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderReturnDetails/ns2:returnsOutstanding) }</ns0:returnsOutstanding>
                <ns0:returnReason>{ xs:integer( data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderReturnDetails/ns2:returnReason) ) }</ns0:returnReason>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderReturnDetails/ns2:returnNotes))then
                    
                        <ns0:returnNotes>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                        else ""
                }
            </ns0:orderReturnDetails>
            else ""
            }
            {
             if(($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails)and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails))then
               <ns0:initialPaymentDetails>
                 <ns0:cardDetails>
                    <ns0:cardNumber>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber)}</ns0:cardNumber>
                    <ns0:cardExpiryDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardExpiryDate) }</ns0:cardExpiryDate>
                    <ns0:cardHolderName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardHolderName) }</ns0:cardHolderName>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssueDate))then
                       
                            <ns0:cardIssueDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssueDate) }</ns0:cardIssueDate>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssueNumber))then
                       
                            <ns0:cardIssueNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssueNumber) }</ns0:cardIssueNumber>
                           else "" 
                    }
                    <ns0:postCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:postcode) }</ns0:postCode>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:houseNameOrNumber))then
                       
                            <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                           else "" 
                    }
                    <ns0:bankCardIssuer>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssuerName) }</ns0:bankCardIssuer>
                </ns0:cardDetails>
                
                <ns0:paymentDetails>
                    <ns0:authorisationStatus>{ xs:integer( data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationStatus) ) }</ns0:authorisationStatus>
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationRespCode))then
                        
                            <ns0:authorisationRespCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationRespCode) }</ns0:authorisationRespCode>
                           else "" 
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationRespMessage))then
                        
                            <ns0:authorisationRespMessage>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationRespMessage) }</ns0:authorisationRespMessage>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationCode))then
                       
                            <ns0:authorisationCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authorisationCode) }</ns0:authorisationCode>
                        else ""
                     }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authMessage))then
                        
                            <ns0:authMessage>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:authMessage) }</ns0:authMessage>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:buynetId))then
                        
                            <ns0:buynetId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:buynetId) }</ns0:buynetId>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:settlementRespCode))then
                        
                            <ns0:settlementRespCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/ns2:settlementRespCode) }</ns0:settlementRespCode>
                            else ""
                    }
                </ns0:paymentDetails>
                 <ns0:paymentMoney>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:paymentMoney) }</ns0:paymentMoney>
                 </ns0:initialPaymentDetails>
                
                
                 else if(($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails)and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:paymentReferenceNumber))then

                
                <ns0:initialPaymentDetails>
                <ns0:paymentReferenceNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:paymentReferenceNumber) }</ns0:paymentReferenceNumber>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:cardToken))then
                  
                        <ns0:cardToken>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:cardToken) }</ns0:cardToken>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:externalPaymentId))then
                    
                        <ns0:externalPaymentId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:externalPaymentId) }</ns0:externalPaymentId>
                        else ""
                }
                 <ns0:paymentMoney>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:paymentMoney) }</ns0:paymentMoney>
                 </ns0:initialPaymentDetails>
                else if(($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails)and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:billingAccountNumber))then

				<ns0:initialPaymentDetails>
                <ns0:billingAccountNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                 <ns0:paymentMoney>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns2:paymentMoney) }</ns0:paymentMoney>
			</ns0:initialPaymentDetails>
			else ""
               
            
             
            }
         {
                for $uGODV5_RecurringPaymentDetails in $utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails
                return
                    <ns0:recurringPaymentDetails>
                    {
                      if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount))then
                        <ns0:existingAccount>
                            <ns0:billingAccountNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                            <ns0:billingCustomerNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns2:billingCustomerNumber) }</ns0:billingCustomerNumber>
                              {
                              if($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails)then
                            <ns0:revisedDirectDebitDetails>
                                <ns0:userAccountNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:userAccountNumber) }</ns0:userAccountNumber>
                                {
                                    if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankAccountNumber))then
                                    
                                        <ns0:bankAccountNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankAccountNumber) }</ns0:bankAccountNumber>
                                        else ""
                                }
                                <ns0:bankSortCode>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankSortCode) }</ns0:bankSortCode>
                                <ns0:bankAccountName>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/ns2:bankAccountName) }</ns0:bankAccountName>
                            </ns0:revisedDirectDebitDetails>
                            else ""
                            }
                        </ns0:existingAccount>
                        else if($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount)then
                        <ns0:newAccount>
                            <ns0:billingAccountNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                            <ns0:billingCustomerNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns2:billingCustomerNumber) }</ns0:billingCustomerNumber>
                            <ns0:accountRecurringPaymentDetails>
                            {
                               if($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority)then
                                <ns0:accountContinuousCCAuthority>
                                    <ns0:cardNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardNumber) }</ns0:cardNumber>
                                    <ns0:cardExpiryDate>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardExpiryDate) }</ns0:cardExpiryDate>
                                    <ns0:cardHolderName>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardHolderName) }</ns0:cardHolderName>
                                    {
                                        if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardIssueDate))then
                                       
                                            <ns0:cardIssueDate>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardIssueDate) }</ns0:cardIssueDate>
                                           else "" 
                                    }
                                    {
                                        if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardIssueNumber))then
                                        
                                            <ns0:cardIssueNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardIssueNumber) }</ns0:cardIssueNumber>
                                            else ""
                                    }
                                    <ns0:postCode>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:postcode) }</ns0:postCode>
                                    {
                                        if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:houseNameOrNumber))then
                                       
                                            <ns0:houseNameOrNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                                            else ""
                                    }
                                    <ns0:cardType>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/ns2:cardType) }</ns0:cardType>
                                </ns0:accountContinuousCCAuthority>
                                else if($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails)then
                                <ns0:accountDirectDebitDetails>
                                    <ns0:userAccountNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/ns2:userAccountNumber) }</ns0:userAccountNumber>
                                    {
                                       if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/ns2:bankAccountNumber))then
                                       
                                            <ns0:bankAccountNumber>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/ns2:bankAccountNumber) }</ns0:bankAccountNumber>
                                            else ""
                                    }
                                    <ns0:bankSortCode>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/ns2:bankSortCode) }</ns0:bankSortCode>
                                    <ns0:bankAccountName>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/ns2:bankAccountName) }</ns0:bankAccountName>
                                </ns0:accountDirectDebitDetails>
                                else if(data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns2:continuousChequePayments))then
                                <ns0:continuousChequePayments>{ data($uGODV5_RecurringPaymentDetails/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns2:continuousChequePayments) }</ns0:continuousChequePayments>
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
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatTotal))then
                <ns0:vatTotal>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatTotal) }</ns0:vatTotal>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatCodeDescription))then
                <ns0:vatCodeDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatCodeDescription) }</ns0:vatCodeDescription>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatReceiptRequired))then
                <ns0:vatReceiptRequired>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatReceiptRequired) }</ns0:vatReceiptRequired>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatExclusiveTotalPrice))then
                <ns0:vatExclusiveTotalPrice>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatExclusiveTotalPrice) }</ns0:vatExclusiveTotalPrice>
                else ""
                }
                {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatReceiptProduced))then
                <ns0:vatReceiptProduced>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatReceiptProduced) }</ns0:vatReceiptProduced>
                else ""
                }
                <ns0:total>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:total) }</ns0:total>
            </ns0:orderTotalDetails>  
            {
                for $uGODV5_SaleProd in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd
                return
                    <ns0:saleableProductDetails>
                        <ns0:saleableProductLineNumber>{ data($uGODV5_SaleProd/ns2:saleableProductLineNumber) }</ns0:saleableProductLineNumber>
                        <ns0:saleableProductId>{ data($uGODV5_SaleProd/ns2:saleableProductId) }</ns0:saleableProductId>
                        <ns0:saleableProductName>{ data($uGODV5_SaleProd/ns2:saleableProductName) }</ns0:saleableProductName>
                        <ns0:saleableProductPrice>{ data($uGODV5_SaleProd/ns2:saleableProductPrice) }</ns0:saleableProductPrice>
                        <ns0:originalPrice>{ data($uGODV5_SaleProd/ns2:originalPrice) }</ns0:originalPrice>
                        <ns0:vatDetails>
                            <ns0:vatRate>{ data($uGODV5_SaleProd/ns1:uGODV5_VatDetails/ns2:vatRate) }</ns0:vatRate>
                            <ns0:vatAmount>{ data($uGODV5_SaleProd/ns1:uGODV5_VatDetails/ns2:vatAmount) }</ns0:vatAmount>
                             {
                              if(data($uGODV5_SaleProd/ns1:uGODV5_VatDetails/ns2:vatExclusivePrice))then
                            <ns0:vatExclusivePrice>{ data($uGODV5_SaleProd/ns1:uGODV5_VatDetails/ns2:vatExclusivePrice) }</ns0:vatExclusivePrice>
                            else ""
                            }
                            {
                             if(data($uGODV5_SaleProd/ns1:uGODV5_VatDetails/ns2:vatReversalReceiptStatus))then
                            <ns0:vatReversalReceiptStatus>{ data($uGODV5_SaleProd/ns1:uGODV5_VatDetails/ns2:vatReversalReceiptStatus) }</ns0:vatReversalReceiptStatus>
                            else ""
                            }
                        </ns0:vatDetails>
                        
                        {
                            if(data($uGODV5_SaleProd/ns2:billingAccountNumber))then
                            
                                <ns0:billingAccountNumber>{ data($uGODV5_SaleProd/ns2:billingAccountNumber) }</ns0:billingAccountNumber>
                                else ""
                        }
                        {
                            if(data($uGODV5_SaleProd/ns2:billingCrossChargeAccountNumber))then
                            
                                <ns0:billingCrossChargeAccountNumber>{ data($uGODV5_SaleProd/ns2:billingCrossChargeAccountNumber) }</ns0:billingCrossChargeAccountNumber>
                                else ""
                        }
                        {
                         if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct))then
                        <ns0:assignedProduct>
                          {
                                for $uGODV5_ACC in $uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC
                                return
                                    <ns0:accessoryDetails>
                                        <ns0:category>{ data($uGODV5_ACC/ns2:category) }</ns0:category>
                                        {
                                           if(data($uGODV5_ACC/ns2:groupId))then
                                           
                                                <ns0:groupId>{ data($uGODV5_ACC/ns2:groupId) }</ns0:groupId>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_ACC/ns2:dispatchMethod))then
                                            
                                                <ns0:dispatchMethod>{ data($uGODV5_ACC/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                                else ""
                                        }
                                        <ns0:productId>{ data($uGODV5_ACC/ns2:productId) }</ns0:productId>
                                        <ns0:productName>{ data($uGODV5_ACC/ns2:productName) }</ns0:productName>
                                        <ns0:assignedProductNumber>{ data($uGODV5_ACC/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                        {
                                            if(data($uGODV5_ACC/ns2:make))then
                                            
                                                <ns0:make>{ data($uGODV5_ACC/ns2:make) }</ns0:make>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_ACC/ns2:model))then
                                          
                                                <ns0:model>{ data($uGODV5_ACC/ns2:model) }</ns0:model>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_ACC/ns2:risk))then
                                            
                                                <ns0:risk>{ data($uGODV5_ACC/ns2:risk) }</ns0:risk>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_ACC/ns2:skuId))then
                                            
                                                <ns0:skuId>{ data($uGODV5_ACC/ns2:skuId) }</ns0:skuId>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_ACC/ns2:skuName))then
                                            
                                                <ns0:skuName>{ data($uGODV5_ACC/ns2:skuName) }</ns0:skuName>
                                                else ""
                                        }
                                        {
                                           if(data($uGODV5_ACC/ns2:serialNumber))then
                                          
                                                <ns0:serialNumber>{ data($uGODV5_ACC/ns2:serialNumber) }</ns0:serialNumber>
                                                else ""
                                                
                                        }
                                        {
                                            if(data($uGODV5_ACC/ns2:imei))then
                                          
                                                <ns0:imei>{ data($uGODV5_ACC/ns2:imei) }</ns0:imei>
                                                else ""
                                                
                                        }
                                        <ns0:dispatchStatus>{ data($uGODV5_ACC/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                        {
                                            if(data($uGODV5_ACC/ns2:orderProductPrice))then
                                            
                                                <ns0:orderProductPrice>{ data($uGODV5_ACC/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                                else ""
                                                                                        }
                                        {
                                         if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails))then
                                        <ns0:replacementReturnDetails>
                                            <ns0:orderNumberBeingReturned>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                            <ns0:returnSaleableProductLineNumber>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                            <ns0:returnAssignedProductNumber>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                             {
                                             if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode))then
                                            <ns0:returnReasonCode>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            else ""
                                             }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                               
                                                    <ns0:returnReasonSubTypeCode>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                               if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                                
                                                    <ns0:returnReasonOutOfPolicyUserName>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                                
                                                    <ns0:returnAuthorisationNumber>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes))then
                                               
                                                    <ns0:returnNotes>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                            {
                                               if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                               
                                                    <ns0:replacementPolicyId>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                               
                                                    <ns0:replacementPolicySOACode>{ data($uGODV5_ACC/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:replacementReturnDetails>
                                        else ""
                                        }
                                        {
                                        if($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails)then
                                      
                                        <ns0:assignedProdReturnDetails>
                                            <ns0:returnReasonCode>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            <ns0:returnReasonDescription>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                               
                                                    <ns0:returnReasonSubTypeCode>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                                
                                                    <ns0:returnReasonSubTypeDescription>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod))then
                                                
                                                    <ns0:replacementMethod>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                                    else " "
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes))then
                                                
                                                    <ns0:returnNotes>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                            {
                                               if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition))then
                                                
                                                    <ns0:returnCondition>{ xs:integer( data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                               
                                                    <ns0:returnTimestamp>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                               
                                                    <ns0:returnAuthorisationNumber>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                               
                                                    <ns0:replacedByOrderNumber>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                                
                                                    <ns0:replacedByOrderLineNumber>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                                
                                                    <ns0:replacedByOrderAssignProdNumber>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                                
                                                    <ns0:replacementPolicyId>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                                
                                                    <ns0:replacementPolicySOACode>{ data($uGODV5_ACC/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:assignedProdReturnDetails>
                                        else ""
                                        }
                                    </ns0:accessoryDetails>
                            }
                             {
                                for $uGODV5_ADJ in $uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ
                                return
                                    <ns0:adjustmentDetails>
                                        <ns0:productId>{ data($uGODV5_ADJ/ns2:productId) }</ns0:productId>
                                        {
                                            if(data($uGODV5_ADJ/ns2:groupId))then
                                           
                                                <ns0:groupId>{ data($uGODV5_ADJ/ns2:groupId) }</ns0:groupId>
                                                else ""
                                        }
                                        <ns0:productName>{ data($uGODV5_ADJ/ns2:productName) }</ns0:productName>
                                        <ns0:creditOrDebit>{ data($uGODV5_ADJ/ns2:creditOrDebit) }</ns0:creditOrDebit>
                                        <ns0:adjustmentAmount>{ data($uGODV5_ADJ/ns2:adjustmentAmount) }</ns0:adjustmentAmount>
                                        <ns0:adjustmentReason>{ data($uGODV5_ADJ/ns2:adjustmentReason) }</ns0:adjustmentReason>
                                        {
                                            if(data($uGODV5_ADJ/ns2:adjustmentCircumstances))then
                                          
                                                <ns0:adjustmentCircumstances>{ data($uGODV5_ADJ/ns2:adjustmentCircumstances) }</ns0:adjustmentCircumstances>
                                                else ""
                                        }
                                    </ns0:adjustmentDetails>
                            } 
                            {
                              if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN))then
                              <ns0:handsetDetails>
                                 <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:dispatchMethod))then
                                    
                                        <ns0:dispatchMethod>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                        else ""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                 {
                                 if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetMake))then
                                <ns0:make>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetMake) }</ns0:make>
                                else ""
                                }
                                {
                                if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetModel))then
                                <ns0:model>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetModel) }</ns0:model>
                                else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetRisk))then
                                    
                                        <ns0:risk>{ xs:short( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetRisk) ) }</ns0:risk>
                                        else ""
                                }
                                {
                                   if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuId))then
                                   
                                        <ns0:skuId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuId) }</ns0:skuId>
                                        else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuName))then
                                    
                                        <ns0:skuName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuName) }</ns0:skuName>
                                     else ""   
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:imei))then
                                   
                                        <ns0:imei>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:imei) }</ns0:imei>
                                        else ""
                                }
                                <ns0:dispatchStatus>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                 }
                                {
                                 if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails))then
                                <ns0:replacementReturnDetails>
                                    <ns0:orderNumberBeingReturned>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                    <ns0:returnSaleableProductLineNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                    <ns0:returnAssignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                    {
                                     if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode))then
                                    <ns0:returnReasonCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                       
                                            <ns0:returnReasonOutOfPolicyUserName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes))then
                                       
                                            <ns0:returnNotes>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                       
                                            <ns0:replacementPolicyId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                            
                                    }
                                </ns0:replacementReturnDetails>
                                else " "
                                }
                                {
                                 if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails))then
                                <ns0:assignedProdReturnDetails>
                                    <ns0:returnReasonCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    <ns0:returnReasonDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                       
                                            <ns0:returnReasonSubTypeDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod))then
                                       
                                            <ns0:replacementMethod>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes))then
                                       
                                            <ns0:returnNotes>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition))then
                                        
                                            <ns0:returnCondition>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                        
                                            <ns0:returnTimestamp>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                        
                                            <ns0:replacedByOrderNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                            else ""
                                    }
                                    {
                                       if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                       
                                            <ns0:replacedByOrderLineNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                       
                                            <ns0:replacedByOrderAssignProdNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                        
                                            <ns0:replacementPolicyId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                    }
                                </ns0:assignedProdReturnDetails>
                                else " "
                                }
                                {
                                 if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails))then
                                <ns0:CCADetails>
                                    <ns0:CCANumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns2:CCANumber) }</ns0:CCANumber>
                                    <ns0:CCAFinancialDetails>
                                        <ns0:hardwareDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:hardwareDescription) }</ns0:hardwareDescription>
                                        <ns0:hardwareRRP>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:hardwareRRP) ) }</ns0:hardwareRRP>
                                        <ns0:downPayment>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:downPayment) ) }</ns0:downPayment>
                                        <ns0:instalment>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:installment) ) }</ns0:instalment>
                                        <ns0:term>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:term) ) }</ns0:term>
                                        <ns0:totalCredit>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:totalCredit) ) }</ns0:totalCredit>
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:tariffDiscount))then
                                            
                                                <ns0:tariffDiscount>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:tariffDiscount) ) }</ns0:tariffDiscount>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:discretionaryDiscount))then
                                            
                                                <ns0:discretionaryDiscount>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCAFinancials/ns2:discretionaryDiscount) ) }</ns0:discretionaryDiscount>
                                                else ""
                                        }
                                    </ns0:CCAFinancialDetails>
                                    <ns0:CCACustomerDetails>
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:partyTitle))then
                                            
                                                <ns0:title>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:partyTitle) }</ns0:title>
                                                else ""
                                        }
                                        <ns0:forename>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:partyForename) }</ns0:forename>
                                        <ns0:lastname>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:partySurname) }</ns0:lastname>
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:addressHouseName))then
                                            
                                                <ns0:addressHouseName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:addressHouseName) }</ns0:addressHouseName>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:addressHouseNumber))then
                                            
                                                <ns0:addressHouseNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:addressHouseNumber) }</ns0:addressHouseNumber>
                                                else ""
                                        }
                                        <ns0:address1stLine>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address1stLine) }</ns0:address1stLine>
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address2ndLine))then
                                            
                                                <ns0:address2ndLine>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address2ndLine) }</ns0:address2ndLine>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address3rdLine))then
                                            
                                                <ns0:address3rdLine>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address3rdLine) }</ns0:address3rdLine>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address4thLine))then
                                           
                                                <ns0:address4thLine>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:address4thLine) }</ns0:address4thLine>
                                                else ""
                                        }
                                        <ns0:postCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:postcode) }</ns0:postCode>
                                        <ns0:postalCountry>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns1:uGODV5_CCADetails/ns1:uGODV5_CCACustomerDetails/ns2:postalCountry) }</ns0:postalCountry>
                                    </ns0:CCACustomerDetails>
                                </ns0:CCADetails>
                                else " "
                                }
                              </ns0:handsetDetails>
                              else ""
                            } 
                             {
                                for $uGODV5_LIT in $uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT
                                return
                                    <ns0:literatureDetails>
                                        <ns0:category>{ data($uGODV5_LIT/ns2:category) }</ns0:category>
                                        {
                                            if(data($uGODV5_LIT/ns2:groupId))then
                                            
                                                <ns0:groupId>{ data($uGODV5_LIT/ns2:groupId) }</ns0:groupId>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_LIT/ns2:dispatchMethod))then
                                            
                                                <ns0:dispatchMethod>{ data($uGODV5_LIT/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                                else ""
                                        }
                                        <ns0:productId>{ data($uGODV5_LIT/ns2:productId) }</ns0:productId>
                                        <ns0:productName>{ data($uGODV5_LIT/ns2:productName) }</ns0:productName>
                                        <ns0:assignedProductNumber>{ data($uGODV5_LIT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                        {
                                            if(data($uGODV5_LIT/ns2:skuId))then
                                            
                                                <ns0:skuId>{ data($uGODV5_LIT/ns2:skuId) }</ns0:skuId>
                                                else ""
                                        }
                                        {
                                            if(data($uGODV5_LIT/ns2:skuName))then
                                           
                                                <ns0:skuName>{ data($uGODV5_LIT/ns2:skuName) }</ns0:skuName>
                                                else ""
                                        }
                                        <ns0:dispatchStatus>{ data($uGODV5_LIT/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                        {
                                         if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails))then
                                        <ns0:replacementReturnDetails>
                                            <ns0:orderNumberBeingReturned>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                            <ns0:returnSaleableProductLineNumber>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                            <ns0:returnAssignedProductNumber>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                            {
                                             if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode))then
                                            <ns0:returnReasonCode>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                               
                                                    <ns0:returnReasonSubTypeCode>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                                
                                                    <ns0:returnReasonOutOfPolicyUserName>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                                    else""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                                
                                                    <ns0:returnAuthorisationNumber>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes))then
                                                
                                                    <ns0:returnNotes>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                             {
                                               if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                                
                                                    <ns0:replacementPolicyId>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                             }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                                
                                                    <ns0:replacementPolicySOACode>{ data($uGODV5_LIT/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:replacementReturnDetails>
                                        else ""
                                        }
                                        {
                                         if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails))then
                                        <ns0:assignedProdReturnDetails>
                                            <ns0:returnReasonCode>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                            <ns0:returnReasonDescription>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                                
                                                    <ns0:returnReasonSubTypeCode>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                                
                                                    <ns0:returnReasonSubTypeDescription>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod))then
                                                
                                               
                                                    <ns0:replacementMethod>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                                    else " "
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes))then
                                               
                                                    <ns0:returnNotes>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition))then
                                                
                                                    <ns0:returnCondition>{ xs:integer( data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                             
                                                    <ns0:returnTimestamp>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                                    else ""
                                            }
                                            {
                                               if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                               
                                                    <ns0:returnAuthorisationNumber>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                               
                                                    <ns0:replacedByOrderNumber>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                                
                                                    <ns0:replacedByOrderLineNumber>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                                    else " "
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                            
                                                    <ns0:replacedByOrderAssignProdNumber>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                                
                                                    <ns0:replacementPolicyId>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                                    else ""
                                            }
                                            {
                                                if(data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                                
                                                    <ns0:replacementPolicySOACode>{ data($uGODV5_LIT/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                                    else ""
                                            }
                                        </ns0:assignedProdReturnDetails>
                                        else ""
                                        }
                                    </ns0:literatureDetails>
                            }
                            { 
                             if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS)then
                            <ns0:postPaySimDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                {
                                   if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:dispatchMethod))then
                                   
                                        <ns0:dispatchMethod>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                        else ""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:msisdn))then
                                    
                                        <ns0:msisdn>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:msisdn) }</ns0:msisdn>
                                        else ""
                                }
                                {
                                 if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails)then
                                <ns0:migratePortInDetails>
                                {
                                if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns2:instantMigration))then
                                    <ns0:instantMigration>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns2:instantMigration) }</ns0:instantMigration>
                                    else if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn))then
                                    <ns0:portIn>
                                        <ns0:pac>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/ns2:pac) }</ns0:pac>
                                        <ns0:newMSISDN>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/ns2:newMSISDN) }</ns0:newMSISDN>
                                        {
                                            if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/ns2:pacExpiry))then
                                            
                                                <ns0:pacExpiry>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/ns2:pacExpiry) }</ns0:pacExpiry>
                                                else ""
                                        }
                                    </ns0:portIn>
                                    else ""
                                    }
                                </ns0:migratePortInDetails>
                                else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:skuId))then
                                   
                                        <ns0:skuId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:skuId) }</ns0:skuId>
                                        else""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:skuName))then
                                   
                                        <ns0:skuName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:skuName) }</ns0:skuName>
                                        else""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:ssn))then
                                   
                                        <ns0:ssn>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:ssn) }</ns0:ssn>
                                        else ""
                                }
                                <ns0:dispatchStatus>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                                {
                                 if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails)then
                                <ns0:replacementReturnDetails>
                                    <ns0:orderNumberBeingReturned>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                    <ns0:returnSaleableProductLineNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                    <ns0:returnAssignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                    {
                                      if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode))then
                                      <ns0:returnReasonCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                      else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                        
                                            <ns0:returnReasonOutOfPolicyUserName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                            else ""
            
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                      
                                            <ns0:returnAuthorisationNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes))then
                                       
                                            <ns0:returnNotes>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                        
                                            <ns0:replacementPolicyId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                    }
                                </ns0:replacementReturnDetails>
                                else ""
                                }
                                {
                                 if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails)then
                                <ns0:assignedProdReturnDetails>
                                    <ns0:returnReasonCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    <ns0:returnReasonDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                       
                                            <ns0:returnReasonSubTypeDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                            else""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod))then
                                        
                                            <ns0:replacementMethod>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                            else ""
                                    }
                                    {
                                        for $returnNotes in $uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes
                                        return
                                            <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition))then
                                       
                                            <ns0:returnCondition>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                        
                                            <ns0:returnTimestamp>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                        
                                            <ns0:replacedByOrderNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                       
                                            <ns0:replacedByOrderLineNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                       
                                            <ns0:replacedByOrderAssignProdNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                       
                                            <ns0:replacementPolicyId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                        
                                    }
                                </ns0:assignedProdReturnDetails>
                                else ""
                                }
                            </ns0:postPaySimDetails>
                         else ""
                         }
                         {
                          if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT)then
                          <ns0:postPayTariffDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:groupId) }</ns0:groupId>
                                        else ""
                                 }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productName) }</ns0:productName>
                                {
								if(data($referenceDetailsResp))then
								<ns0:productDescription>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/tariffs/TariffProduct[longProductId=data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productId)]/description)}</ns0:productDescription>
								else ""
								}
								{
								if(data($referenceDetailsResp))then
								<ns0:productClassification>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/tariffs/TariffProduct[longProductId=data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productId)]/classification)}</ns0:productClassification>
                                else ""
								}
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    for $uGODV5_TAM in $uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM
                                    return
                                        <ns0:additionalServiceDetails>
                                            <ns0:productId>{ data($uGODV5_TAM/ns2:productId) }</ns0:productId>
                                            <ns0:productName>{ data($uGODV5_TAM/ns2:productName) }</ns0:productName>
                                                        {
								if(data($referenceDetailsResp))then
								<ns0:productDescription>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/boltons/BoltonProduct[longProductId=data($uGODV5_TAM/ns2:productId)]/description)}</ns0:productDescription>
								else ""
								}
								{
								if(data($referenceDetailsResp))then
								<ns0:productClassification>{data($referenceDetailsResp/ns3:referenceDetailsResponse/ns3:referenceData/params/boltons/BoltonProduct[longProductId=data($uGODV5_TAM/ns2:productId)]/classification)}</ns0:productClassification>
                                else ""
								}
                                            <ns0:assignedProductNumber>{ data($uGODV5_TAM/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                            {
                                                if(data($uGODV5_TAM/ns2:orderProductCharge))then
                                               
                                                    <ns0:orderProductCharge>{ data($uGODV5_TAM/ns2:orderProductCharge) }</ns0:orderProductCharge>
                                                    else ""
                                            }
                                        </ns0:additionalServiceDetails>
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:orderProductCharge))then
                                    
                                        <ns0:orderProductCharge>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:orderProductCharge) }</ns0:orderProductCharge>
                                        else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:contractTerm))then
                                  
                                        <ns0:contractTerm>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:contractTerm) ) }</ns0:contractTerm>
                                        else ""
                                }
                                <ns0:dataServiceGeneration>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:dataServiceGeneration) }</ns0:dataServiceGeneration>
                                <ns0:tariffType>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:tariffType) }</ns0:tariffType>
                            </ns0:postPayTariffDetails>
                            else ""
                            }
                            {
                             if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS)then
                             <ns0:prePaySimDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:dispatchMethod))then
                                   
                                        <ns0:dispatchMethod>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:dispatchMethod) }</ns0:dispatchMethod>
                                        else ""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:msisdn))then
                                    
                                        <ns0:msisdn>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:msisdn) }</ns0:msisdn>
                                        else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:skuId))then
                                   
                                        <ns0:skuId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:skuId) }</ns0:skuId>
                                        else " "
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:skuName))then
                                   
                                        <ns0:skuName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:skuName) }</ns0:skuName>
                                        else ""
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:ssn))then
                                    
                                        <ns0:ssn>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:ssn) }</ns0:ssn>
                                        else ""
                                }
                                <ns0:dispatchStatus>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:dispatchStatus) }</ns0:dispatchStatus>
                                {
                                   if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                                {
                                 if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned)then
                                <ns0:replacementReturnDetails>
                                    <ns0:orderNumberBeingReturned>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                                    <ns0:returnSaleableProductLineNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                                    <ns0:returnAssignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                                    {
                                     if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode))then
                                     <ns0:returnReasonCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                     else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName))then
                                        
                                            <ns0:returnReasonOutOfPolicyUserName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes))then
                                        
                                            <ns0:returnNotes>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId))then
                                       
                                            <ns0:replacementPolicyId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else " "
                                    }
                                </ns0:replacementReturnDetails>
                                else ""
                                }
                                {
                                 if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails)then
                                <ns0:assignedProdReturnDetails>
                                    <ns0:returnReasonCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                                    <ns0:returnReasonDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode))then
                                        
                                            <ns0:returnReasonSubTypeCode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription))then
                                        
                                            <ns0:returnReasonSubTypeDescription>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod))then
                                        
                                            <ns0:replacementMethod>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod) }</ns0:replacementMethod>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes))then
                                        
                                            <ns0:returnNotes>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes) }</ns0:returnNotes>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition))then
                                       
                                            <ns0:returnCondition>{ xs:integer( data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition) ) }</ns0:returnCondition>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp))then
                                        
                                            <ns0:returnTimestamp>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp) }</ns0:returnTimestamp>
                                            else ""
                                    }
                                     {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber))then
                                        
                                            <ns0:returnAuthorisationNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                                            else ""
                                     }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber))then
                                        
                                            <ns0:replacedByOrderNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber))then
                                        
                                            <ns0:replacedByOrderLineNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber))then
                                        
                                            <ns0:replacedByOrderAssignProdNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId))then
                                        
                                            <ns0:replacementPolicyId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId) }</ns0:replacementPolicyId>
                                            else ""
                                    }
                                    {
                                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode))then
                                        
                                            <ns0:replacementPolicySOACode>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                                            else ""
                                    }
                                </ns0:assignedProdReturnDetails>
                                else ""
                                }
                            </ns0:prePaySimDetails>
                            else ""
                            
                            }
                            {
                              if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT)then
                              <ns0:prePayTariffDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                            </ns0:prePayTariffDetails>
                            else ""
                            }
                            {
                             if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO)then
                             <ns0:chargeableDeliveryDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:groupId) }</ns0:groupId>
                                        else""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                            </ns0:chargeableDeliveryDetails>
                            else ""
                            }
                            {
                              if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI)then
                               <ns0:postPayInsuranceDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:groupId))then
                                    
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:groupId) }</ns0:groupId>
                                        else ""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:imei))then
                                    
                                        <ns0:imei>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:imei) }</ns0:imei>
                                        else "" 
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:msisdn))then
                                   
                                        <ns0:msisdn>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:msisdn) }</ns0:msisdn>
                                     else ""   
                                }
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:serialNumber))then
                                    
                                        <ns0:serialNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:serialNumber) }</ns0:serialNumber>
                                    else ""    
                                }
                                {
                                 if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns1:uGODV5_CancelExistingInsurance/ns2:insuranceEndDate))then
                                <ns0:cancelExistingInsurance>
                                    <ns0:insuranceEndDate>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns1:uGODV5_CancelExistingInsurance/ns2:insuranceEndDate) }</ns0:insuranceEndDate>
                                </ns0:cancelExistingInsurance>
                                else if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns1:uGODV5_AddNewInsurance/ns2:assignedProductBillingFreq))then
                                <ns0:addNewInsurance>
                                    <ns0:assignedProductBillingFreq>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns1:uGODV5_AddNewInsurance/ns2:assignedProductBillingFreq) }</ns0:assignedProductBillingFreq>
                                </ns0:addNewInsurance>
                                else ""
                                }
                                {
                                 if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:orderProductPrice))then
                                <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                else if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:orderProductCharge))then
                                <ns0:orderProductCharge>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:orderProductCharge) }</ns0:orderProductCharge>
                                else ""
                                }
                            </ns0:postPayInsuranceDetails>
                            else ""
                            }
                          {
                           if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC)then
                           <ns0:standardDeliveryDetails>
                                <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:category) }</ns0:category>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:groupId))then
                                   
                                        <ns0:groupId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:groupId) }</ns0:groupId>
                                        else""
                                }
                                <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:productId) }</ns0:productId>
                                <ns0:productName>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:productName) }</ns0:productName>
                                <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                                {
                                    if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:orderProductPrice))then
                                    
                                        <ns0:orderProductPrice>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_SDC/ns2:orderProductPrice) }</ns0:orderProductPrice>
                                        else ""
                                }
                            </ns0:standardDeliveryDetails>
                            else ""
                          }
                        </ns0:assignedProduct>
                        else ""
                        }
                        
                </ns0:saleableProductDetails>   
            }  
           {  
             if(($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption))then 
             <ns0:deliveryDetails>
               <ns0:chargeableDeliveryOption>
                    <ns0:deliveryDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:deliveryDate) }</ns0:deliveryDate>
                    <ns0:timeslot>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:timeslot) }</ns0:timeslot>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:despatchDate))then
                        
                            <ns0:despatchDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:despatchDate) }</ns0:despatchDate>
                            else ""
                    }
                </ns0:chargeableDeliveryOption>
				 {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:requestedCarrier))then
                   
                        <ns0:requestedCarrier>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:requestedCarrier) }</ns0:requestedCarrier>
                      else ""  
                 }
                <ns0:destinationName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:destinationName) }</ns0:destinationName>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:deliveryContactNumber))then
                    
                        <ns0:deliveryContactNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:deliveryContactNumber) }</ns0:deliveryContactNumber>
                        else ""
                }
				
                {
                  if($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress)then
                <ns0:standardAddress>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:addressStatus))then
                       
                            <ns0:addressStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber))then
                       
                            <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:street))then
                       
                            <ns0:street>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:street) }</ns0:street>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:city))then
                        
                            <ns0:city>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:city) }</ns0:city>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:county))then
                        
                            <ns0:county>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:county) }</ns0:county>
                            else ""
                    }
                    <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                    <ns0:postcode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                </ns0:standardAddress>
                else ""
                }
                <ns0:deliveryAddressModified>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:deliveryAddressModified) }</ns0:deliveryAddressModified>
               {
                if($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails)then
                <ns0:storeDetails>
                    <ns0:storeNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails/ns2:storeNumber) }</ns0:storeNumber>
                    <ns0:storeName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails/ns2:storeName) }</ns0:storeName>
                </ns0:storeDetails>
                else ""
                }
                {
                    for $uGODV5_DespatchDetails in $utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails
                    return
                        <ns0:despatchDetails>
                            {
                                if(data($uGODV5_DespatchDetails/ns2:parcelNumber))then
                                
                                    <ns0:parcelNumber>{ data($uGODV5_DespatchDetails/ns2:parcelNumber) }</ns0:parcelNumber>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:actualCarrier))then
                                
                                    <ns0:actualCarrier>{ data($uGODV5_DespatchDetails/ns2:actualCarrier) }</ns0:actualCarrier>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:actualServiceType))then
                                
                                    <ns0:actualServiceType>{ data($uGODV5_DespatchDetails/ns2:actualServiceType) }</ns0:actualServiceType>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:despatchDate))then
                                
                                    <ns0:despatchDate>{ data($uGODV5_DespatchDetails/ns2:despatchDate) }</ns0:despatchDate>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:despatchReference))then
                               
                                    <ns0:despatchReference>{ data($uGODV5_DespatchDetails/ns2:despatchReference) }</ns0:despatchReference>
                                    else " "
                            }
                            {
                               if(data($uGODV5_DespatchDetails/ns2:storeReceivedTimestamp))then
                                
                                    <ns0:storeReceivedTimestamp>{ data($uGODV5_DespatchDetails/ns2:storeReceivedTimestamp) }</ns0:storeReceivedTimestamp>
                                    else ""
                            }
                            {
                               if(data($uGODV5_DespatchDetails/ns2:customerCollectedTimestamp))then
                                
                                    <ns0:customerCollectedTimestamp>{ data($uGODV5_DespatchDetails/ns2:customerCollectedTimestamp) }</ns0:customerCollectedTimestamp>
                                    else " "
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:storeReturnedTimestamp))then
                                
                                    <ns0:storeReturnedTimestamp>{ data($uGODV5_DespatchDetails/ns2:storeReturnedTimestamp) }</ns0:storeReturnedTimestamp>
                                    else ""
                            }
                        </ns0:despatchDetails>
                }
            </ns0:deliveryDetails>
            else if(($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:isStandardDeliveryOption))then 
			
			<ns0:deliveryDetails>
                 <ns0:isStandardDeliveryOption>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:isStandardDeliveryOption) }</ns0:isStandardDeliveryOption>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:requestedCarrier))then
                   
                        <ns0:requestedCarrier>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:requestedCarrier) }</ns0:requestedCarrier>
                      else ""  
                }
                <ns0:destinationName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:destinationName) }</ns0:destinationName>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:deliveryContactNumber))then
                    
                        <ns0:deliveryContactNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:deliveryContactNumber) }</ns0:deliveryContactNumber>
                        else ""
                }
                
				
                
                 {
                  if($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress)then
                <ns0:standardAddress>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:addressStatus))then
                       
                            <ns0:addressStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber))then
                       
                            <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:street))then
                       
                            <ns0:street>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:street) }</ns0:street>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:city))then
                        
                            <ns0:city>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:city) }</ns0:city>
                            else ""
                    }
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:county))then
                        
                            <ns0:county>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:county) }</ns0:county>
                            else ""
                    }
                    <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                    <ns0:postcode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                </ns0:standardAddress>
                else ""
                }
                <ns0:deliveryAddressModified>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns2:deliveryAddressModified) }</ns0:deliveryAddressModified>
               {
                if($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails)then
                <ns0:storeDetails>
                    <ns0:storeNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails/ns2:storeNumber) }</ns0:storeNumber>
                    <ns0:storeName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails/ns2:storeName) }</ns0:storeName>
                </ns0:storeDetails>
                else ""
                }
                {
                    for $uGODV5_DespatchDetails in $utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails
                    return
                        <ns0:despatchDetails>
                            {
                                if(data($uGODV5_DespatchDetails/ns2:parcelNumber))then
                                
                                    <ns0:parcelNumber>{ data($uGODV5_DespatchDetails/ns2:parcelNumber) }</ns0:parcelNumber>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:actualCarrier))then
                                
                                    <ns0:actualCarrier>{ data($uGODV5_DespatchDetails/ns2:actualCarrier) }</ns0:actualCarrier>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:actualServiceType))then
                                
                                    <ns0:actualServiceType>{ data($uGODV5_DespatchDetails/ns2:actualServiceType) }</ns0:actualServiceType>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:despatchDate))then
                                
                                    <ns0:despatchDate>{ data($uGODV5_DespatchDetails/ns2:despatchDate) }</ns0:despatchDate>
                                    else ""
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:despatchReference))then
                               
                                    <ns0:despatchReference>{ data($uGODV5_DespatchDetails/ns2:despatchReference) }</ns0:despatchReference>
                                    else " "
                            }
                            {
                               if(data($uGODV5_DespatchDetails/ns2:storeReceivedTimestamp))then
                                
                                    <ns0:storeReceivedTimestamp>{ data($uGODV5_DespatchDetails/ns2:storeReceivedTimestamp) }</ns0:storeReceivedTimestamp>
                                    else ""
                            }
                            {
                               if(data($uGODV5_DespatchDetails/ns2:customerCollectedTimestamp))then
                                
                                    <ns0:customerCollectedTimestamp>{ data($uGODV5_DespatchDetails/ns2:customerCollectedTimestamp) }</ns0:customerCollectedTimestamp>
                                    else " "
                            }
                            {
                                if(data($uGODV5_DespatchDetails/ns2:storeReturnedTimestamp))then
                                
                                    <ns0:storeReturnedTimestamp>{ data($uGODV5_DespatchDetails/ns2:storeReturnedTimestamp) }</ns0:storeReturnedTimestamp>
                                    else ""
                            }
                        </ns0:despatchDetails>
                }
            </ns0:deliveryDetails>
			else ""
			
            }
            {
             if($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails)then
             <ns0:creditCheckDetails>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:orderCreditCheckStatus))then
                   
                        <ns0:orderCreditCheckStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:orderCreditCheckStatus) }</ns0:orderCreditCheckStatus>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:creditVetNumber))then
                    
                        <ns0:creditVetNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:creditVetNumber) }</ns0:creditVetNumber>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:creditScore))then
                    
                        <ns0:creditScore>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:creditScore) }</ns0:creditScore>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:lastCreditCheckDate))then
                    
                        <ns0:lastCreditCheckDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:lastCreditCheckDate) }</ns0:lastCreditCheckDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:creditClassId))then
                    
                        <ns0:creditClassId>{ xs:integer( data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:creditClassId) ) }</ns0:creditClassId>
                        else ""
                }
                {
                 if($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails)then
                <ns0:depositDetails>
                    <ns0:depositType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositType) }</ns0:depositType>
                    <ns0:depositAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositAmount) }</ns0:depositAmount>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositDuration))then
                       
                            <ns0:depositDuration>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositDuration) }</ns0:depositDuration>
                            else ""
                    }
                    {
                       if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositReference))then
                        
                            <ns0:depositReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositReference) }</ns0:depositReference>
                            else ""
                    }
                </ns0:depositDetails>
                else ""
                }
                {
                 if($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails)then
                <ns0:transactCreditCheckDetails>
                    <ns0:creditCheckResultCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:creditCheckResultCode) }</ns0:creditCheckResultCode>
                    <ns0:totalMonthlyCharge>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:totalMonthlyCharge) }</ns0:totalMonthlyCharge>
                    {
                        if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:creditLimit))then
                       
                            <ns0:creditLimit>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:creditLimit) }</ns0:creditLimit>
                            else ""
                    }
                </ns0:transactCreditCheckDetails>
                else " "
                }
                <ns0:legalEntityAddress>
                    <ns0:legalEntityCustomerName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns2:legalEntityCustomerName) }</ns0:legalEntityCustomerName>
                    <ns0:standardAddress>
                        {
                            if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:addressStatus))then
                            
                                <ns0:addressStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:addressStatus) }</ns0:addressStatus>
                                else ""
                        }
                        {
                           if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:houseNameOrNumber))then
                           
                                <ns0:houseNameOrNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:houseNameOrNumber) }</ns0:houseNameOrNumber>
                                else ""
                        }
                        {
                            if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:street))then
                            
                                <ns0:street>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:street) }</ns0:street>
                                else ""
                        }
                        {
                            if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:city))then
                            
                                <ns0:city>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:city) }</ns0:city>
                                else ""
                        }
                        {
                            if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:county))then
                             <ns0:county>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:county) }</ns0:county>
                                else ""
                        }
                        <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                        <ns0:postcode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                    </ns0:standardAddress>
                </ns0:legalEntityAddress>
                {
                 if($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address)then
                <ns0:previousAddress>
                    {
                        let $standardAddress := $utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress
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
                                <ns0:country>{ data($standardAddress/ns2:country) }</ns0:country>
                                <ns0:postcode>{ data($standardAddress/ns2:postcode) }</ns0:postcode>
                            </ns0:standardAddress>
                    }
                </ns0:previousAddress>
                else " "
                }
                {
                   if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:referralReason))then
                    
                        <ns0:referralReason>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails/ns2:referralReason) }</ns0:referralReason>
                        else ""
                }
            </ns0:creditCheckDetails>
            else ""
            }
            {
              if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails))then
              <ns0:upgradeDetails>
                    <ns0:msisdnDetails>
                        <ns0:upgradeMSISDN>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_MsisdnDetails/ns2:upgradeMSISDN) }</ns0:upgradeMSISDN>
                        {
                         if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_MsisdnDetails/ns2:msisdn))then
                        
                            <ns0:msisdn>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_MsisdnDetails/ns2:msisdn) }</ns0:msisdn>
                            else ""
                       }
                    </ns0:msisdnDetails> 
                    <ns0:upgradeDiscounts>
                    <ns0:upgradeDiscountApplicable>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeDiscounts/ns2:upgradeDiscountApplicable) }</ns0:upgradeDiscountApplicable>
                    <ns0:upgradeDiscountActual>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeDiscounts/ns2:upgradeDiscountActual) }</ns0:upgradeDiscountActual>
                </ns0:upgradeDiscounts>
                {
                 if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:CCASettlementAmount))then
                   <ns0:upgradeEntitlementDetails>
                      <ns0:advancedEntitlement>
                        <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                        <ns0:upgradePaymentStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:upgradePaymentStatus) }</ns0:upgradePaymentStatus>
                        <ns0:CCASettlementAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:CCASettlementAmount) }</ns0:CCASettlementAmount>
                        
                     </ns0:advancedEntitlement>
                   </ns0:upgradeEntitlementDetails>
                   else if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:earlyUpgradeOffered))then
                   <ns0:upgradeEntitlementDetails>
                      <ns0:advancedEntitlement>
                        <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                        <ns0:upgradePaymentStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:upgradePaymentStatus) }</ns0:upgradePaymentStatus>
                        <ns0:earlyUpgradeOffered>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                        <ns0:earlyUpgradeTaken>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                        <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                      </ns0:advancedEntitlement>
                   </ns0:upgradeEntitlementDetails>
                  else if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeOffered))then
                  
                  <ns0:upgradeEntitlementDetails>
                    <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                    <ns0:earlyUpgradeOffered>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                    <ns0:earlyUpgradeTaken>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                    <ns0:earlyUpgradeReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeReference) }</ns0:earlyUpgradeReference>
                  </ns0:upgradeEntitlementDetails>
                  else ""
                 }
                 
               </ns0:upgradeDetails>
               else ""
            }  
            (:: upgrade should add - Clarification ::)
            {
             if(data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice))then
             <ns0:returnedLeasedDevice>
                <ns0:handsetMake>{ data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice/ns2:handsetMake) }</ns0:handsetMake>
                <ns0:handsetModel>{ data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice/ns2:handsetModel) }</ns0:handsetModel>
                <ns0:imei>{ data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice/ns2:imei) }</ns0:imei>
            </ns0:returnedLeasedDevice>
            else " "
            }
            
            {
              if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails))then
               <ns0:upgradeOfferDetails>
                <ns0:msisdn>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:msisdn) }</ns0:msisdn>
                <ns0:channel>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:channel) }</ns0:channel>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:storeType))then
                   
                        <ns0:storeType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:storeType) }</ns0:storeType>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:retailerId))then
                    
                        <ns0:retailerId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:retailerId) }</ns0:retailerId>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:userId))then
                   
                        <ns0:userId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:userId) }</ns0:userId>
                        else ""
                }
                <ns0:upgradeEntitlementReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:upgradeEntitlementReference) }</ns0:upgradeEntitlementReference>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:tariffProductId))then
                  
                        <ns0:tariffProductId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:tariffProductId) }</ns0:tariffProductId>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:tenure))then
                   
                        <ns0:tenure>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:tenure) }</ns0:tenure>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:contractStartDate))then
                    
                        <ns0:contractStartDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:contractStartDate) }</ns0:contractStartDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:contractEndDate))then
                    
                        <ns0:contractEndDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:contractEndDate) }</ns0:contractEndDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:serviceTenure))then
                 
                        <ns0:serviceTenure>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:serviceTenure) }</ns0:serviceTenure>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:lastUpgradeDate))then
                   
                        <ns0:lastUpgradeDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:lastUpgradeDate) }</ns0:lastUpgradeDate>
                        else ""
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:currentMonthlySpend))then
                    
                        <ns0:currentMonthlySpend>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:currentMonthlySpend) }</ns0:currentMonthlySpend>
                        else ""
                }
                <ns0:eligibleForUpgrade>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:eligibleForUpgrade) }</ns0:eligibleForUpgrade>
                <ns0:upgradeAvailable>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:upgradeAvailable) }</ns0:upgradeAvailable>
                <ns0:overrideAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:overrideAllowed) }</ns0:overrideAllowed>
                
                <ns0:upgradeOfferExpiry>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:upgradeOfferExpiry) }</ns0:upgradeOfferExpiry>
                {
                    for $uGODV5_UpgradeOptions in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradeOptions
                    return
                        <ns0:upgradeOptions>
                            <ns0:upgradeType>{ data($uGODV5_UpgradeOptions/ns2:upgradeType) }</ns0:upgradeType>
                            <ns0:isUpgradeAllowed>{ data($uGODV5_UpgradeOptions/ns2:isUpgradeAllowed) }</ns0:isUpgradeAllowed>
                            <ns0:onAccountPaymentAccepted>{ data($uGODV5_UpgradeOptions/ns2:onAccountPaymentAccepted) }</ns0:onAccountPaymentAccepted>
                            {
                             if(data($uGODV5_UpgradeOptions/ns1:uGODV5_StandardUpgradeDetails))then
                            <ns0:standardUpgradeDetails>
                                <ns0:upgradeEligibilityDate>{ data($uGODV5_UpgradeOptions/ns1:uGODV5_StandardUpgradeDetails/ns2:upgradeEligibilityDate) }</ns0:upgradeEligibilityDate>
                            </ns0:standardUpgradeDetails>
                            else ""
                            }
                            {
                             if(data($uGODV5_UpgradeOptions/ns1:uGODV5_PaidUpgradeDetails))then
                            <ns0:paidUpgradeDetails>
                                <ns0:upgradeEligibilityDate>{ data($uGODV5_UpgradeOptions/ns1:uGODV5_PaidUpgradeDetails/ns2:upgradeEligibilityDate) }</ns0:upgradeEligibilityDate>
                            </ns0:paidUpgradeDetails>
                            else ""
                            }
                        </ns0:upgradeOptions>
                }
                {
                  if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment) and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:CCANumber) )then
                   <ns0:upgradePayment>
                      <ns0:CCANumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:CCANumber) }</ns0:CCANumber> 
                      <ns0:CCASettlementAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:CCASettlementAmount) }</ns0:CCASettlementAmount> 
                      <ns0:isCCAPaymentAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:isCCAPaymentAllowed) }</ns0:isCCAPaymentAllowed>
                   
                    </ns0:upgradePayment>
                    
                    else if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:earlyUpgradeFee))then
                    <ns0:upgradePayment>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee> 
                    <ns0:isFTUPaymentAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/ns2:isFTUPaymentAllowed) }</ns0:isFTUPaymentAllowed>
                    </ns0:upgradePayment>
                    else ""
                   }
                       
                    
				   
                
            </ns0:upgradeOfferDetails>
            else ""
            
            }
            {
             if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory))then
             <ns0:orderHistory>
                <ns0:createdTimestamp>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:createdTimestamp) }</ns0:createdTimestamp>
                <ns0:createdBy>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:createdBy) }</ns0:createdBy>
                <ns0:orderEvent>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:orderEvent) }</ns0:orderEvent>
                <ns0:orderEventDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:orderEventDescription) }</ns0:orderEventDescription>
                <ns0:deleted>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:deleted) }</ns0:deleted>
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:lastUpdated))then
                   
                        <ns0:lastUpdated>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:lastUpdated) }</ns0:lastUpdated>
                      else " "  
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:lastUpdatedBy))then
                    
                        <ns0:lastUpdatedBy>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:lastUpdatedBy) }</ns0:lastUpdatedBy>
                     else ""    
                }
                {
                    if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:freeFormText))then
                   
                        <ns0:freeFormText>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:freeFormText) }</ns0:freeFormText>
                    else " " 
                }  
            </ns0:orderHistory>
            else ""
            
            }
            {
             if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus))then
            <ns0:collectionStatus>
                <ns0:orderCollectionVerificationLevel>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:orderCollectionVerificationLevel) }</ns0:orderCollectionVerificationLevel>
                <ns0:storeNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:storeNumber) }</ns0:storeNumber>
                <ns0:collectionReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:collectionReference) }</ns0:collectionReference>
                <ns0:collectionStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:collectionStatus) }</ns0:collectionStatus>
                
            </ns0:collectionStatus>
            else ""
            }
              {
                if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails))then
                 <ns0:orderPartyDetails>
                        {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:title))then
                          <ns0:title>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:title)}</ns0:title>
                          else ""
                        } 
                         {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:forename))then
                          <ns0:forename>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:forename)}</ns0:forename>
                          else ""
                        } 
                         
                          <ns0:surname>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:surname)}</ns0:surname>
                        
                       
                         {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:alternativeContactNumber))then
                          <ns0:alternativeContactNumber>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:alternativeContactNumber)}</ns0:alternativeContactNumber>
                          else ""
                        } 
                        {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:emailAddress))then
                          <ns0:emailAddress>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyDetails/ns2:emailAddress)}</ns0:emailAddress>
                          else ""
                        } 
                        
                 </ns0:orderPartyDetails>
                else "" 
              }
                 {
                if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress))then
                 <ns0:orderPartyAddress>
                        {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:houseNameOrNumber))then
                          <ns0:houseNameorNumber>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:houseNameOrNumber)}</ns0:houseNameorNumber>
                          else ""
                        } 
                         {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:street))then
                          <ns0:street>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:street)}</ns0:street>
                          else ""
                        } 
                          {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:city))then
                          <ns0:city>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:city)}</ns0:city>
                          else ""
                        } 
                         {
                          if(data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:county))then
                          <ns0:county>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:county)}</ns0:county>
                          else ""
                        } 
                      
                          <ns0:postcode>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:postcode)}</ns0:postcode>
                          <ns0:country>{data($configData/countryNameGeographical)}</ns0:country>
                          
                 </ns0:orderPartyAddress>
                else "" 
              }
        </ns0:getOrderDetails_3Response>
};

declare variable $utilGetOrderDetailsV5Resp as element() external;
declare variable $configData as element(*) external;
declare variable $referenceDetailsResp as element(*) external;

xf:ConstructGetOrderDetails_3RS($utilGetOrderDetailsV5Resp,
    $configData,$referenceDetailsResp)