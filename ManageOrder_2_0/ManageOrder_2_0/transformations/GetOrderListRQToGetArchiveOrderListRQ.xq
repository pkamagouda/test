(:: pragma bea:global-element-parameter parameter="$getOrderList" element="ns0:getOrderList" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getArchiveOrderList" location="../../SouthBoundInterfaces/order100/orderenquirydata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 			# Change Description # :)
(: 06/05/2010 		2.0.0 		Sukhpreet Kaur 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderListRQToGetArchiveOrderListRQ/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/orderenquirydata_1";

declare function xf:GetOrderListRQToGetArchiveOrderListRQ($msisdn as xs:string)
    as element(ns1:getArchiveOrderList) {
        <ns1:getArchiveOrderList>
            <ns1:mobileNumber>{ $msisdn }</ns1:mobileNumber>
        </ns1:getArchiveOrderList>
};

declare variable $msisdn as xs:string external;

xf:GetOrderListRQToGetArchiveOrderListRQ($msisdn)