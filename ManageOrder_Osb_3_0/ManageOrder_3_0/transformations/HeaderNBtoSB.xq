xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma  parameter="$header" type="xs:anyType" ::)
(:: pragma  type="xs:anyType" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 25/05/2015 		2.0.0 		Subra Bose          	Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/HeaderNBtoSB/";
declare namespace SOAP-ENV = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns0 = "http://soa.o2.co.uk/coredata_1";
declare function xf:HeaderNBtoSB($anyType1 as element(*),
    $header as element(*))
    as element(*) {
        <SOAP-ENV:Header>
              <ns0:SOAConsumerTransactionID>{data($header/ns0:SOAConsumerTransactionID)}</ns0:SOAConsumerTransactionID>
              <ns0:SOATransactionID>{data($header/ns0:SOATransactionID)}</ns0:SOATransactionID>
              <ns0:applicationID>{data($header/ns0:applicationID)}</ns0:applicationID>
     </SOAP-ENV:Header>
      
};

declare variable $anyType1 as element(*) external;
declare variable $header as element(*) external;

xf:HeaderNBtoSB($anyType1,
    $header)