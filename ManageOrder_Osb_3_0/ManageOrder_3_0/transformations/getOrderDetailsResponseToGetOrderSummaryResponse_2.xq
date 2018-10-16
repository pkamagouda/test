xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$getOrderDetails_3Response" element="ns0:getOrderDetails_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getOrderSummary_1" element="ns0:getOrderSummary_1" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderSummary_1Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace xf = "http://tempuri.org/ManageOrder_2_0/transformations/getOrderDetailsResponseToGetOrderSummaryResponse_2/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";

declare function xf:getOrderDetailsResponseToGetOrderSummaryResponse_2($getOrderDetails_3Response as element(ns0:getOrderDetails_3Response),
    $getOrderSummary_1 as element(ns0:getOrderSummary_1),$configXML as element(*))
    as element(ns0:getOrderSummary_1Response) {
        <ns0:getOrderSummary_1Response>
         <ns0:responseCode>{data($configXML/successCode)}</ns0:responseCode>
            <ns0:orderSummary>
            {
           for $saleableProductDetails in $getOrderDetails_3Response/ns0:saleableProductDetails
 			 return
                if(data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:imei)=data($getOrderSummary_1/ns0:imei))
                then
             
                <ns0:orderDetails>
                    <ns0:orderNumber>{ data($getOrderDetails_3Response/ns0:orderHeaderDetails/ns0:orderNumber) }</ns0:orderNumber>
                    <ns0:orderTimestamp>{ data($getOrderDetails_3Response/ns0:orderHeaderDetails/ns0:orderTimestamp) }</ns0:orderTimestamp>
                    <ns0:orderMethod>{ data($getOrderDetails_3Response/ns0:orderSourceDetails/ns0:orderMethod) }</ns0:orderMethod>
                    {
                       if(data($getOrderDetails_3Response/ns0:orderSourceDetails/ns0:storeName)) then
                       
                        
                            <ns0:storeName>{ data($getOrderDetails_3Response/ns0:orderSourceDetails/ns0:storeName) }</ns0:storeName>
                   else ""
                   }
                   
                    <ns0:handsetDetails>
                        <ns0:category>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:category) }</ns0:category>
                        <ns0:productId>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:productId) }</ns0:productId>
                        <ns0:productName>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:productName) }</ns0:productName>
                        <ns0:assignedProductNumber>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:assignedProductNumber) }</ns0:assignedProductNumber>
                        <ns0:make>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:make) }</ns0:make>
                        <ns0:model>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:model) }</ns0:model>
                        {
                           if($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:skuId) then
						<ns0:skuId>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:skuId) }</ns0:skuId>
                        else ""
                        }
                        {
                            if($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:skuName) then
                            
                                <ns0:skuName>{ data($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:skuName) }</ns0:skuName>
                                else ""
                        }
                        {
                            if($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:imei) 
                            then
                                <ns0:imei>{ data(($saleableProductDetails/ns0:assignedProduct/ns0:handsetDetails/ns0:imei)) }</ns0:imei>
                                else""
                        }
                    </ns0:handsetDetails>
                </ns0:orderDetails>
                else ""
               
                }
            </ns0:orderSummary>
        </ns0:getOrderSummary_1Response>
};

declare variable $getOrderDetails_3Response as element(ns0:getOrderDetails_3Response) external;
declare variable $getOrderSummary_1 as element(ns0:getOrderSummary_1) external;
declare variable $configXML as element(*) external;
xf:getOrderDetailsResponseToGetOrderSummaryResponse_2($getOrderDetails_3Response,
    $getOrderSummary_1,$configXML)