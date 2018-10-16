(:: pragma bea:global-element-return element="ns1:getArchiveOrderDetails" location="../../SouthBoundInterfaces/order100/orderenquirydata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 			# Change Description # :)
(: 04/05/2010 		2.0.0 		Sukhpreet Kaur 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructGetArchiveOrderDetailsRQ/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/orderenquirydata_1";

declare function xf:ConstructGetArchiveOrderDetailsRQ($msisdn as xs:string,
    $orderNumber as xs:string)
    as element(ns1:getArchiveOrderDetails) {
        <ns1:getArchiveOrderDetails>
        {
        if(data($orderNumber)) then
            <ns1:orderNumber>{ $orderNumber }</ns1:orderNumber>
        else if(data($msisdn)) then
            <ns1:mobileNumber>{ $msisdn }</ns1:mobileNumber>
        else ''
        }
        </ns1:getArchiveOrderDetails>
};

declare variable $msisdn as xs:string external;
declare variable $orderNumber as xs:string external;

xf:ConstructGetArchiveOrderDetailsRQ($msisdn,
    $orderNumber)