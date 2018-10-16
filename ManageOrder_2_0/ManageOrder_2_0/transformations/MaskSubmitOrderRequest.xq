(:: pragma bea:global-element-parameter parameter="$submitOrder" element="ns0:submitOrder" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:submitOrder" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 09/06/2010 		2.0.0 		Sadiq 			Initial version :)
(: 10/06/2010 		2.0.0 		Amit Kumar		Added the UserAccount Element for masking :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/MaskSubmitOrderRequest/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";

declare function xf:maskDigitsAndDate($maskDataValue as element(*))
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

declare function xf:MaskSubmitOrderRequest($submitOrder as element(ns0:submitOrder))
    as element(ns0:submitOrder) {
        
                let $from  := (if($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardNumber)then
                    fn-bea:serialize($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardNumber)
                    else '',
                    if($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardCV2)then
                    fn-bea:serialize($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardCV2)
                    else '',
                    for $cardNumber in $submitOrder/ns0:accountSet/ns0:newAccount/ns0:accountRecurringPaymentDetails/ns0:creditCardDetails/ns0:cardNumber
                    return
                    fn-bea:serialize($cardNumber)
                    ,
                    for $userAccountNumber in $submitOrder/ns0:accountSet/ns0:newAccount/ns0:accountRecurringPaymentDetails/ns0:directDebitDetails/ns0:userAccountNumber
                    return
                    fn-bea:serialize($userAccountNumber)
                    ,
                    for $bankAccountNumber in $submitOrder/ns0:accountSet/ns0:newAccount/ns0:accountRecurringPaymentDetails/ns0:directDebitDetails/ns0:bankAccountNumber
                    return
                    fn-bea:serialize($bankAccountNumber))  
                let $to  := (if($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardNumber)then
                    fn-bea:serialize(<ns0:cardNumber>{xf:maskCardNumber($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardNumber)}</ns0:cardNumber>)
                    else '',
                    if($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardCV2)then
                    fn-bea:serialize(<ns0:cardCV2>{xf:maskDigitsAndDate($submitOrder/ns0:initialPaymentDetails/ns0:paymentByCard/ns0:cardDetails/ns0:cardCV2)}</ns0:cardCV2>)
                    else '',
                    for $cardNumber in $submitOrder/ns0:accountSet/ns0:newAccount/ns0:accountRecurringPaymentDetails/ns0:creditCardDetails/ns0:cardNumber
                    return
                    fn-bea:serialize(<ns0:cardNumber>{xf:maskCardNumber($cardNumber)}</ns0:cardNumber>)
                    ,
                    for $userAccountNumber in $submitOrder/ns0:accountSet/ns0:newAccount/ns0:accountRecurringPaymentDetails/ns0:directDebitDetails/ns0:userAccountNumber
                    return
                    fn-bea:serialize(<ns0:userAccountNumber>{xf:maskCardNumber($userAccountNumber)}</ns0:userAccountNumber>)
                    ,
                    for $bankAccountNumber in $submitOrder/ns0:accountSet/ns0:newAccount/ns0:accountRecurringPaymentDetails/ns0:directDebitDetails/ns0:bankAccountNumber
                    return
                    fn-bea:serialize(<ns0:bankAccountNumber>{xf:maskCardNumber($bankAccountNumber)}</ns0:bankAccountNumber>)) 
                	return
                    (fn-bea:inlinedXML(xf:replaceMultipleData(fn-bea:serialize($submitOrder),$from,$to)))
           
};

declare variable $submitOrder as element(ns0:submitOrder) external;

xf:MaskSubmitOrderRequest($submitOrder)