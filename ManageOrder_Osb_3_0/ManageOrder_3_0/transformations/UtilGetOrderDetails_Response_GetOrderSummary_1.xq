xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsResp" type="ns0:companionMessage/ns0:utilGetOrderDetailsResp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getOrderSummary_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/UtilGetOrderDetails_Response_GetOrderSummary_1/";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";

declare function xf:UtilGetOrderDetails_Response_GetOrderSummary_1($utilGetOrderDetailsResp as element(),
$configXML as element(*))
    as element(ns1:getOrderSummary_1Response) {
        <ns1:getOrderSummary_1Response>
          <ns1:responseCode>{data($configXML/successCode)}</ns1:responseCode>
            <ns1:orderSummary>
           { 
           for $uGOD_SaleProd  in $utilGetOrderDetailsResp/ns0:uGOD_SaleProd
           return
           if($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN)
                then
                <ns1:orderDetails>
                    <ns1:orderNumber>{ data($utilGetOrderDetailsResp/ns0:uGOD_OrderHeader/ns2:orderNumber) }</ns1:orderNumber>
                    <ns1:orderTimestamp>{ data($utilGetOrderDetailsResp/ns0:uGOD_OrderHeader/ns2:orderTimestamp) }</ns1:orderTimestamp>
                    <ns1:orderMethod>{ data($utilGetOrderDetailsResp/ns0:uGOD_OrderSourceDetails/ns2:orderMethod) }</ns1:orderMethod>
                   
                    <ns1:handsetDetails>
                        <ns1:category>{ data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:category) }</ns1:category>
                        <ns1:productId>{ data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:productId)}</ns1:productId>
                        <ns1:productName>{data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:productName)}</ns1:productName>
                        <ns1:assignedProductNumber>{ data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:assignedProductNumber)}</ns1:assignedProductNumber>
                        <ns1:make>{ data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:handsetMake)}</ns1:make>
                        <ns1:model>{ data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:handsetModel)}</ns1:model>
                        {
                        if(data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:skuId)) then
                        <ns1:skuId>{data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:skuId)}</ns1:skuId>
                        else ""
                        }
                        {
                        if(data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:skuName)) then
                        <ns1:skuName>{data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:skuName)}</ns1:skuName>
                        else ""
                        }
                        {
                        if(data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:imei)) then
                        <ns1:imei>{data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_HAN/ns2:imei)}</ns1:imei>
                        else ""
                        }
                    </ns1:handsetDetails>
                    
                </ns1:orderDetails>
                else ""
                }
            </ns1:orderSummary>
        </ns1:getOrderSummary_1Response>
};

declare variable $utilGetOrderDetailsResp as element() external;
declare variable $configXML as element(*) external;

xf:UtilGetOrderDetails_Response_GetOrderSummary_1($utilGetOrderDetailsResp,$configXML)