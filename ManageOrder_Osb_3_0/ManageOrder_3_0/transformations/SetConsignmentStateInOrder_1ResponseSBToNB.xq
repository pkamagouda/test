(:: pragma bea:local-element-parameter parameter="$utilUpdateOrderConsignmentStatusResp" type="ns1:companionMessage/ns1:utilUpdateOrderConsignmentStatusResp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:setConsignmentStateInOrder_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	   # Author # 		 # Change Description # :)
(: 16/08/2012 		1.0.0 		Dinsa Devassy 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/SetConsignmentStateInOrder_1ResponseSBToNB/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:SetConsignmentStateInOrder_1ResponseSBToNB($utilUpdateOrderConsignmentStatusResp as element(),$statusCode as xs:string,$externalDescription as xs:string)
    as element(ns0:setConsignmentStateInOrder_1Response) {
        <ns0:setConsignmentStateInOrder_1Response>
            <ns0:result>
                <ns3:statusCode>{ data($statusCode) }</ns3:statusCode>
                <ns3:externalDescription>{ data($externalDescription) }</ns3:externalDescription>
            </ns0:result>
        </ns0:setConsignmentStateInOrder_1Response>
};

declare variable $utilUpdateOrderConsignmentStatusResp as element() external;
declare variable $statusCode as xs:string external;
declare variable $externalDescription as xs:string external;
xf:SetConsignmentStateInOrder_1ResponseSBToNB($utilUpdateOrderConsignmentStatusResp,$statusCode,$externalDescription)