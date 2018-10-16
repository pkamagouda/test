xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:updateOrderCollectionStatusResponse" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 		# Version # 	# Author # 				# Change Description # :)
(: 25/09/2014 	  	  2.0.0 		Dolly K 		          Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructUpdateOrderCollectionStatusResponse/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/coredata_1";

declare function xf:ConstructUpdateOrderCollectionStatusResponse($configXML as element(*))
as element(ns0:updateOrderCollectionStatusResponse) {
    <ns0:updateOrderCollectionStatusResponse>
     <ns0:result>
                <ns1:statusCode>{ data($configXML/updateOrderCollectionStatus/statusCode) }</ns1:statusCode>
                <ns1:externalDescription>{ data($configXML/updateOrderCollectionStatus/externalDescription) }</ns1:externalDescription>
            </ns0:result>
    </ns0:updateOrderCollectionStatusResponse>
};

declare variable $configXML as element(*) external;
xf:ConstructUpdateOrderCollectionStatusResponse($configXML)