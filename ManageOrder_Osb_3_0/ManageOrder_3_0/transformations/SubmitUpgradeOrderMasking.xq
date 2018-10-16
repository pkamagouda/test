xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://soa.o2.co.uk/CommonResources/transformations/Masking/";

declare function xf:maskAttributes($maskCardNumber as element(*))
	as element(*) {
	
		element {node-name($maskCardNumber)}
		{
		if($maskCardNumber[@cardNumber])then
			attribute cardNumber { 
			let $length :=fn:string-length(data($maskCardNumber/@cardNumber))
			let $maskValue := fn:substring(xs:string(data($maskCardNumber/@cardNumber)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'\d','*'),fn:substring(xs:string(data($maskCardNumber/@cardNumber)),data($length)-3,4))}
		else (),
		if($maskCardNumber[@card_number])then
			attribute card_number { 
			let $length :=fn:string-length(data($maskCardNumber/@card_number))
			let $maskValue := fn:substring(xs:string(data($maskCardNumber/@card_number)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'\d','*'),fn:substring(xs:string(data($maskCardNumber/@card_number)),data($length)-3,4))}
		else (),
		if($maskCardNumber[@bankAccountNumber])then
			attribute bankAccountNumber { 
			let $length :=fn:string-length(data($maskCardNumber/@bankAccountNumber))
			let $maskValue := fn:substring(xs:string(data($maskCardNumber/@bankAccountNumber)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'\d','*'),fn:substring(xs:string(data($maskCardNumber/@bankAccountNumber)),data($length)-3,4))}
		else (),
		if($maskCardNumber[@cardCV2])then
			attribute cardCV2 {fn:replace(data($maskCardNumber/@cardCV2),'.','*')}
		else (),
		if($maskCardNumber[@userAccountNumber])then
			attribute userAccountNumber { 
			let $length :=fn:string-length(data($maskCardNumber/@userAccountNumber))
			let $maskValue := fn:substring(xs:string(data($maskCardNumber/@userAccountNumber)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'\d','*'),fn:substring(xs:string(data($maskCardNumber/@userAccountNumber)),data($length)-3,4))}
		else (),
		if($maskCardNumber[@cv2])then
			attribute cv2{fn:replace(data($maskCardNumber/@cv2),'.','*')}
		else (),
		if($maskCardNumber[@cardExpiryDate])then
			attribute cardExpiryDate{fn:replace(data($maskCardNumber/@cardExpiryDate),'.','*')}
		else (),
		if($maskCardNumber[@cardType])then
			attribute cardType{fn:replace(data($maskCardNumber/@cardType),'.','*')}	
		else (),
		if($maskCardNumber[@cardHolderName])then
			attribute cardHolderName{fn:replace(data($maskCardNumber/@cardHolderName),'.','*')}	
		else (),
		if($maskCardNumber[@houseNameOrNumber])then
			attribute houseNameOrNumber{fn:replace(data($maskCardNumber/@houseNameOrNumber),'.','*')}	
		else (),
		if($maskCardNumber[@paymentAuthStatus])then
			attribute paymentAuthStatus{fn:replace(data($maskCardNumber/@paymentAuthStatus),'.','*')}		
		else (),
		if($maskCardNumber[@authorisationRespCode])then
			attribute authorisationRespCode{fn:replace(data($maskCardNumber/@authorisationRespCode),'.','*')}
		else (),
		if($maskCardNumber[@settlementRespCode])then
			attribute settlementRespCode{fn:replace(data($maskCardNumber/@settlementRespCode),'.','*')}
		else (),
		if($maskCardNumber[@cv2AvsAction])then
			attribute cv2AvsAction{fn:replace(data($maskCardNumber/@cv2AvsAction),'.','*')}
		else (),
		if($maskCardNumber[@cardIssuer])then
			attribute cardIssuer{fn:replace(data($maskCardNumber/@cardIssuer),'.','*')}
			
		else (),
		for $attr in $maskCardNumber/@*
		let $attrName := name($attr)  
			where $attrName != 'cardNumber' and $attrName !='bankAccountNumber' and $attrName !='cardCV2' and $attrName !='userAccountNumber' and $attrName !='cv2' and $attrName !='cardExpiryDate' and $attrName !='cardType' and $attrName !='cardHolderName' and $attrName !='houseNameOrNumber' and $attrName !='paymentAuthStatus' and $attrName !='authorisationRespCode' and $attrName !='settlementRespCode' and $attrName !='cv2AvsAction' and $attrName !='cardIssuer'
		return $attr
       }
};

declare function xf:maskCardNumber($maskCardNumber as element(*))
	as element(*) {
		let $length :=fn:string-length(data($maskCardNumber))
		let $maskValue := fn:substring(xs:string($maskCardNumber),1,data($length)-4)
		return 
		element{node-name($maskCardNumber)}
		{
			fn:concat(fn:replace($maskValue,'.','*'),fn:substring(xs:string($maskCardNumber),data($length)-3,4))
		}
		
};

declare function xf:maskAll($maskAllValue as element(*)) as element(*){
element{node-name($maskAllValue)}
	{
		fn:replace(data($maskAllValue),'.','*')
	}
};



declare function xf:GenericMasking($request as element(*))
    as element(*) {
    element {node-name(($request)) }
    {
       	for $child in $request/(@*,node())
		where $child instance of element()
        return
       		if(local-name($child)="cardNumber")then
		        xf:maskCardNumber($child)
		    else if(local-name($child)="card_number")then
		        xf:maskCardNumber($child)
			else if(local-name($child)="cardCV2")then
        		xf:maskAll($child)
		    else if(local-name($child)="cv2")then
        		xf:maskAll($child)
			else if(local-name($child)="cardExpiryDate")then
        		xf:maskAll($child)
			else if(local-name($child)="cardType")then
        		xf:maskAll($child)
			else if(local-name($child)="cardHolderName")then
        		xf:maskAll($child)
			else if(local-name($child)="houseNameOrNumber")then
        		xf:maskAll($child)
			else if(local-name($child)="paymentAuthStatus")then
        		xf:maskAll($child)
			else if(local-name($child)="authorisationRespCode")then
        		xf:maskAll($child)
			else if(local-name($child)="settlementRespCode")then
        		xf:maskAll($child)
			else if(local-name($child)="cv2AvsAction")then
        		xf:maskAll($child)
        	else if(local-name($child)="cardIssuer")then
        		xf:maskAll($child)	
	        else if(local-name($child)="bankAccountNumber")then
        		xf:maskCardNumber($child)
        	else if(local-name($child)="userAccountNumber")then
        		xf:maskCardNumber($child)
			else if($child[@cardNumber | card_number | @bankAccountNumber | @cardCV2 | @cv2| @userAccountNumber| @cardExpiryDate| @cardType| @cardHolderName| @houseNameOrNumber| @paymentAuthStatus| @authorisationRespCode| @settlementRespCode| @cv2AvsAction| @cardIssuer])then
        		xf:maskAttributes($child)
		    else if(count($child/*)>0)then
        		xf:GenericMasking($child)
		    else
        $child
   	}
};

declare variable $request as element(*) external;

xf:GenericMasking($request)