xquery version "1.0" encoding "Cp1252";
(:
This Xquery will be used to transform all kinds of faults into commonsoapfault
Input Parameters
operationName :- This variable will be bound to the $operation alsb context variable which holds the name of the operation
namespace     :- This variable will have the wsdl targetnamespace of the respective service
faultOriginator	:- This field will be populated from node/stage element of alsbFault or  faultOriginator from soapFault
errorMap      :- This will be the errorMap obtained from the Framework for the error occured
transactionId :- This is the SOA TransactionId retrieved from the header.
faultTrace :- This element will be bound to faultTrace coming from the backend, else it will be null

Ouput Parameter
commonsoapfault which constitutes the fault details of the respective operation
:)
declare namespace xf = "http://soa.o2.co.uk/FaultHandling/transf/ConstructGenericServiceFault/";
declare namespace soap-env = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ctx = "http://www.bea.com/wli/sb/context";
declare namespace cor = "http://soa.o2.co.uk/coredata_1";
declare function xf:ConstructGenericServiceFault($operationName,$namespace,$faultOriginator,$errorMap as element(*),$transactionId,$faultTrace)
    as element(*) {
    	<soap-env:Fault>
            <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
            <faultstring>{fn-bea:inlinedXML(data($errorMap/description))}</faultstring>
            {
            if(string-length($faultTrace)!=0)then
            <detail>
            {  fn-bea:inlinedXML(concat("<ns1:",$operationName,"Fault ",'xmlns:ns1="',$namespace,'"',' xmlns:xcore="http://soa.o2.co.uk/coredata_1"',">",
                    "<xcore:SOAFaultOriginator>",$faultOriginator,"</xcore:SOAFaultOriginator>",
                    "<xcore:SOAFaultCode>",data($errorMap/code),"</xcore:SOAFaultCode>",
                    "<xcore:faultDescription>",data($errorMap/description),"</xcore:faultDescription>",
                    "<xcore:faultTrace>",$faultTrace,"</xcore:faultTrace>",
                    "<xcore:SOATransactionID>",$transactionId,"</xcore:SOATransactionID>","</ns1:",$operationName,"Fault>"))
            }
            </detail>
            else 
            <detail>
            {  fn-bea:inlinedXML(concat("<ns1:",$operationName,"Fault ",'xmlns:ns1="',$namespace,'"',' xmlns:xcore="http://soa.o2.co.uk/coredata_1"',">",
                    "<xcore:SOAFaultOriginator>",$faultOriginator,"</xcore:SOAFaultOriginator>",
                    "<xcore:SOAFaultCode>",data($errorMap/code),"</xcore:SOAFaultCode>",
                    "<xcore:faultDescription>",data($errorMap/description),"</xcore:faultDescription>",
                    "<xcore:SOATransactionID>",$transactionId,"</xcore:SOATransactionID>","</ns1:",$operationName,"Fault>"))
            }
            </detail>
            }
         </soap-env:Fault>
};

declare variable $operationName as xs:string external;
declare variable $namespace as xs:string external;
declare variable $faultOriginator as xs:string external;
declare variable $errorMap as element(*) external;
declare variable $transactionId as xs:string external;
declare variable $faultTrace as xs:string external;
xf:ConstructGenericServiceFault($operationName,$namespace,$faultOriginator,$errorMap,$transactionId,$faultTrace)