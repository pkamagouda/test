(:: pragma  parameter="$configXML" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:confirmOrderPayment_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 		# Version # 	# Author # 				# Change Description # :)
(: 02/08/2013 	  	  2.0.0 		Ravichandran R 		    Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructConfirmOrderPayment_1Response/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/coredata_1";

declare function xf:ConstructConfirmOrderPayment_1Response($configXML as element(*))
    as element(ns0:confirmOrderPayment_1Response) {
        <ns0:confirmOrderPayment_1Response>
            <ns0:result>
                <ns1:statusCode>{ data($configXML/confirmOrderPayment_1/statusCode) }</ns1:statusCode>
                <ns1:externalDescription>{ data($configXML/confirmOrderPayment_1/externalDescription) }</ns1:externalDescription>
            </ns0:result>
        </ns0:confirmOrderPayment_1Response>
};

declare variable $configXML as element(*) external;

xf:ConstructConfirmOrderPayment_1Response($configXML)