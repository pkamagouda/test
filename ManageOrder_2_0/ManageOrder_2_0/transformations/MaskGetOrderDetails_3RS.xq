xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$companionMessage" element="ns1:companionMessage" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:companionMessage" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)


(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 29/11/2014 		2.0.0 		Vanishree 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/MaskGetOrderDetails_3RS/";
declare namespace ns4 = "http://products.eai.o2c.ibm.com";
declare namespace ns0 = "http://gentypes.eai.o2c.ibm.com";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://CommonCompanionElements.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:maskCardNumber($maskCardNumber as element(*))
			as xs:string {
				let $length :=fn:string-length(data($maskCardNumber))
				let $maskValue := fn:substring(xs:string(data($maskCardNumber)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'.','*'),fn:substring(xs:string(data($maskCardNumber)),data($length)-3,4))
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


declare function xf:MaskGetOrderDetails_3RS($companionMessage as element(ns1:companionMessage))
    as element(ns1:companionMessage) {
       
        let $from := (
  if($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber)then
        		fn-bea:serialize($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber)
        	else ' ' 
        		
        	)        
               
               
               let $to :=	(if($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber)then
        		fn-bea:serialize(<ns2:cardNumber>{xf:maskCardNumber($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber)}</ns2:cardNumber>)
        	else ' '
            
        		
           
        	
        	
	)
    	return
    	fn-bea:inlinedXML(xf:replaceMultipleData(fn-bea:serialize($companionMessage),$from,$to))   
               
                      
       
};

declare variable $companionMessage as element(ns1:companionMessage) external;

xf:MaskGetOrderDetails_3RS($companionMessage)