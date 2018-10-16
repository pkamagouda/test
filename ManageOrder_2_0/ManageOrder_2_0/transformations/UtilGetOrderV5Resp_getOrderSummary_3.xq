xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsV5Resp" type="ns1:companionMessage/ns1:utilGetOrderDetailsV5Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderSummary_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 01/07/2015 		2.0.0 		Subra Bose          	Initial version :)
declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/UtilGetOrderV5Resp_getOrderSummary_3/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:UtilGetOrderV5Resp_getOrderSummary_3($utilGetOrderDetailsV5Resp as element(),
$configXML as element(*))
    as element(ns0:getOrderSummary_1Response) {
   <ns0:getOrderSummary_1Response>
        <ns0:responseCode>{data($configXML/successCode)}</ns0:responseCode>
            <ns0:orderSummary>
            
           { 
          
           for $companionMessage  in ($utilGetOrderDetailsV5Resp/ns1:companionMessage)        
           return
                for $uGODV5_SaleProd in $companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd
                return
                if($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN)
                then
                   <ns0:orderDetails>
                    <ns0:orderNumber>{ data($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderNumber) }</ns0:orderNumber>
                    <ns0:orderTimestamp>{ data($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderHeader/ns2:orderTimestamp) }</ns0:orderTimestamp>
                    <ns0:orderMethod>{ data($companionMessage/ns1:utilGetOrderDetailsV5Resp/ns1:uGODV5_OrderSourceDetails/ns2:orderMethod) }</ns0:orderMethod>
                    <ns0:handsetDetails>
                        <ns0:category>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:category) }</ns0:category>
                        <ns0:productId>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:productId)}</ns0:productId>
                        <ns0:productName>{data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:productName)}</ns0:productName>
                        <ns0:assignedProductNumber>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:assignedProductNumber)}</ns0:assignedProductNumber>
                        <ns0:make>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetMake)}</ns0:make>
                        <ns0:model>{ data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:handsetModel)}</ns0:model>
                        {
                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuId)) then
                        <ns0:skuId>{data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuId)}</ns0:skuId>
                        else ""
                        }
                        {
                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuName)) then
                        <ns0:skuName>{data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:skuName)}</ns0:skuName>
                        else ""
                        }
                        {
                        if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:imei)) then
                        <ns0:imei>{data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_HAN/ns2:imei)}</ns0:imei>
                        else ""
                        }
                    </ns0:handsetDetails>
                     </ns0:orderDetails>
                     else ""
                   } 
               
                
                
            </ns0:orderSummary>
        </ns0:getOrderSummary_1Response>
};

declare variable $utilGetOrderDetailsV5Resp as element() external;
declare variable $configXML as element(*) external;
xf:UtilGetOrderV5Resp_getOrderSummary_3($utilGetOrderDetailsV5Resp,$configXML)