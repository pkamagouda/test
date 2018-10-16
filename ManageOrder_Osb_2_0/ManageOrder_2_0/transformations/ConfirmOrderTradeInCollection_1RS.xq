xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$configXML" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns1:confirmOrderTradeInCollection_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)


(: # Date # 		# Version # 	  # Author # 				# Change Description # :)
(: 10/06/2016 	  	  1.0.0 		Chandrakala S 		          Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConfirmOrderTradeInCollection_1RS/";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns0 = "http://soa.o2.co.uk/coredata_1";

declare function xf:ConfirmOrderTradeInCollection_1RS($configXML as element(*))
    as element(ns1:confirmOrderTradeInCollection_1Response) {
        <ns1:confirmOrderTradeInCollection_1Response>
         <ns1:result>
               <ns0:statusCode>{ data($configXML/confirmOrderTradeInCollection/statusCode) }</ns0:statusCode>
                <ns0:externalDescription>{ data($configXML/confirmOrderTradeInCollection/externalDescription) }</ns0:externalDescription>
            </ns1:result>
        </ns1:confirmOrderTradeInCollection_1Response>
};

declare variable $configXML as element(*) external;

xf:ConfirmOrderTradeInCollection_1RS($configXML)