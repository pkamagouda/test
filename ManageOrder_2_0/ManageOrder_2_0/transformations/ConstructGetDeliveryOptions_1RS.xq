(:: pragma bea:local-element-parameter parameter="$utilGetDeliveryOptionsResp" type="ns1:companionMessage/ns1:utilGetDeliveryOptionsResp" location="../../SouthBoundInterfaces/cukeai4d/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getDeliveryOptions_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 			# Change Description # :)
(: 14/09/2010 		2.0.0 		Namratha 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/UtilgetDeliveryOptionsRSToGetDeliveryOptions_1RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:UtilgetDeliveryOptionsRSToGetDeliveryOptions_1RS($utilGetDeliveryOptionsResp as element(),$clickAndCollect as xs:string,$configXML as element(*))
    as element(ns0:getDeliveryOptions_1Response) {
        <ns0:getDeliveryOptions_1Response>
       
        	{
        	if(data($utilGetDeliveryOptionsResp/ns1:futureDatedOptions/ns1:deliveryOption)) then
            <ns0:listOfDeliveryOptions>
                {
                  for $deliveryOption in $utilGetDeliveryOptionsResp/ns1:futureDatedOptions/ns1:deliveryOption
                    return
                        <ns0:deliveryOption>
                            <ns0:deliveryDate>{ data($deliveryOption/ns2:deliveryDate) }</ns0:deliveryDate>
                            <ns0:requestedDespatchDate>{ data($deliveryOption/ns2:requestedDespatchDate) }</ns0:requestedDespatchDate>
                            <ns0:timeSlot>{ data($deliveryOption/ns2:timeslot) }</ns0:timeSlot>
                        </ns0:deliveryOption>
                 }
                 {
                  for $deliveryOption in $utilGetDeliveryOptionsResp/ns1:futureDatedOptions/ns1:deliveryOption
                   let $date:= data($deliveryOption/ns2:deliveryDate)
                    return
                    	if( data($deliveryOption/ns2:timeslot)= data($configXML/timeSlots/timeSlot)) then
                    	 <ns0:deliveryOption>
                            <ns0:deliveryDate>{ 
                            	if( (xs:integer((xs:date($date) - xs:date('1901-01-06')) div xdt:dayTimeDuration('P1D')) mod 7) !=6 ) then
									xs:date($date) + xdt:dayTimeDuration('P1D')
								else
									xs:date($date) + xdt:dayTimeDuration('P2D')
                             }</ns0:deliveryDate>
                            <ns0:requestedDespatchDate>{ data($deliveryOption/ns2:requestedDespatchDate) }</ns0:requestedDespatchDate>
                            <ns0:timeSlot>{ data($clickAndCollect) }</ns0:timeSlot>
                        </ns0:deliveryOption>
                       	else " "
                 }
                 
            </ns0:listOfDeliveryOptions>
            else ""
            }
        </ns0:getDeliveryOptions_1Response>
};

declare variable $utilGetDeliveryOptionsResp as element() external;
declare variable $clickAndCollect as xs:string external;
declare variable $configXML as element(*) external;

xf:UtilgetDeliveryOptionsRSToGetDeliveryOptions_1RS($utilGetDeliveryOptionsResp,$clickAndCollect,$configXML)