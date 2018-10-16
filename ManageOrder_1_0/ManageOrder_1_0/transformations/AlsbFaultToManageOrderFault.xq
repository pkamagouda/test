(:: pragma bea:global-element-parameter parameter="$fault" element="ns2:fault" location="../../CommonResources/schemas/alsbfault.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Fault" location="../schemas/commonsoapfault.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 02/09/2009 		1.0.0 		Shashwati 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/AlsbFaultToManageOrderFault/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_1";
declare namespace ns1 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://www.bea.com/wli/sb/context";

declare function xf:AlsbFaultToManageOrderFault($fault as element(ns2:fault),
$errorMap as element(*),$transactionId as xs:string,$operation as xs:string)
    as element(ns1:Fault) {
        <ns1:Fault>
         	<faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
             <faultstring>{data($errorMap/description)}</faultstring>
            <detail>
            	{
             	if($operation="getOrderList")then
               	 <ns0:getOrderListFault>
	                	{
	                	if( data($fault/ns2:location/ns2:node)) then
	                   	 <ns3:SOAFaultOriginator>{ data($fault/ns2:location/ns2:node) }</ns3:SOAFaultOriginator>
	                    else
	                     <ns3:SOAFaultOriginator>{ data($fault/ns2:location/ns2:stage) }</ns3:SOAFaultOriginator>
	                   	} 
	                    <ns3:SOAFaultCode>{ data($errorMap/code) }</ns3:SOAFaultCode>
	                    <ns3:faultDescription>{ data($errorMap/description) }</ns3:faultDescription>
	                    <ns3:SOATransactionID>{ $transactionId }</ns3:SOATransactionID>
                </ns0:getOrderListFault>
                
             	 else if($operation="getOrderDetails")  then
              	<ns0:getOrderDetailsFault>
	                	{
	                	if( data($fault/ns2:location/ns2:node)) then
	                   	 <ns3:SOAFaultOriginator>{ data($fault/ns2:location/ns2:node) }</ns3:SOAFaultOriginator>
	                    else
	                     <ns3:SOAFaultOriginator>{ data($fault/ns2:location/ns2:stage) }</ns3:SOAFaultOriginator>
	                   	} 
	                    <ns3:SOAFaultCode>{ data($errorMap/code) }</ns3:SOAFaultCode>
	                    <ns3:faultDescription>{ data($errorMap/description) }</ns3:faultDescription>
	                    <ns3:SOATransactionID>{ $transactionId }</ns3:SOATransactionID>
                </ns0:getOrderDetailsFault>
                else ''
              }  
            </detail>
        </ns1:Fault>
};

declare variable $fault as element(ns2:fault) external;
declare variable $errorMap as element(*) external;
declare variable $transactionId as xs:string external;
declare variable $operation as xs:string external;

xf:AlsbFaultToManageOrderFault($fault,$errorMap,$transactionId,$operation)