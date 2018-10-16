xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsV5Resp" type="ns1:companionMessage/ns1:utilGetOrderDetailsV5Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 26/09/2014 		2.0.0 		Dolly K           	Initial version :)
(: 13/11/2014 		3.0.0 		Vanishree           added orderPartyDetails and orderPartyAddress as part of ICD375 :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/utilGetOrderDetailsV5RespToGetOrderDetails_3Response/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:utilGetOrderDetailsV5RespToGetOrderDetails_3Response($utilGetOrderDetailsV5Resp as element(),$configData as element(*))
    as element(ns0:getOrderDetails_3Response) {
        <ns0:getOrderDetails_3Response>
        <ns0:responseCode>{ data($configData/getOrderDetails/successCode) }</ns0:responseCode>
            <ns0:orderHeaderDetails>
                <ns0:orderNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderNumber) }</ns0:orderNumber>
                <ns0:oid>{ xs:integer( data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:oid) ) }</ns0:oid>
                <ns0:orderTimestamp>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderTimestamp) }</ns0:orderTimestamp>
                <ns0:orderType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderType) }</ns0:orderType>
                <ns0:orderStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderStatus) }</ns0:orderStatus>
                {
                    for $preOrderOfferingId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:preOrderOfferingId
                    return
                        <ns0:preOrderOfferingId>{ data($preOrderOfferingId) }</ns0:preOrderOfferingId>
                }
            </ns0:orderHeaderDetails>
            <ns0:orderSourceDetails>
                <ns0:orderMethod>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:orderMethod) }</ns0:orderMethod>
                <ns0:partner>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:partner) }</ns0:partner>
                <ns0:owningBusinessDivision>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:owningBusinessDivision) }</ns0:owningBusinessDivision>
                <ns0:sourceOfSale>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:sourceOfSale) }</ns0:sourceOfSale>
                {
                    for $retailerId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:retailerId
                    return
                        <ns0:retailerId>{ data($retailerId) }</ns0:retailerId>
                }
                {
                    for $posBusinessUnit in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:posBusinessUnit
                    return
                        <ns0:posBusinessUnit>{ data($posBusinessUnit) }</ns0:posBusinessUnit>
                }
                {
                    for $storeName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:storeName
                    return
                        <ns0:storeName>{ data($storeName) }</ns0:storeName>
                }
                {
                    for $storeType in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:storeType
                    return
                        <ns0:storeType>{ data($storeType) }</ns0:storeType>
                }
                {
                    for $salesPerson in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:salesPerson
                    return
                        <ns0:salesPerson>{ data($salesPerson) }</ns0:salesPerson>
                }
                {
                    for $salesManager in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:salesManager
                    return
                        <ns0:salesManager>{ data($salesManager) }</ns0:salesManager>
                }
                {
                    for $csaId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:csaId
                    return
                        <ns0:csaId>{ data($csaId) }</ns0:csaId>
                }
                {
                    for $userAlias in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:userAlias
                    return
                        <ns0:userAlias>{ data($userAlias) }</ns0:userAlias>
                }
                {
                    for $callContactID in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:callContactID
                    return
                        <ns0:callContactID>{ data($callContactID) }</ns0:callContactID>
                }
                {
                    for $callTypeIndicator in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:callTypeIndicator
                    return
                        <ns0:callTypeIndicator>{ data($callTypeIndicator) }</ns0:callTypeIndicator>
                }
                <ns0:proofs>
                    <ns0:proofOfAddress>
                        <ns0:proofType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfAddress/ns2:proofType) }</ns0:proofType>
                        {
                            for $proofData in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfAddress/ns2:proofData
                            return
                                <ns0:proofData>{ data($proofData) }</ns0:proofData>
                        }
                    </ns0:proofOfAddress>
                    <ns0:proofOfIdentity>
                        <ns0:proofType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfIdentity/ns2:proofType) }</ns0:proofType>
                        {
                            for $proofData in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns1:uGODV5_Proofs/ns1:uGODV5_ProofOfIdentity/ns2:proofData
                            return
                                <ns0:proofData>{ data($proofData) }</ns0:proofData>
                        }
                    </ns0:proofOfIdentity>
                </ns0:proofs>
            </ns0:orderSourceDetails>
            <ns0:initialPaymentDetails>
                <ns0:cardDetails>
                    <ns0:cardNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber) }</ns0:cardNumber>
                    <ns0:cardExpiryDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardExpiryDate) }</ns0:cardExpiryDate>
                    <ns0:cardHolderName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardHolderName) }</ns0:cardHolderName>
                    {
                        for $cardIssueDate in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssueDate
                        return
                            <ns0:cardIssueDate>{ data($cardIssueDate) }</ns0:cardIssueDate>
                    }
                    {
                        for $cardIssueNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssueNumber
                        return
                            <ns0:cardIssueNumber>{ data($cardIssueNumber) }</ns0:cardIssueNumber>
                    }
                    <ns0:postCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:postcode) }</ns0:postCode>
                    {
                        for $houseNameOrNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:houseNameOrNumber
                        return
                            <ns0:houseNameOrNumber>{ data($houseNameOrNumber) }</ns0:houseNameOrNumber>
                    }
                    <ns0:bankCardIssuer>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardIssuerName) }</ns0:bankCardIssuer>
                </ns0:cardDetails>
                <ns0:paymentDetails>
                    <ns0:authorisationStatus>{ xs:integer( data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/authorisationStatus) ) }</ns0:authorisationStatus>
                    {
                        for $authorisationRespCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/authorisationRespCode
                        return
                            <ns0:authorisationRespCode>{ data($authorisationRespCode) }</ns0:authorisationRespCode>
                    }
                    {
                        for $authorisationRespMessage in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/authorisationRespMessage
                        return
                            <ns0:authorisationRespMessage>{ data($authorisationRespMessage) }</ns0:authorisationRespMessage>
                    }
                    {
                        for $authorisationCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/authorisationCode
                        return
                            <ns0:authorisationCode>{ data($authorisationCode) }</ns0:authorisationCode>
                    }
                    {
                        for $authMessage in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/authMessage
                        return
                            <ns0:authMessage>{ data($authMessage) }</ns0:authMessage>
                    }
                    {
                        for $buynetId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/buynetId
                        return
                            <ns0:buynetId>{ data($buynetId) }</ns0:buynetId>
                    }
                    {
                        for $settlementRespCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_PaymentDetails/settlementRespCode
                        return
                            <ns0:settlementRespCode>{ data($settlementRespCode) }</ns0:settlementRespCode>
                    }
                </ns0:paymentDetails>
                <ns0:paymentReferenceNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/paymentReferenceNumber) }</ns0:paymentReferenceNumber>
                {
                    for $cardToken in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/cardToken
                    return
                        <ns0:cardToken>{ data($cardToken) }</ns0:cardToken>
                }
                {
                    for $externalPaymentId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/externalPaymentId
                    return
                        <ns0:externalPaymentId>{ data($externalPaymentId) }</ns0:externalPaymentId>
                }
                <ns0:billingAccountNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/billingAccountNumber) }</ns0:billingAccountNumber>
                <ns0:paymentMoney>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/paymentMoney) }</ns0:paymentMoney>
            </ns0:initialPaymentDetails>
            <ns0:recurringPaymentDetails>
                <ns0:existingAccount>
                    <ns0:billingAccountNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_ExistingAccount/billingAccountNumber) }</ns0:billingAccountNumber>
                    <ns0:billingCustomerNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_ExistingAccount/billingCustomerNumber) }</ns0:billingCustomerNumber>
                    <ns0:revisedDirectDebitDetails>
                        <ns0:userAccountNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/userAccountNumber) }</ns0:userAccountNumber>
                        {
                            for $bankAccountNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/bankAccountNumber
                            return
                                <ns0:bankAccountNumber>{ data($bankAccountNumber) }</ns0:bankAccountNumber>
                        }
                        <ns0:bankSortCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/bankSortCode) }</ns0:bankSortCode>
                        <ns0:bankAccountName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_ExistingAccount/ns1:revisedDirectDebitDetails/bankAccountName) }</ns0:bankAccountName>
                    </ns0:revisedDirectDebitDetails>
                </ns0:existingAccount>
                <ns0:newAccount>
                    <ns0:billingAccountNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/billingAccountNumber) }</ns0:billingAccountNumber>
                    <ns0:billingCustomerNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/billingCustomerNumber) }</ns0:billingCustomerNumber>
                    <ns0:accountRecurringPaymentDetails>
                        <ns0:accountContinuousCCAuthority>
                            <ns0:cardNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/cardNumber) }</ns0:cardNumber>
                            <ns0:cardExpiryDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/cardExpiryDate) }</ns0:cardExpiryDate>
                            <ns0:cardHolderName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/cardHolderName) }</ns0:cardHolderName>
                            {
                                for $cardIssueDate in $utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/cardIssueDate
                                return
                                    <ns0:cardIssueDate>{ data($cardIssueDate) }</ns0:cardIssueDate>
                            }
                            {
                                for $cardIssueNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/cardIssueNumber
                                return
                                    <ns0:cardIssueNumber>{ data($cardIssueNumber) }</ns0:cardIssueNumber>
                            }
                            <ns0:postCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/postcode) }</ns0:postCode>
                            {
                                for $houseNameOrNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/houseNameOrNumber
                                return
                                    <ns0:houseNameOrNumber>{ data($houseNameOrNumber) }</ns0:houseNameOrNumber>
                            }
                            <ns0:cardType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountContinuousCCAuthority/cardType) }</ns0:cardType>
                        </ns0:accountContinuousCCAuthority>
                        <ns0:accountDirectDebitDetails>
                            <ns0:userAccountNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/userAccountNumber) }</ns0:userAccountNumber>
                            {
                                for $bankAccountNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/bankAccountNumber
                                return
                                    <ns0:bankAccountNumber>{ data($bankAccountNumber) }</ns0:bankAccountNumber>
                            }
                            <ns0:bankSortCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/bankSortCode) }</ns0:bankSortCode>
                            <ns0:bankAccountName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/ns1:uGODV5_AccountDirectDebitDetails/bankAccountName) }</ns0:bankAccountName>
                        </ns0:accountDirectDebitDetails>
                        <ns0:continuousChequePayments>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_RecurringPaymentDetails[1]/ns1:uGODV5_NewAccount/ns1:uGODV5_AccountRecurringPaymentDetails/continuousChequePayments) }</ns0:continuousChequePayments>
                    </ns0:accountRecurringPaymentDetails>
                </ns0:newAccount>
            </ns0:recurringPaymentDetails>
            <ns0:orderTotalDetails>
                <ns0:vatTotal>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatTotal) }</ns0:vatTotal>
                <ns0:vatCodeDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatCodeDescription) }</ns0:vatCodeDescription>
                <ns0:vatReceiptRequired>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatReceiptRequired) }</ns0:vatReceiptRequired>
                <ns0:vatExclusiveTotalPrice>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatExclusiveTotalPrice) }</ns0:vatExclusiveTotalPrice>
                <ns0:vatReceiptProduced>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:vatReceiptProduced) }</ns0:vatReceiptProduced>
                <ns0:total>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderTotalDetails/ns2:total) }</ns0:total>
            </ns0:orderTotalDetails>
            <ns0:saleableProductDetails>
                <ns0:saleableProductLineNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:saleableProductLineNumber) }</ns0:saleableProductLineNumber>
                <ns0:saleableProductId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:saleableProductId) }</ns0:saleableProductId>
                <ns0:saleableProductName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:saleableProductName) }</ns0:saleableProductName>
                <ns0:saleableProductPrice>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:saleableProductPrice) }</ns0:saleableProductPrice>
                <ns0:originalPrice>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:originalPrice) }</ns0:originalPrice>
                <ns0:vatDetails>
                    <ns0:vatRate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_VatDetails/ns2:vatRate) }</ns0:vatRate>
                    <ns0:vatAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_VatDetails/ns2:vatAmount) }</ns0:vatAmount>
                    <ns0:vatExclusivePrice>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_VatDetails/ns2:vatExclusivePrice) }</ns0:vatExclusivePrice>
                    <ns0:vatReversalReceiptStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_VatDetails/ns2:vatReversalReceiptStatus) }</ns0:vatReversalReceiptStatus>
                </ns0:vatDetails>
                {
                    for $billingAccountNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:billingAccountNumber
                    return
                        <ns0:billingAccountNumber>{ data($billingAccountNumber) }</ns0:billingAccountNumber>
                }
                {
                    for $billingCrossChargeAccountNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns2:billingCrossChargeAccountNumber
                    return
                        <ns0:billingCrossChargeAccountNumber>{ data($billingCrossChargeAccountNumber) }</ns0:billingCrossChargeAccountNumber>
                }
                <ns0:assignedProduct>
                    <ns0:accessoryDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        {
                            for $dispatchMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:dispatchMethod
                            return
                                <ns0:dispatchMethod>{ data($dispatchMethod) }</ns0:dispatchMethod>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $make in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:make
                            return
                                <ns0:make>{ data($make) }</ns0:make>
                        }
                        {
                            for $model in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:model
                            return
                                <ns0:model>{ data($model) }</ns0:model>
                        }
                        {
                            for $risk in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:risk
                            return
                                <ns0:risk>{ data($risk) }</ns0:risk>
                        }
                        {
                            for $skuId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:skuId
                            return
                                <ns0:skuId>{ data($skuId) }</ns0:skuId>
                        }
                        {
                            for $skuName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:skuName
                            return
                                <ns0:skuName>{ data($skuName) }</ns0:skuName>
                        }
                        {
                            for $serialNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:serialNumber
                            return
                                <ns0:serialNumber>{ data($serialNumber) }</ns0:serialNumber>
                        }
                        {
                            for $imei in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:imei
                            return
                                <ns0:imei>{ data($imei) }</ns0:imei>
                        }
                        <ns0:dispatchStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:dispatchStatus) }</ns0:dispatchStatus>
                        {
                            for $orderProductPrice in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns2:orderProductPrice
                            return
                                <ns0:orderProductPrice>{ data($orderProductPrice) }</ns0:orderProductPrice>
                        }
                        <ns0:replacementReturnDetails>
                            <ns0:orderNumberBeingReturned>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                            <ns0:returnSaleableProductLineNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                            <ns0:returnAssignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonOutOfPolicyUserName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName
                                return
                                    <ns0:returnReasonOutOfPolicyUserName>{ data($returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:replacementReturnDetails>
                        <ns0:assignedProdReturnDetails>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            <ns0:returnReasonDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonSubTypeDescription in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription
                                return
                                    <ns0:returnReasonSubTypeDescription>{ data($returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                            }
                            {
                                for $replacementMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod
                                return
                                    <ns0:replacementMethod>{ data($replacementMethod) }</ns0:replacementMethod>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $returnCondition in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition
                                return
                                    <ns0:returnCondition>{ xs:integer( data($returnCondition) ) }</ns0:returnCondition>
                            }
                            {
                                for $returnTimestamp in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp
                                return
                                    <ns0:returnTimestamp>{ data($returnTimestamp) }</ns0:returnTimestamp>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $replacedByOrderNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber
                                return
                                    <ns0:replacedByOrderNumber>{ data($replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                            }
                            {
                                for $replacedByOrderLineNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber
                                return
                                    <ns0:replacedByOrderLineNumber>{ data($replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                            }
                            {
                                for $replacedByOrderAssignProdNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber
                                return
                                    <ns0:replacedByOrderAssignProdNumber>{ data($replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ACC[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:assignedProdReturnDetails>
                    </ns0:accessoryDetails>
                    <ns0:adjustmentDetails>
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:productId) }</ns0:productId>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:productName) }</ns0:productName>
                        <ns0:creditOrDebit>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:creditOrDebit) }</ns0:creditOrDebit>
                        <ns0:adjustmentAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:adjustmentAmount) }</ns0:adjustmentAmount>
                        <ns0:adjustmentReason>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:adjustmentReason) }</ns0:adjustmentReason>
                        {
                            for $adjustmentCircumstances in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_ADJ[1]/ns2:adjustmentCircumstances
                            return
                                <ns0:adjustmentCircumstances>{ data($adjustmentCircumstances) }</ns0:adjustmentCircumstances>
                        }
                    </ns0:adjustmentDetails>
                    <ns0:handsetDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        {
                            for $dispatchMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:dispatchMethod
                            return
                                <ns0:dispatchMethod>{ data($dispatchMethod) }</ns0:dispatchMethod>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        <ns0:make>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetMake) }</ns0:make>
                        <ns0:model>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetModel) }</ns0:model>
                        {
                            for $handsetRisk in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetRisk
                            return
                                <ns0:risk>{ xs:short( data($handsetRisk) ) }</ns0:risk>
                        }
                        {
                            for $skuId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuId
                            return
                                <ns0:skuId>{ data($skuId) }</ns0:skuId>
                        }
                        {
                            for $skuName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuName
                            return
                                <ns0:skuName>{ data($skuName) }</ns0:skuName>
                        }
                        {
                            for $imei in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:imei
                            return
                                <ns0:imei>{ data($imei) }</ns0:imei>
                        }
                        <ns0:dispatchStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:dispatchStatus) }</ns0:dispatchStatus>
                        {
                            for $orderProductPrice in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:orderProductPrice
                            return
                                <ns0:orderProductPrice>{ data($orderProductPrice) }</ns0:orderProductPrice>
                        }
                    </ns0:handsetDetails>
                    <ns0:literatureDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        {
                            for $dispatchMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:dispatchMethod
                            return
                                <ns0:dispatchMethod>{ data($dispatchMethod) }</ns0:dispatchMethod>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $skuId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:skuId
                            return
                                <ns0:skuId>{ data($skuId) }</ns0:skuId>
                        }
                        {
                            for $skuName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:skuName
                            return
                                <ns0:skuName>{ data($skuName) }</ns0:skuName>
                        }
                        <ns0:dispatchStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns2:dispatchStatus) }</ns0:dispatchStatus>
                        <ns0:replacementReturnDetails>
                            <ns0:orderNumberBeingReturned>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                            <ns0:returnSaleableProductLineNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                            <ns0:returnAssignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonOutOfPolicyUserName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName
                                return
                                    <ns0:returnReasonOutOfPolicyUserName>{ data($returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:replacementReturnDetails>
                        <ns0:assignedProdReturnDetails>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            <ns0:returnReasonDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonSubTypeDescription in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription
                                return
                                    <ns0:returnReasonSubTypeDescription>{ data($returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                            }
                            {
                                for $replacementMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod
                                return
                                    <ns0:replacementMethod>{ data($replacementMethod) }</ns0:replacementMethod>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $returnCondition in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition
                                return
                                    <ns0:returnCondition>{ xs:integer( data($returnCondition) ) }</ns0:returnCondition>
                            }
                            {
                                for $returnTimestamp in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp
                                return
                                    <ns0:returnTimestamp>{ data($returnTimestamp) }</ns0:returnTimestamp>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $replacedByOrderNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber
                                return
                                    <ns0:replacedByOrderNumber>{ data($replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                            }
                            {
                                for $replacedByOrderLineNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber
                                return
                                    <ns0:replacedByOrderLineNumber>{ data($replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                            }
                            {
                                for $replacedByOrderAssignProdNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber
                                return
                                    <ns0:replacedByOrderAssignProdNumber>{ data($replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_LIT[1]/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:assignedProdReturnDetails>
                    </ns0:literatureDetails>
                    <ns0:postPaySimDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        {
                            for $dispatchMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:dispatchMethod
                            return
                                <ns0:dispatchMethod>{ data($dispatchMethod) }</ns0:dispatchMethod>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $msisdn in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:msisdn
                            return
                                <ns0:msisdn>{ data($msisdn) }</ns0:msisdn>
                        }
                        <ns0:migratePortInDetails>
                            <ns0:instantMigration>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/instantMigration) }</ns0:instantMigration>
                            <ns0:portIn>
                                <ns0:pac>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/pac) }</ns0:pac>
                                <ns0:newMSISDN>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/newMSISDN) }</ns0:newMSISDN>
                                {
                                    for $pacExpiry in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_migratePortInDetails/ns1:uGODV5_PortIn/pacExpiry
                                    return
                                        <ns0:pacExpiry>{ data($pacExpiry) }</ns0:pacExpiry>
                                }
                            </ns0:portIn>
                        </ns0:migratePortInDetails>
                        {
                            for $skuId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:skuId
                            return
                                <ns0:skuId>{ data($skuId) }</ns0:skuId>
                        }
                        {
                            for $skuName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:skuName
                            return
                                <ns0:skuName>{ data($skuName) }</ns0:skuName>
                        }
                        {
                            for $ssn in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:ssn
                            return
                                <ns0:ssn>{ data($ssn) }</ns0:ssn>
                        }
                        <ns0:dispatchStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:dispatchStatus) }</ns0:dispatchStatus>
                        {
                            for $orderProductPrice in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns2:orderProductPrice
                            return
                                <ns0:orderProductPrice>{ data($orderProductPrice) }</ns0:orderProductPrice>
                        }
                        <ns0:replacementReturnDetails>
                            <ns0:orderNumberBeingReturned>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                            <ns0:returnSaleableProductLineNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                            <ns0:returnAssignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonOutOfPolicyUserName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName
                                return
                                    <ns0:returnReasonOutOfPolicyUserName>{ data($returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:replacementReturnDetails>
                        <ns0:assignedProdReturnDetails>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            <ns0:returnReasonDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonSubTypeDescription in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription
                                return
                                    <ns0:returnReasonSubTypeDescription>{ data($returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                            }
                            {
                                for $replacementMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod
                                return
                                    <ns0:replacementMethod>{ data($replacementMethod) }</ns0:replacementMethod>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $returnCondition in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition
                                return
                                    <ns0:returnCondition>{ xs:integer( data($returnCondition) ) }</ns0:returnCondition>
                            }
                            {
                                for $returnTimestamp in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp
                                return
                                    <ns0:returnTimestamp>{ data($returnTimestamp) }</ns0:returnTimestamp>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $replacedByOrderNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber
                                return
                                    <ns0:replacedByOrderNumber>{ data($replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                            }
                            {
                                for $replacedByOrderLineNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber
                                return
                                    <ns0:replacedByOrderLineNumber>{ data($replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                            }
                            {
                                for $replacedByOrderAssignProdNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber
                                return
                                    <ns0:replacedByOrderAssignProdNumber>{ data($replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:assignedProdReturnDetails>
                    </ns0:postPaySimDetails>
                    <ns0:postPayTariffDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        <ns0:additionalServiceDetails>
                            <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM[1]/ns2:productId) }</ns0:productId>
                            <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM[1]/ns2:productName) }</ns0:productName>
                            <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM[1]/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                            {
                                for $orderProductCharge in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM[1]/ns2:orderProductCharge
                                return
                                    <ns0:orderProductCharge>{ data($orderProductCharge) }</ns0:orderProductCharge>
                            }
                        </ns0:additionalServiceDetails>
                        {
                            for $orderProductCharge in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:orderProductCharge
                            return
                                <ns0:orderProductCharge>{ data($orderProductCharge) }</ns0:orderProductCharge>
                        }
                        {
                            for $contractTerm in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:contractTerm
                            return
                                <ns0:contractTerm>{ xs:integer( data($contractTerm) ) }</ns0:contractTerm>
                        }
                        <ns0:dataServiceGeneration>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:dataServiceGeneration) }</ns0:dataServiceGeneration>
                        <ns0:tariffType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:tariffType) }</ns0:tariffType>
                    </ns0:postPayTariffDetails>
                    <ns0:prePaySimDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        {
                            for $dispatchMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:dispatchMethod
                            return
                                <ns0:dispatchMethod>{ data($dispatchMethod) }</ns0:dispatchMethod>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $msisdn in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:msisdn
                            return
                                <ns0:msisdn>{ data($msisdn) }</ns0:msisdn>
                        }
                        {
                            for $skuId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:skuId
                            return
                                <ns0:skuId>{ data($skuId) }</ns0:skuId>
                        }
                        {
                            for $skuName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:skuName
                            return
                                <ns0:skuName>{ data($skuName) }</ns0:skuName>
                        }
                        {
                            for $ssn in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:ssn
                            return
                                <ns0:ssn>{ data($ssn) }</ns0:ssn>
                        }
                        <ns0:dispatchStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:dispatchStatus) }</ns0:dispatchStatus>
                        {
                            for $orderProductPrice in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns2:orderProductPrice
                            return
                                <ns0:orderProductPrice>{ data($orderProductPrice) }</ns0:orderProductPrice>
                        }
                        <ns0:replacementReturnDetails>
                            <ns0:orderNumberBeingReturned>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:orderNumberBeingReturned) }</ns0:orderNumberBeingReturned>
                            <ns0:returnSaleableProductLineNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnSaleableProductLineNumber) }</ns0:returnSaleableProductLineNumber>
                            <ns0:returnAssignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAssignedProductNumber) }</ns0:returnAssignedProductNumber>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonOutOfPolicyUserName in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnReasonOutOfPolicyUserName
                                return
                                    <ns0:returnReasonOutOfPolicyUserName>{ data($returnReasonOutOfPolicyUserName) }</ns0:returnReasonOutOfPolicyUserName>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_ReplacementReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:replacementReturnDetails>
                        <ns0:assignedProdReturnDetails>
                            <ns0:returnReasonCode>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonCode) }</ns0:returnReasonCode>
                            <ns0:returnReasonDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonDescription) }</ns0:returnReasonDescription>
                            {
                                for $returnReasonSubTypeCode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeCode
                                return
                                    <ns0:returnReasonSubTypeCode>{ data($returnReasonSubTypeCode) }</ns0:returnReasonSubTypeCode>
                            }
                            {
                                for $returnReasonSubTypeDescription in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnReasonSubTypeDescription
                                return
                                    <ns0:returnReasonSubTypeDescription>{ data($returnReasonSubTypeDescription) }</ns0:returnReasonSubTypeDescription>
                            }
                            {
                                for $replacementMethod in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementMethod
                                return
                                    <ns0:replacementMethod>{ data($replacementMethod) }</ns0:replacementMethod>
                            }
                            {
                                for $returnNotes in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnNotes
                                return
                                    <ns0:returnNotes>{ data($returnNotes) }</ns0:returnNotes>
                            }
                            {
                                for $returnCondition in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnCondition
                                return
                                    <ns0:returnCondition>{ xs:integer( data($returnCondition) ) }</ns0:returnCondition>
                            }
                            {
                                for $returnTimestamp in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnTimestamp
                                return
                                    <ns0:returnTimestamp>{ data($returnTimestamp) }</ns0:returnTimestamp>
                            }
                            {
                                for $returnAuthorisationNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:returnAuthorisationNumber
                                return
                                    <ns0:returnAuthorisationNumber>{ data($returnAuthorisationNumber) }</ns0:returnAuthorisationNumber>
                            }
                            {
                                for $replacedByOrderNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderNumber
                                return
                                    <ns0:replacedByOrderNumber>{ data($replacedByOrderNumber) }</ns0:replacedByOrderNumber>
                            }
                            {
                                for $replacedByOrderLineNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderLineNumber
                                return
                                    <ns0:replacedByOrderLineNumber>{ data($replacedByOrderLineNumber) }</ns0:replacedByOrderLineNumber>
                            }
                            {
                                for $replacedByOrderAssignProdNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacedByOrderAssignProdNumber
                                return
                                    <ns0:replacedByOrderAssignProdNumber>{ data($replacedByOrderAssignProdNumber) }</ns0:replacedByOrderAssignProdNumber>
                            }
                            {
                                for $replacementPolicyId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicyId
                                return
                                    <ns0:replacementPolicyId>{ data($replacementPolicyId) }</ns0:replacementPolicyId>
                            }
                            {
                                for $replacementPolicySOACode in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRS/ns1:uGODV5_AssignedProdReturnDetails/ns2:replacementPolicySOACode
                                return
                                    <ns0:replacementPolicySOACode>{ data($replacementPolicySOACode) }</ns0:replacementPolicySOACode>
                            }
                        </ns0:assignedProdReturnDetails>
                    </ns0:prePaySimDetails>
                    <ns0:prePayTariffDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $orderProductPrice in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_PRT/ns2:orderProductPrice
                            return
                                <ns0:orderProductPrice>{ data($orderProductPrice) }</ns0:orderProductPrice>
                        }
                    </ns0:prePayTariffDetails>
                    <ns0:chargeableDeliveryDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $orderProductPrice in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_CDO/ns2:orderProductPrice
                            return
                                <ns0:orderProductPrice>{ data($orderProductPrice) }</ns0:orderProductPrice>
                        }
                    </ns0:chargeableDeliveryDetails>
                    <ns0:postPayInsuranceDetails>
                        <ns0:category>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:category) }</ns0:category>
                        {
                            for $groupId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:groupId
                            return
                                <ns0:groupId>{ data($groupId) }</ns0:groupId>
                        }
                        <ns0:productId>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:productId) }</ns0:productId>
                        <ns0:productName>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:assignedProductNumber) }</ns0:assignedProductNumber>
                        {
                            for $imei in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:imei
                            return
                                <ns0:imei>{ data($imei) }</ns0:imei>
                        }
                        {
                            for $msisdn in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:msisdn
                            return
                                <ns0:msisdn>{ data($msisdn) }</ns0:msisdn>
                        }
                        {
                            for $serialNumber in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns2:serialNumber
                            return
                                <ns0:serialNumber>{ data($serialNumber) }</ns0:serialNumber>
                        }
                        <ns0:cancelExistingInsurance>
                            <ns0:insuranceEndDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns1:uGODV5_CancelExistingInsurance/insuranceEndDate) }</ns0:insuranceEndDate>
                        </ns0:cancelExistingInsurance>
                        <ns0:addNewInsurance>
                            <ns0:assignedProductBillingFreq>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/ns1:uGODV5_AddNewInsurance/assignedProductBillingFreq) }</ns0:assignedProductBillingFreq>
                        </ns0:addNewInsurance>
                        <ns0:orderProductPrice>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/orderProductPrice) }</ns0:orderProductPrice>
                        <ns0:orderProductCharge>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd[1]/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POI/orderProductCharge) }</ns0:orderProductCharge>
                    </ns0:postPayInsuranceDetails>
                </ns0:assignedProduct>
            </ns0:saleableProductDetails>
            {
                for $uGODV5_DeliveryDetails in $utilGetOrderDetailsV5Resp/ns1:uGODV5_DeliveryDetails
                return
                    <ns0:deliveryDetails>
                        <ns0:chargeableDeliveryOption>
                            <ns0:deliveryDate>{ data($uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:deliveryDate) }</ns0:deliveryDate>
                            <ns0:timeslot>{ data($uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:timeslot) }</ns0:timeslot>
                            {
                                for $despatchDate in $uGODV5_DeliveryDetails/ns1:uGODV5_ChargeableDeliveryOption/ns2:despatchDate
                                return
                                    <ns0:despatchDate>{ data($despatchDate) }</ns0:despatchDate>
                            }
                        </ns0:chargeableDeliveryOption>
                        <ns0:isStandardDeliveryOption>{ data($uGODV5_DeliveryDetails/ns2:isStandardDeliveryOption) }</ns0:isStandardDeliveryOption>
                        {
                            for $requestedCarrier in $uGODV5_DeliveryDetails/ns2:requestedCarrier
                            return
                                <ns0:requestedCarrier>{ data($requestedCarrier) }</ns0:requestedCarrier>
                        }
                        <ns0:destinationName>{ data($uGODV5_DeliveryDetails/ns2:destinationName) }</ns0:destinationName>
                        {
                            for $deliveryContactNumber in $uGODV5_DeliveryDetails/ns2:deliveryContactNumber
                            return
                                <ns0:deliveryContactNumber>{ data($deliveryContactNumber) }</ns0:deliveryContactNumber>
                        }
                        <ns0:standardAddress>
                            {
                                for $addressStatus in $uGODV5_DeliveryDetails/ns1:standardAddress/ns2:addressStatus
                                return
                                    <ns0:addressStatus>{ data($addressStatus) }</ns0:addressStatus>
                            }
                            {
                                for $houseNameOrNumber in $uGODV5_DeliveryDetails/ns1:standardAddress/ns2:houseNameOrNumber
                                return
                                    <ns0:houseNameOrNumber>{ data($houseNameOrNumber) }</ns0:houseNameOrNumber>
                            }
                            {
                                for $street in $uGODV5_DeliveryDetails/ns1:standardAddress/ns2:street
                                return
                                    <ns0:street>{ data($street) }</ns0:street>
                            }
                            {
                                for $city in $uGODV5_DeliveryDetails/ns1:standardAddress/ns2:city
                                return
                                    <ns0:city>{ data($city) }</ns0:city>
                            }
                            {
                                for $county in $uGODV5_DeliveryDetails/ns1:standardAddress/ns2:county
                                return
                                    <ns0:county>{ data($county) }</ns0:county>
                            }
                            {
                            if(data($uGODV5_DeliveryDetails/ns1:basic_address/@country)=data($configData/countryNamePolitical))then
                            <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                            else ""
                            }
                            <ns0:postcode>{ data($uGODV5_DeliveryDetails/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                        </ns0:standardAddress>
                        <ns0:deliveryAddressModified>{ data($uGODV5_DeliveryDetails/ns2:deliveryAddressModified) }</ns0:deliveryAddressModified>
                        <ns0:storeDetails>
                            <ns0:storeNumber>{ data($uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails/storeNumber) }</ns0:storeNumber>
                            <ns0:storeName>{ data($uGODV5_DeliveryDetails/ns1:uGODV5_StoreDetails/storeName) }</ns0:storeName>
                        </ns0:storeDetails>
                        <ns0:despatchDetails>
                            {
                                for $parcelNumber in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/parcelNumber
                                return
                                    <ns0:parcelNumber>{ data($parcelNumber) }</ns0:parcelNumber>
                            }
                            {
                                for $actualCarrier in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/actualCarrier
                                return
                                    <ns0:actualCarrier>{ data($actualCarrier) }</ns0:actualCarrier>
                            }
                            {
                                for $actualServiceType in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/actualServiceType
                                return
                                    <ns0:actualServiceType>{ data($actualServiceType) }</ns0:actualServiceType>
                            }
                            {
                                for $despatchDate in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/despatchDate
                                return
                                    <ns0:despatchDate>{ data($despatchDate) }</ns0:despatchDate>
                            }
                            {
                                for $despatchReference in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/despatchReference
                                return
                                    <ns0:despatchReference>{ data($despatchReference) }</ns0:despatchReference>
                            }
                            {
                                for $storeReceivedTimestamp in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/storeReceivedTimestamp
                                return
                                    <ns0:storeReceivedTimestamp>{ data($storeReceivedTimestamp) }</ns0:storeReceivedTimestamp>
                            }
                            {
                                for $customerCollectedTimestamp in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/customerCollectedTimestamp
                                return
                                    <ns0:customerCollectedTimestamp>{ data($customerCollectedTimestamp) }</ns0:customerCollectedTimestamp>
                            }
                            {
                                for $storeReturnedTimestamp in $uGODV5_DeliveryDetails/ns1:uGODV5_DespatchDetails[1]/storeReturnedTimestamp
                                return
                                    <ns0:storeReturnedTimestamp>{ data($storeReturnedTimestamp) }</ns0:storeReturnedTimestamp>
                            }
                        </ns0:despatchDetails>
                    </ns0:deliveryDetails>
            }
            {
                for $uGODV5_CreditCheckDetails in $utilGetOrderDetailsV5Resp/ns1:uGODV5_CreditCheckDetails
                return
                    <ns0:creditCheckDetails>
                        {
                            for $orderCreditCheckStatus in $uGODV5_CreditCheckDetails/ns2:orderCreditCheckStatus
                            return
                                <ns0:orderCreditCheckStatus>{ data($orderCreditCheckStatus) }</ns0:orderCreditCheckStatus>
                        }
                        {
                            for $creditVetNumber in $uGODV5_CreditCheckDetails/ns2:creditVetNumber
                            return
                                <ns0:creditVetNumber>{ data($creditVetNumber) }</ns0:creditVetNumber>
                        }
                        {
                            for $creditScore in $uGODV5_CreditCheckDetails/ns2:creditScore
                            return
                                <ns0:creditScore>{ data($creditScore) }</ns0:creditScore>
                        }
                        {
                            for $lastCreditCheckDate in $uGODV5_CreditCheckDetails/ns2:lastCreditCheckDate
                            return
                                <ns0:lastCreditCheckDate>{ data($lastCreditCheckDate) }</ns0:lastCreditCheckDate>
                        }
                        {
                            for $creditClassId in $uGODV5_CreditCheckDetails/ns2:creditClassId
                            return
                                <ns0:creditClassId>{ xs:integer( data($creditClassId) ) }</ns0:creditClassId>
                        }
                        <ns0:depositDetails>
                            <ns0:depositType>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositType) }</ns0:depositType>
                            <ns0:depositAmount>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositAmount) }</ns0:depositAmount>
                            {
                                for $depositDuration in $uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositDuration
                                return
                                    <ns0:depositDuration>{ data($depositDuration) }</ns0:depositDuration>
                            }
                            {
                                for $depositReference in $uGODV5_CreditCheckDetails/ns1:uGODV5_DepositDetails/ns2:depositReference
                                return
                                    <ns0:depositReference>{ data($depositReference) }</ns0:depositReference>
                            }
                        </ns0:depositDetails>
                        <ns0:transactCreditCheckDetails>
                            <ns0:creditCheckResultCode>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:creditCheckResultCode) }</ns0:creditCheckResultCode>
                            <ns0:totalMonthlyCharge>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:totalMonthlyCharge) }</ns0:totalMonthlyCharge>
                            {
                                for $creditLimit in $uGODV5_CreditCheckDetails/ns1:uGODV5_TransactCreditCheckDetails/ns2:creditLimit
                                return
                                    <ns0:creditLimit>{ data($creditLimit) }</ns0:creditLimit>
                            }
                        </ns0:transactCreditCheckDetails>
                        <ns0:legalEntityAddress>
                            <ns0:legalEntityCustomerName>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns2:legalEntityCustomerName) }</ns0:legalEntityCustomerName>
                            <ns0:standardAddress>
                                {
                                    for $addressStatus in $uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:addressStatus
                                    return
                                        <ns0:addressStatus>{ data($addressStatus) }</ns0:addressStatus>
                                }
                                {
                                    for $houseNameOrNumber in $uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:houseNameOrNumber
                                    return
                                        <ns0:houseNameOrNumber>{ data($houseNameOrNumber) }</ns0:houseNameOrNumber>
                                }
                                {
                                    for $street in $uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:street
                                    return
                                        <ns0:street>{ data($street) }</ns0:street>
                                }
                                {
                                    for $city in $uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:city
                                    return
                                        <ns0:city>{ data($city) }</ns0:city>
                                }
                                {
                                    for $county in $uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:county
                                    return
                                        <ns0:county>{ data($county) }</ns0:county>
                                }
                                {
                                if(data($uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:country)=data($configData/countryNamePolitical))then
                                <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                                else ""
                                }
                                <ns0:postcode>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_legal_entity_address/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                            </ns0:standardAddress>
                        </ns0:legalEntityAddress>
                        <ns0:previousAddress>
                            <ns0:standardAddress>
                                {
                                    for $addressStatus in $uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:addressStatus
                                    return
                                        <ns0:addressStatus>{ data($addressStatus) }</ns0:addressStatus>
                                }
                                {
                                    for $houseNameOrNumber in $uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:houseNameOrNumber
                                    return
                                        <ns0:houseNameOrNumber>{ data($houseNameOrNumber) }</ns0:houseNameOrNumber>
                                }
                                {
                                    for $street in $uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:street
                                    return
                                        <ns0:street>{ data($street) }</ns0:street>
                                }
                                {
                                    for $city in $uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:city
                                    return
                                        <ns0:city>{ data($city) }</ns0:city>
                                }
                                {
                                    for $county in $uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:county
                                    return
                                        <ns0:county>{ data($county) }</ns0:county>
                                }
                                if()then
                                <ns0:country>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:country) }</ns0:country>
                                <ns0:postcode>{ data($uGODV5_CreditCheckDetails/ns1:uGODV5_previous_address/ns1:standardAddress/ns2:postcode) }</ns0:postcode>
                            </ns0:standardAddress>
                        </ns0:previousAddress>
                        {
                            for $referralReason in $uGODV5_CreditCheckDetails/ns2:referralReason
                            return
                                <ns0:referralReason>{ data($referralReason) }</ns0:referralReason>
                        }
                    </ns0:creditCheckDetails>
            }
            <ns0:upgradeDetails>
                <ns0:msisdnDetails>
                    <ns0:upgradeMSISDN>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_MsisdnDetails/ns2:upgradeMSISDN) }</ns0:upgradeMSISDN>
                    {
                        for $msisdn in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_MsisdnDetails/ns2:msisdn
                        return
                            <ns0:msisdn>{ data($msisdn) }</ns0:msisdn>
                    }
                </ns0:msisdnDetails>
                <ns0:upgradeDiscounts>
                    <ns0:upgradeDiscountApplicable>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeDiscounts/ns2:upgradeDiscountApplicable) }</ns0:upgradeDiscountApplicable>
                    <ns0:upgradeDiscountActual>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeDiscounts/ns2:upgradeDiscountActual) }</ns0:upgradeDiscountActual>
                </ns0:upgradeDiscounts>
                <ns0:upgradeEntitlementDetails>
                    <ns0:advancedEntitlement>
                        <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                        <ns0:isPaymentTaken>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:upgradePaymentStatus) }</ns0:isPaymentTaken>
                        <ns0:CCASettlementAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:CCASettlementAmount) }</ns0:CCASettlementAmount>
                        <ns0:earlyUpgradeOffered>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                        <ns0:earlyUpgradeTaken>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                        <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns1:uGODV5_AdvancedEntitlement/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                    </ns0:advancedEntitlement>
                    <ns0:upgradeEntitlementOverrideApplied>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:upgradeEntitlementOverrideApplied) }</ns0:upgradeEntitlementOverrideApplied>
                    <ns0:earlyUpgradeOffered>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeOffered) }</ns0:earlyUpgradeOffered>
                    <ns0:earlyUpgradeTaken>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeTaken) }</ns0:earlyUpgradeTaken>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                    <ns0:earlyUpgradeReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeDetails/ns1:uGODV5_UpgradeEntitlementDetails/ns2:earlyUpgradeReference) }</ns0:earlyUpgradeReference>
                </ns0:upgradeEntitlementDetails>
            </ns0:upgradeDetails>
            <ns0:returnedLeasedDevice>
                <ns0:handsetMake>{ data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice/ns2:handsetMake) }</ns0:handsetMake>
                <ns0:handsetModel>{ data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice/ns2:handsetModel) }</ns0:handsetModel>
                <ns0:imei>{ data($utilGetOrderDetailsV5Resp/ns1:returnedLeasedDevice/ns2:imei) }</ns0:imei>
            </ns0:returnedLeasedDevice>
            <ns0:upgradeOfferDetails>
                <ns0:msisdn>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:msisdn) }</ns0:msisdn>
                <ns0:channel>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:channel) }</ns0:channel>
                {
                    for $storeType in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:storeType
                    return
                        <ns0:storeType>{ data($storeType) }</ns0:storeType>
                }
                {
                    for $retailerId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:retailerId
                    return
                        <ns0:retailerId>{ data($retailerId) }</ns0:retailerId>
                }
                {
                    for $userId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:userId
                    return
                        <ns0:userId>{ data($userId) }</ns0:userId>
                }
                <ns0:upgradeEntitlementReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:upgradeEntitlementReference) }</ns0:upgradeEntitlementReference>
                {
                    for $tariffProductId in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:tariffProductId
                    return
                        <ns0:tariffProductId>{ data($tariffProductId) }</ns0:tariffProductId>
                }
                {
                    for $tenure in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:tenure
                    return
                        <ns0:tenure>{ data($tenure) }</ns0:tenure>
                }
                {
                    for $contractStartDate in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:contractStartDate
                    return
                        <ns0:contractStartDate>{ data($contractStartDate) }</ns0:contractStartDate>
                }
                {
                    for $contractEndDate in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:contractEndDate
                    return
                        <ns0:contractEndDate>{ data($contractEndDate) }</ns0:contractEndDate>
                }
                {
                    for $serviceTenure in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:serviceTenure
                    return
                        <ns0:serviceTenure>{ data($serviceTenure) }</ns0:serviceTenure>
                }
                {
                    for $lastUpgradeDate in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:lastUpgradeDate
                    return
                        <ns0:lastUpgradeDate>{ data($lastUpgradeDate) }</ns0:lastUpgradeDate>
                }
                {
                    for $currentMonthlySpend in $utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:currentMonthlySpend
                    return
                        <ns0:currentMonthlySpend>{ data($currentMonthlySpend) }</ns0:currentMonthlySpend>
                }
                <ns0:eligibleForUpgrade>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:eligibleForUpgrade) }</ns0:eligibleForUpgrade>
                <ns0:upgradeAvailable>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:upgradeAvailable) }</ns0:upgradeAvailable>
                <ns0:overrideAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:overrideAllowed) }</ns0:overrideAllowed>
                <ns0:upgradeOfferExpiry>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns2:upgradeOfferExpiry) }</ns0:upgradeOfferExpiry>
                <ns0:upgradeOptions>
                    <ns0:upgradeType>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradeOptions[1]/ns2:upgradeType) }</ns0:upgradeType>
                    <ns0:isUpgradeAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradeOptions[1]/ns2:isUpgradeAllowed) }</ns0:isUpgradeAllowed>
                    <ns0:onAccountPaymentAccepted>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradeOptions[1]/ns2:onAccountPaymentAccepted) }</ns0:onAccountPaymentAccepted>
                    <ns0:standardUpgradeDetails>
                        <ns0:upgradeEligibilityDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradeOptions[1]/ns1:uGODV5_StandardUpgradeDetails/ns2:upgradeEligibilityDate) }</ns0:upgradeEligibilityDate>
                    </ns0:standardUpgradeDetails>
                    <ns0:paidUpgradeDetails>
                        <ns0:upgradeEligibilityDate>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradeOptions[1]/ns1:uGODV5_PaidUpgradeDetails/ns2:upgradeEligibilityDate) }</ns0:upgradeEligibilityDate>
                    </ns0:paidUpgradeDetails>
                </ns0:upgradeOptions>
                <ns0:upgradePayment>
                    <ns0:CCANumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/CCANumber) }</ns0:CCANumber>
                    <ns0:CCASettlementAmount>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/CCASettlementAmount) }</ns0:CCASettlementAmount>
                    <ns0:isCCAPaymentAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/isCCAPaymentAllowed) }</ns0:isCCAPaymentAllowed>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                    <ns0:isFTUPaymentAllowed>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_UpgradeOfferDetails/ns1:uGODV5_UpgradePayment/isFTUPaymentAllowed) }</ns0:isFTUPaymentAllowed>
                </ns0:upgradePayment>
            </ns0:upgradeOfferDetails>
            <ns0:orderHistory>
                <ns0:createdTimestamp>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:createdTimestamp) }</ns0:createdTimestamp>
                <ns0:createdBy>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:createdBy) }</ns0:createdBy>
                <ns0:orderEvent>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:orderEvent) }</ns0:orderEvent>
                <ns0:orderEventDescription>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:orderEventDescription) }</ns0:orderEventDescription>
                <ns0:deleted>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:deleted) }</ns0:deleted>
                {
                    for $lastUpdated in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:lastUpdated
                    return
                        <ns0:lastUpdated>{ data($lastUpdated) }</ns0:lastUpdated>
                }
                {
                    for $lastUpdatedBy in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:lastUpdatedBy
                    return
                        <ns0:lastUpdatedBy>{ data($lastUpdatedBy) }</ns0:lastUpdatedBy>
                }
                {
                    for $freeFormText in $utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHistory[1]/ns2:freeFormText
                    return
                        <ns0:freeFormText>{ data($freeFormText) }</ns0:freeFormText>
                }
            </ns0:orderHistory>
            <ns0:collectionStatus>
                <ns0:orderCollectionVerificationLevel>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:orderCollectionVerificationLevel) }</ns0:orderCollectionVerificationLevel>
                <ns0:storeNumber>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:storeNumber) }</ns0:storeNumber>
                <ns0:collectionReference>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:collectionReference) }</ns0:collectionReference>
                <ns0:collectionStatus>{ data($utilGetOrderDetailsV5Resp/ns1:uGODV5_CollectionStatus/ns2:collectionStatus) }</ns0:collectionStatus>
            </ns0:collectionStatus>
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
                          <ns0:country>{data($utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderPartyAddress/ns2:country)}</ns0:country>
                          
                 </ns0:orderPartyAddress>
                else "" 
              }
             
            
             </ns0:getOrderDetails_3Response>
};

declare variable $utilGetOrderDetailsV5Resp as element() external;
declare variable $configData as element(*) external;

xf:utilGetOrderDetailsV5RespToGetOrderDetails_3Response($utilGetOrderDetailsV5Resp,$configData)