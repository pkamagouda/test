(:: pragma bea:local-element-parameter parameter="$utilSubmitUpgradeOrderResp" type="ns1:companionMessage/ns1:utilSubmitUpgradeOrderResp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma  parameter="$successStatusCode" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:submitUpgradeOrder_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 			# Change Description # :)
(: 14/09/2011 		2.0.0 		Namratha 			Initial version :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructSubmitUpgradeOrder_1RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:ConstructSubmitUpgradeOrder_1RS($utilSubmitUpgradeOrderResp as element(),
    $successStatusCode as element(*))
    as element(ns0:submitUpgradeOrder_1Response) {
        <ns0:submitUpgradeOrder_1Response>
        	{
        	if(data($utilSubmitUpgradeOrderResp/ns2:acceptStatus)=data($successStatusCode/successStatus)) then
        	<ns0:status>
	        	<ns3:statusCode>{data($successStatusCode/submitUpgradeOrder_1SuccessStatusCode)}</ns3:statusCode>
	        	<ns3:externalDescription>{data($successStatusCode/submitUpgradeOrder_1SuccessDescription)}</ns3:externalDescription>
	        </ns0:status>
	        else ""
	        }
            <ns0:orderNumber>{ data($utilSubmitUpgradeOrderResp/ns1:upgradeOrderHeader/ns2:orderNumber) }</ns0:orderNumber>
            <ns0:upgradeMsisdn>{ fn:replace(data($utilSubmitUpgradeOrderResp/ns1:upgradeOrderHeader/ns2:upgradeMSISDN),"^0","44") }</ns0:upgradeMsisdn>
        	
        </ns0:submitUpgradeOrder_1Response>
};

declare variable $utilSubmitUpgradeOrderResp as element() external;
declare variable $successStatusCode as element(*) external;

xf:ConstructSubmitUpgradeOrder_1RS($utilSubmitUpgradeOrderResp,
    $successStatusCode)