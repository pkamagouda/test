xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$getOrderDetails_3" element="ns1:getOrderDetails_3" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:local-element-return type="ns0:companionMessage/ns0:utilGetOrderDetails" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)

(: # Date # 	  # Version # 	   # Author # 		    # Change Description # :)
(: 25/05/2016 		1.0.0 		   Subra Bose 			Changed utilGetOrderDetailsV5Resp to utilGetOrderDetailsResp as part of GlobalCre and Running :)
(: 10/06/2016       1.0.1          Chandrakala S       Added "versionID" as part of Refresh Buy Out  project :)
(: 27/09/2017       1.0.2          Megha N             Added "versionId" as part of Promotions and Airtime Discount Project :)


declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetOrderDetails_3RQToutilGetOrderDetailsRQ/";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";

declare function xf:GetOrderDetails_3RQToutilGetOrderDetailsRQ($getOrderDetails_3 as element(ns1:getOrderDetails_3),
$header as element(*),$configXML as element(*))
    as element() {
       <ns0:companionMessage>
         <ns0:utilGetOrderDetails>
          <ns2:companionHeader>
                    <ns2:channel>{ data($header/ns3:applicationID) }</ns2:channel>
                    {
                    	if(fn:contains(data($header/ns3:SOAConsumerTransactionID),':')) then
                    		<ns2:userId>{ fn:substring-after(data($header/ns3:SOAConsumerTransactionID),':') }</ns2:userId>
                    	else ''
                    }
                   
                
                    {
					if(data($getOrderDetails_3/ns1:retrieveAdditionalInfo))then
					     
					   
						 if (data($getOrderDetails_3/ns1:retrieveAdditionalInfo/ns1:parameterName)=data($configXML/getOrderDetails_3/parameterName)) then
							 <ns2:versionId>{data($configXML/getOrderDetails_3/versionID)}</ns2:versionId>
							 
						 else if (data($getOrderDetails_3/ns1:retrieveAdditionalInfo/ns1:parameterName)=data($configXML/additionalPromotions))then
						 	<ns2:versionId>{data($configXML/versionIDPromotions)}</ns2:versionId>
						 
						 else if (data($getOrderDetails_3/ns1:retrieveAdditionalInfo/ns1:parameterName)=data($configXML/ParameterName))then
						 	<ns2:versionId>{data($configXML/versionIDPromotions)}</ns2:versionId>
						 	
						 else 	<ns2:versionId>{data($configXML/versionIDPromotions)}</ns2:versionId>
		                 else  <ns2:versionId>{data($configXML/versionIDPromotions)}</ns2:versionId>
					}
					
                    
                    {
                    	if(data($header/ns3:SOATransactionID)) then
                    		<ns2:replyKey>{ data($header/ns3:SOATransactionID) }</ns2:replyKey>
                    	else ''
                    }
                      
            
             </ns2:companionHeader>
        {
             if(data($getOrderDetails_3/ns1:orderNumber))then
            <ns2:orderNumber>{ data($getOrderDetails_3/ns1:orderNumber) }</ns2:orderNumber>
            else if(data($getOrderDetails_3/ns1:msisdn))then
            <ns2:msisdn>{ fn:replace(data($getOrderDetails_3/ns1:msisdn),'^44','0') }</ns2:msisdn>
            else if(data($getOrderDetails_3/ns1:paymentReferenceNumber))then
            <ns2:paymentReferenceNumber>{ data($getOrderDetails_3/ns1:paymentReferenceNumber) }</ns2:paymentReferenceNumber>
            else if(data($getOrderDetails_3/ns1:imei))then
            <ns2:imei>{ data($getOrderDetails_3/ns1:imei) }</ns2:imei>
            else ""
         }   
         
        </ns0:utilGetOrderDetails>
       </ns0:companionMessage> 
};

declare variable $getOrderDetails_3 as element(ns1:getOrderDetails_3) external;
declare variable $header as element(*) external;
declare variable $configXML as element(*) external;
xf:GetOrderDetails_3RQToutilGetOrderDetailsRQ($getOrderDetails_3,$header,$configXML)