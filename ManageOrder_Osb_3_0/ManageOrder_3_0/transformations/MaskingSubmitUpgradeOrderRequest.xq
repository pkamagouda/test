(:: pragma bea:global-element-parameter parameter="$submitUpgradeOrder_1" element="ns0:submitUpgradeOrder_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:submitUpgradeOrder_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 20/09/2011 		2.0.0 		Namratha 			Initial version :)
(: 25/04/2011 		2.0.1 		Deepthi Narayan 	Removed the postcode element as the logic override the other element too. The same is implemented in log-config.xml.
(:                                                    This change is done as part A&R PL Project:)
(: 26/09/2016 		2.0.2 		Meghana P K 	   Masked userAccountNumber and bankAccountNumber within upgradeRecycleDetails element as a part of Enhanced Recycle Project:)

declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/MaskingSubmitUpgradeOrderRequest/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/coredata_1";

declare function xf:maskDigitsAndDate($maskDataValue as element(*))
			as xs:string {	
				fn:replace(data($maskDataValue),'.','*')
		};
		
		declare function xf:mask($maskDataValue as xs:string)
			as xs:string {	
				fn:replace(data($maskDataValue),'.','*')
		};
declare function xf:maskCardNumber($maskCardNumber as element(*))
			as xs:string {
				let $length :=fn:string-length(data($maskCardNumber))
				let $maskValue := fn:substring(xs:string(data($maskCardNumber)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'.','*'),fn:substring(xs:string(data($maskCardNumber)),data($length)-3,4))
		};
declare function xf:maskCardNumber1($maskCardNumber as xs:string)
		as xs:string{
		let $length :=fn:string-length($maskCardNumber)
				let $maskValue := fn:substring(xs:string($maskCardNumber),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'.','*'),fn:substring($maskCardNumber,data($length)-3,4))
		};
declare function xf:replaceMultipleData
		  ( $arg as xs:string? ,
		    $changeFrom as xs:string* ,
		    $changeTo as xs:string* )  as xs:string? {
		       
		   if (count($changeFrom) > 0)
		   then xf:replaceMultipleData(
		          replace($arg,$changeFrom[1],$changeTo[1]),
		          $changeFrom[position() > 1],
		          $changeTo[position() > 1])
		   else $arg
		 };

declare function xf:MaskingSubmitUpgradeOrderRequest($submitUpgradeOrder_1 as element(ns0:submitUpgradeOrder_1))
    as element(ns0:submitUpgradeOrder_1) {
    
    let $paymentThroughCard := $submitUpgradeOrder_1/ns0:initialPaymentDetails/ns0:paymentThroughCard
    let $cardDetails:= $paymentThroughCard/ns0:cardDetails
    let $updateAccountRecurringPaymentDetails:= $submitUpgradeOrder_1/ns0:updateAccountRecurringPaymentDetails
    
        let $from  := (if($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:id)then
                    fn-bea:serialize($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:id)
                    else '',
                    if($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:idValue)then
                    fn-bea:serialize($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:idValue)
                    else '',
                    if($paymentThroughCard/ns0:cardToken)then
                    fn-bea:serialize($paymentThroughCard/ns0:cardToken)
                    else '',
                    if($paymentThroughCard/ns0:paymentReference)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentReference)
                    else '',
                    if($cardDetails/ns0:cardNumber)then
                    fn-bea:serialize($cardDetails/ns0:cardNumber)
                    else '',
                    if($cardDetails/ns0:cardCV2)then
                    fn-bea:serialize($cardDetails/ns0:cardCV2)
                    else '',
                    if($cardDetails/ns0:cardExpiryDate)then
                    fn-bea:serialize($cardDetails/ns0:cardExpiryDate)
                    else '',
                    if($cardDetails/ns0:cardType)then
                    fn-bea:serialize($cardDetails/ns0:cardType)
                    else '',
                    if($cardDetails/ns0:cardHolderName)then
                    fn-bea:serialize($cardDetails/ns0:cardHolderName)
                    else '',
                    if($cardDetails/ns0:cardIssueDate)then
                    fn-bea:serialize($cardDetails/ns0:cardIssueDate)
                    else '',
                    if($cardDetails/ns0:cardIssueNumber)then
                    fn-bea:serialize($cardDetails/ns0:cardIssueNumber)
                    else '',
                    if($cardDetails/ns0:houseNameOrNumber)then
                    fn-bea:serialize($cardDetails/ns0:houseNameOrNumber)
                    else '',
                    if($cardDetails/ns0:cardIssuer)then
                    fn-bea:serialize($cardDetails/ns0:cardIssuer)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:paymentAuthStatus)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:paymentAuthStatus)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespCode)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespCode)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespMessage)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespMessage)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authorisationCode)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:authorisationCode)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authMessage)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:authMessage)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:buynetId)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:buynetId)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:settlementRespCode)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:settlementRespCode)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsCode)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsCode)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsAction)then
                    fn-bea:serialize($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsAction)
                    else '',
                    if($updateAccountRecurringPaymentDetails)then
                    fn-bea:serialize($updateAccountRecurringPaymentDetails/ns0:userAccountNumber)
                    else '',
                    if($updateAccountRecurringPaymentDetails/ns0:bankAccountNumber)then
                    fn-bea:serialize($updateAccountRecurringPaymentDetails/ns0:bankAccountNumber)
                    else '',
                    for $userAccountNumber in $submitUpgradeOrder_1/ns0:upgradeRecycleDetails/ns0:recyclePaymentDetails/ns0:recycleBACSDetails/ns0:userAccountNumber
                    return
                    ($userAccountNumber)
                    ,
                    for $bankAccountNumber in $submitUpgradeOrder_1/ns0:upgradeRecycleDetails/ns0:recyclePaymentDetails/ns0:recycleBACSDetails/ns0:bankAccountNumber
                    return
                    ($bankAccountNumber)
                    )
               let $to  := (if($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:id)then
                    fn-bea:serialize( <ns0:id>{xf:mask($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:id)}</ns0:id>)
                    else '',
                    if($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:idValue)then
                    fn-bea:serialize( <ns0:idValue>{xf:mask($submitUpgradeOrder_1/ns0:sourceDetails/ns0:upgradeProof/ns0:idValue)}</ns0:idValue>)
                    else '',
                    if($paymentThroughCard/ns0:cardToken)then
                    fn-bea:serialize( <ns0:cardToken>{xf:mask($paymentThroughCard/ns0:cardToken)}</ns0:cardToken>)
                    else '',
                    if($paymentThroughCard/ns0:paymentReference)then
                    fn-bea:serialize( <ns0:paymentReference>{xf:mask($paymentThroughCard/ns0:paymentReference)}</ns0:paymentReference>)
                    else '',
                    if($cardDetails/ns0:cardNumber)then
                    fn-bea:serialize( <ns0:cardNumber>{xf:maskCardNumber1($cardDetails/ns0:cardNumber)}</ns0:cardNumber>)
                    else '',
                    if($cardDetails/ns0:cardCV2)then
                    fn-bea:serialize( <ns0:cardCV2>{xf:mask($cardDetails/ns0:cardCV2)}</ns0:cardCV2>)
                    else '',
                    if($cardDetails/ns0:cardExpiryDate)then
                    fn-bea:serialize( <ns0:cardExpiryDate>{xf:maskDigitsAndDate($cardDetails/ns0:cardExpiryDate)}</ns0:cardExpiryDate>)
                    else '',
                    if($cardDetails/ns0:cardType)then
                    fn-bea:serialize( <ns0:cardType>{xf:mask($cardDetails/ns0:cardType)}</ns0:cardType>)
                    else '',
                    if($cardDetails/ns0:cardHolderName)then
                    fn-bea:serialize( <ns0:cardHolderName>{xf:mask($cardDetails/ns0:cardHolderName)}</ns0:cardHolderName>)
                    else '',
                    if($cardDetails/ns0:cardIssueDate)then
                    fn-bea:serialize( <ns0:cardIssueDate>{xf:mask($cardDetails/ns0:cardIssueDate)}</ns0:cardIssueDate>)
                    else '',
                    if($cardDetails/ns0:cardIssueNumber)then
                    fn-bea:serialize( <ns0:cardIssueNumber>{xf:mask($cardDetails/ns0:cardIssueNumber)}</ns0:cardIssueNumber>)
                    else '',
                    if($cardDetails/ns0:houseNameOrNumber)then
                    fn-bea:serialize( <ns0:houseNameOrNumber>{xf:mask($cardDetails/ns0:houseNameOrNumber)}</ns0:houseNameOrNumber>)
                    else '',
                    if($cardDetails/ns0:cardIssuer)then
                    fn-bea:serialize( <ns0:cardIssuer>{xf:mask($cardDetails/ns0:cardIssuer)}</ns0:cardIssuer>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:paymentAuthStatus)then
                    fn-bea:serialize( <ns0:paymentAuthStatus>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:paymentAuthStatus)}</ns0:paymentAuthStatus>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespCode)then
                    fn-bea:serialize( <ns0:authorisationRespCode>{xf:maskDigitsAndDate($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespCode)}</ns0:authorisationRespCode>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespMessage)then
                    fn-bea:serialize( <ns0:authorisationRespMessage>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:authorisationRespMessage)}</ns0:authorisationRespMessage>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authorisationCode)then
                    fn-bea:serialize( <ns0:authorisationCode>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:authorisationCode)}</ns0:authorisationCode>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:authMessage)then
                    fn-bea:serialize( <ns0:authMessage>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:authMessage)}</ns0:authMessage>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:buynetId)then
                    fn-bea:serialize( <ns0:buynetId>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:buynetId)}</ns0:buynetId>)
                    else '',
                    if($paymentThroughCard/ns0:paymentDetails/ns0:settlementRespCode)then
                    fn-bea:serialize( <ns0:settlementRespCode>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:settlementRespCode)}</ns0:settlementRespCode>)
                    else '',
                     if($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsCode)then
                    fn-bea:serialize( <ns0:cv2AvsCode>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsCode)}</ns0:cv2AvsCode>)
                    else '',
                     if($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsAction)then
                    fn-bea:serialize( <ns0:cv2AvsAction>{xf:mask($paymentThroughCard/ns0:paymentDetails/ns0:cv2AvsAction)}</ns0:cv2AvsAction>)
                    else '',
                    if($updateAccountRecurringPaymentDetails)then
                    fn-bea:serialize(<ns0:userAccountNumber>{xf:maskCardNumber1($updateAccountRecurringPaymentDetails/ns0:userAccountNumber)}</ns0:userAccountNumber>)
                    else '',
                    if($updateAccountRecurringPaymentDetails/ns0:bankAccountNumber)then
                    fn-bea:serialize(<ns0:bankAccountNumber>{xf:maskCardNumber1($updateAccountRecurringPaymentDetails/ns0:bankAccountNumber)}</ns0:bankAccountNumber>)
                    else '',
                     for $userAccountNumber in $submitUpgradeOrder_1/ns0:upgradeRecycleDetails/ns0:recyclePaymentDetails/ns0:recycleBACSDetails/ns0:userAccountNumber
                    return
                    <ns0:userAccountNumber>{xf:maskCardNumber($userAccountNumber)}</ns0:userAccountNumber>
                    ,
                    for $bankAccountNumber in $submitUpgradeOrder_1/ns0:upgradeRecycleDetails/ns0:recyclePaymentDetails/ns0:recycleBACSDetails/ns0:bankAccountNumber
                    return
                    <ns0:bankAccountNumber>{xf:maskCardNumber($bankAccountNumber)}</ns0:bankAccountNumber>
                    )
                 return
                    (fn-bea:inlinedXML(xf:replaceMultipleData(fn-bea:serialize($submitUpgradeOrder_1),$from,$to)))
           
          
};

declare variable $submitUpgradeOrder_1 as element(ns0:submitUpgradeOrder_1) external;

xf:MaskingSubmitUpgradeOrderRequest($submitUpgradeOrder_1)