(:: pragma bea:global-element-parameter parameter="$fault" element="ns1:Fault" location="../../UtilGetOrderList_1_0/schemas/commonsoapfault.xsd" ::)
(:: pragma  parameter="$errorMap" type="anyType" ::)
(:: pragma bea:global-element-return element="ns1:Fault" location="../schemas/commonsoapfault.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 02/09/2009 		1.0.0 		Shashwati 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/UtilGetOrderListFaultToGetOrderListFault/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_1";
declare namespace ns1 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://soa.o2.co.uk/postpay/utilgetorderlistdata_1";

declare function xf:UtilGetOrderListFaultToGetOrderListFault($fault as element(ns1:Fault),
    $errorMap as element(*))
    as element(ns1:Fault) {
        <ns1:Fault>
            <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">{ data($fault/faultcode) }</faultcode>
            <faultstring>{ data($errorMap/description) }</faultstring>
            <detail>
                <ns0:getOrderListFault>
                    <ns3:SOAFaultOriginator>{ data($fault/detail/ns2:utilGetOrderListFault/ns3:SOAFaultOriginator) }</ns3:SOAFaultOriginator>
                    <ns3:SOAFaultCode>{ data($errorMap/code) }</ns3:SOAFaultCode>
                    <ns3:faultDescription>{ data($errorMap/description) }</ns3:faultDescription>
                    {
                        if( $fault/detail/ns2:utilGetOrderListFault/ns3:faultTrace)then
                        <ns3:faultTrace>{ data($fault/detail/ns2:utilGetOrderListFault/ns3:faultTrace) }</ns3:faultTrace>
                        else ''
                    }
                    <ns3:SOATransactionID>{ data($fault/detail/ns2:utilGetOrderListFault/ns3:SOATransactionID) }</ns3:SOATransactionID>
                </ns0:getOrderListFault>
            </detail>
        </ns1:Fault>
};

declare variable $fault as element(ns1:Fault) external;
declare variable $errorMap as element(*) external;

xf:UtilGetOrderListFaultToGetOrderListFault($fault,
    $errorMap)