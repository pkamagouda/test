xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsV5Resp" type="ns1:companionMessage/ns1:utilGetOrderDetailsV5Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/MaskingCardDetailsGetOrderDetails_3/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:maskCardNumber($maskCardNumber as element(*))
			as xs:string {
				let $length :=fn:string-length(data($maskCardNumber))
				let $maskValue := fn:substring(xs:string(data($maskCardNumber)),1,data($length)-4)
				return 
				fn:concat(fn:replace($maskValue,'.','*'),fn:substring(xs:string(data($maskCardNumber)),data($length)-3,4))
		};


declare function xf:MaskingCardDetailsGetOrderDetails_3($utilGetOrderDetailsV5Resp as element())
    as element(ns0:getOrderDetails_3Response) {
        <ns0:getOrderDetails_3Response>
        
         {
             if(($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails)and data($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails))then
               <ns0:initialPaymentDetails>
                 <ns0:cardDetails>
                    <ns0:cardNumber>{fn-bea:serialize(xf:maskCardNumber($utilGetOrderDetailsV5Resp/ns1:uGODV5_InitialPaymentDetails/ns1:uGODV5_CardDetails/ns2:cardNumber))}</ns0:cardNumber>
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
                
                
                 </ns0:initialPaymentDetails>
                 else ""
                 }
        </ns0:getOrderDetails_3Response>
};

declare variable $utilGetOrderDetailsV5Resp as element() external;

xf:MaskingCardDetailsGetOrderDetails_3($utilGetOrderDetailsV5Resp)