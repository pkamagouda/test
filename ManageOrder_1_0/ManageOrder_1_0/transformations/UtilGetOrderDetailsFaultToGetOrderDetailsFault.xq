(:: pragma bea:global-element-parameter parameter="$fault" element="ns1:Fault" location="../../UtilGetOrderDetails_1_0/schemas/commonsoapfault.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Fault" location="../schemas/commonsoapfault.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 04/09/2009 		1.0.0 		Sadiq 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/UtilGetOrderDetailsFaultToGetOrderDetailsFault/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_1";
declare namespace ns1 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns3 = "http://soa.o2.co.uk/postpay/utilgetorderdetailsdata_1";
declare namespace ns2 = "http://soa.o2.co.uk/coredata_1";

declare function xf:UtilGetOrderDetailsFaultToGetOrderDetailsFault($fault as element(ns1:Fault),
    $errorMap as element(*))
    as element(ns1:Fault) {
        <ns1:Fault>
            <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
            <faultstring>{ data($errorMap/description) }</faultstring>
            <detail>
                <ns0:getOrderDetailsFault>
                    <ns2:SOAFaultOriginator>{ data($fault/detail/ns3:utilGetOrderDetailsFault/ns2:SOAFaultOriginator) }</ns2:SOAFaultOriginator>
                    <ns2:SOAFaultCode>{ data($errorMap/code) }</ns2:SOAFaultCode>
                    <ns2:faultDescription>{ data($errorMap/description) }</ns2:faultDescription>
                    {
						if( $fault/detail/ns3:utilGetOrderDetailsFault/ns2:faultTrace)then
							<ns2:faultTrace>{ data($fault/detail/ns3:utilGetOrderDetailsFault/ns2:faultTrace) }</ns2:faultTrace>
						else ''
					}
                    
                    <ns2:SOATransactionID>{ data($fault/detail/ns3:utilGetOrderDetailsFault/ns2:SOATransactionID) }</ns2:SOATransactionID>
                </ns0:getOrderDetailsFault>
            </detail>
        </ns1:Fault>
};

declare variable $fault as element(ns1:Fault) external;
declare variable $errorMap as element(*) external;

xf:UtilGetOrderDetailsFaultToGetOrderDetailsFault($fault,
    $errorMap)