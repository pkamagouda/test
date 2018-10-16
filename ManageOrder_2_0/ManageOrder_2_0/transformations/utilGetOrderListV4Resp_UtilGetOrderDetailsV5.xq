(:: pragma bea:local-element-parameter parameter="$utilGetOrderListV4Resp" type="ns0:companionMessage/ns0:utilGetOrderListV4Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma  parameter="$header" type="anyType" ::)
(:: pragma  parameter="$getOrderSummary_1Request" type="anyType" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetOrderDetailsV5" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 26/06/2015 		2.0.0 		Subra Bose          	Initial version :)
declare namespace ns4 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/utilGetOrderListV4Resp_UtilGetOrderDetailsV5/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://companion.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";

declare function xf:utilGetOrderListV4Resp_UtilGetOrderDetailsV5($utilGetOrderListV4Resp as element(),
    $header as element(*),
    $Order as element(*),
    $getOrderSummary_1Request as element(*))
    as element() {
      <ns0:companionMessage>
        <ns0:utilGetOrderDetailsV5>
            <ns1:companionHeader>
                <ns1:channel>{ data($header/ns3:applicationID) }</ns1:channel>
                 {
                    	if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
                    		<ns1:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') }</ns1:userId>
                    	else ''
                    }
                    {
                    	if(data($header/ns3:SOATransactionID)) then
                    		<ns1:replyKey>{ data($header/ns3:SOATransactionID) }</ns1:replyKey>
                    	else ''
                    }
            </ns1:companionHeader>
           
            <ns1:orderNumber>{ data($Order/ns1:orderNumber) }</ns1:orderNumber>
            
           
            
        </ns0:utilGetOrderDetailsV5>
          </ns0:companionMessage>
};

declare variable $utilGetOrderListV4Resp as element() external;
declare variable $header as element(*) external;
declare variable $Order as element(*) external;
declare variable $getOrderSummary_1Request as element(*) external;

xf:utilGetOrderListV4Resp_UtilGetOrderDetailsV5($utilGetOrderListV4Resp,
    $header,
    $Order,
    $getOrderSummary_1Request)