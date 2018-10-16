(:: pragma bea:global-element-parameter parameter="$getDeliveryOptions_1" element="ns1:getDeliveryOptions_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetDeliveryOptions" location="../../SouthBoundInterfaces/cukeai4d/SOA_WMQIServices.xsd" ::)

(: # Date # 	# Version # 	# Author # 			# Change Description # :)
(: 14/09/2011 		2.0.0 		Namratha 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructGetDeliveryOptions_1RQ/";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:ConstructGetDeliveryOptions_1RQ($getDeliveryOptions_1 as element(ns1:getDeliveryOptions_1),$defaultTime as element(*))
    as element() {
    <ns0:companionMessage>
        <ns0:utilGetDeliveryOptions>
        	<ns0:currentTime>{(fn:substring(fn:string(fn:current-time()),1,8))}</ns0:currentTime>
            <ns2:orderType>{ data($getDeliveryOptions_1/ns1:orderType) }</ns2:orderType>
            <ns2:orderDate>{ fn:concat(data($getDeliveryOptions_1/ns1:orderDate),data($defaultTime)) }</ns2:orderDate>
            {
            	if(fn:contains(data($getDeliveryOptions_1/ns1:postCode),' ')or fn:string-length(data($getDeliveryOptions_1/ns1:postCode))<=3)then
	      				 <ns2:postcode>{ fn:upper-case(data($getDeliveryOptions_1/ns1:postCode)) }</ns2:postcode>
	    			else
	    			 let $postCode:=fn:concat(fn:substring(data($getDeliveryOptions_1/ns1:postCode),1,fn:string-length(data($getDeliveryOptions_1/ns1:postCode))-3),' ',fn:substring(data($getDeliveryOptions_1/ns1:postCode),fn:string-length(data($getDeliveryOptions_1/ns1:postCode))-2,fn:string-length(data($getDeliveryOptions_1/ns1:postCode))))
	           		 return
	           	<ns2:postcode>{ fn:upper-case($postCode) }</ns2:postcode>
	    	}
	    	{
	    	if(data($getDeliveryOptions_1/ns1:isActiveReplacement)) then
            		<ns2:activeReplacement>{ data($getDeliveryOptions_1/ns1:isActiveReplacement) }</ns2:activeReplacement>
            else ""
            }
        </ns0:utilGetDeliveryOptions>
     </ns0:companionMessage>
};

declare variable $getDeliveryOptions_1 as element(ns1:getDeliveryOptions_1) external;
declare variable $defaultTime as element(*) external;

xf:ConstructGetDeliveryOptions_1RQ($getDeliveryOptions_1,$defaultTime)