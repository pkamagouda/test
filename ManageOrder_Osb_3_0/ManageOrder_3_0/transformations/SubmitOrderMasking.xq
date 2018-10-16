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
		if($maskCardNumber[@cardCV2])then
			attribute cardCV2 {fn:replace(data($maskCardNumber/@cardCV2),'.','*')}
		
		else (),
		for $attr in $maskCardNumber/@*
		let $attrName := name($attr)  
			where $attrName != 'cardNumber' and  $attrName !='cardCV2' 
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
		    else if($child[@cardNumber | card_number | @cardCV2])then
        		xf:maskAttributes($child)
		    else if(count($child/*)>0)then
        		xf:GenericMasking($child)
		    else
        $child
   	}
};

declare variable $request as element(*) external;

xf:GenericMasking($request)