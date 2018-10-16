(:: pragma bea:local-element-parameter parameter="$utilGetOrderListV4Resp" type="ns1:companionMessage/ns1:utilGetOrderListV4Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderList_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)
(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 26/10/2014 		1.0.0 		Vanishree 			Initial version :)
(: 16/04/2015 		1.0.1 		Rashmi Patil		Added storeNumber element as part of Click & Collect Now project.:)
(: 2/01/2016 		1.0.1 		Nishith Coomar		Bug fix for MyOnline Order issue with multiple packagenames:)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/UtilGetOrderListV4Resp_To_GetOrderList_3Response/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:UtilGetOrderListV4Resp_To_GetOrderList_3Response($utilGetOrderListV4Resp as element(),$getOrderListRequest as element(*),$configXml as element(*))
    as element(ns0:getOrderList_3Response) 
    {
       
      
          <ns0:getOrderList_3Response>
            <ns0:totalOrders>{ data($utilGetOrderListV4Resp/ns2:totalOrders) }</ns0:totalOrders>
            <ns0:ordersReturned>{ xs:integer( data($utilGetOrderListV4Resp/ns2:ordersReturned) ) }</ns0:ordersReturned>
            {
             if($utilGetOrderListV4Resp/ns1:uGOLV4_Order)then
            <ns0:orderList>
                {
                    for $uGOLV4_Order in $utilGetOrderListV4Resp/ns1:uGOLV4_Order
                    return
                        <ns0:orders>
                            <ns0:orderNumber>{ data($uGOLV4_Order/ns2:orderNumber) }</ns0:orderNumber>
                            <ns0:orderID>{ xs:integer( data($uGOLV4_Order/ns2:oid) ) }</ns0:orderID>
                            <ns0:orderType>{ data($uGOLV4_Order/ns2:orderType) }</ns0:orderType>
							{
                               for $saleableProductName in $utilGetOrderListV4Resp/$uGOLV4_Order/ns2:saleableProductName
                                return
                               <ns0:packageName>{ data($uGOLV4_Order/$saleableProductName) }</ns0:packageName>
                             }
                                 
                            <ns0:orderDate>{ data($uGOLV4_Order/ns2:orderDate) }</ns0:orderDate>
                            <ns0:orderStatus>{ data($uGOLV4_Order/ns2:orderStatus) }</ns0:orderStatus>
                            <ns0:returnsOutstanding>{ data($uGOLV4_Order/ns2:returnsOutstanding) }</ns0:returnsOutstanding>
                            <ns0:partner>{ data($uGOLV4_Order/ns2:partner) }</ns0:partner>
                            {
                             if(data($uGOLV4_Order/ns2:earlyUpgradeFee))then
                            <ns0:earlyUpgradeFee>{ data($uGOLV4_Order/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                            else if(data($uGOLV4_Order/CCASettlementAmount))then
                            <ns0:CCASettlementAmount>{ data($uGOLV4_Order/CCASettlementAmount) }</ns0:CCASettlementAmount>
                            else ""
                            }
                            {
                              if($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails)then 
                            <ns0:orderCollectionDetails>
                                <ns0:partyForeName>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:partyForename) }</ns0:partyForeName>
                                <ns0:partySurName>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:partySurname) }</ns0:partySurName>
                                <ns0:postcode>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:postcode) }</ns0:postcode>
                                <ns0:orderMethod>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:orderMethod) }</ns0:orderMethod>
                                <ns0:isClickAndCollect>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:isClickAndCollect) }</ns0:isClickAndCollect>
                                <ns0:isClickAndCollectNow>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:isClickAndCollectNow) }</ns0:isClickAndCollectNow>
                               
                                {
                                 if(data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:collectionStatus))then
                                <ns0:collectionStatus>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:collectionStatus) }</ns0:collectionStatus>
                                else ""
                                }
                                {
                                if(data($getOrderListRequest/ns0:returnStoreNumber) = data($configXml/Y))then
                                
                                <ns0:storeNumber>{ data($uGOLV4_Order/ns1:uGOLV4_OrderCollectionDetails/ns2:storeNumber) }</ns0:storeNumber>
                               else ""
                             }
                                
                            </ns0:orderCollectionDetails>
                            else""
                            }
                        </ns0:orders>
                }
            </ns0:orderList>
            else ""
            }
        </ns0:getOrderList_3Response>
      
       
        
};

declare variable $utilGetOrderListV4Resp as element() external;
declare variable $getOrderListRequest as element(*) external;
declare variable $configXml as element(*) external;

xf:UtilGetOrderListV4Resp_To_GetOrderList_3Response($utilGetOrderListV4Resp,$getOrderListRequest,$configXml)