(:: pragma bea:local-element-parameter parameter="$utilGetOrderListV4Resp" type="ns1:companionMessage/ns1:utilGetOrderListV4Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getArchiveOrderListResponse" element="ns3:getArchiveOrderListResponse" location="../../SouthBoundInterfaces/order100/orderenquirydata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderList_3Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 26/09/2014 		2.0.0 		Dolly K           	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructGetOrderList_3RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns3 = "http://soa.o2.co.uk/orderenquirydata_1";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:ConstructGetOrderList_3RS($utilGetOrderListV4Resp as element(),
    $getArchiveOrderListResponse as element(ns3:getArchiveOrderListResponse),$configXml as element(*),$balanceOrdersCount as xs:integer)
    as element(ns0:getOrderList_3Response) {
        if((fn:count(data($getArchiveOrderListResponse/*[2])) = data($configXml/ZeroValue)) and (fn:count($utilGetOrderListV4Resp/*[3]) != data($configXml/ZeroValue))) then
        <ns0:getOrderList_3Response>
            <ns0:totalOrders>{ data($utilGetOrderListV4Resp/ns2:totalOrders) }</ns0:totalOrders>
            <ns0:orderList>
                <ns0:orders>
                    <ns0:orderNumber>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:orderNumber) }</ns0:orderNumber>
                    <ns0:orderID>{ xs:integer( data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:oid) ) }</ns0:orderID>
                    <ns0:orderType>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:orderType) }</ns0:orderType>
                    {
                        for $saleableProductName in $utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:saleableProductName
                        return
                            <ns0:packageName>{ data($saleableProductName) }</ns0:packageName>
                    }
                    <ns0:orderDate>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:orderDate) }</ns0:orderDate>
                    <ns0:orderStatus>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:orderStatus) }</ns0:orderStatus>
                    <ns0:returnsOutstanding>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:returnsOutstanding) }</ns0:returnsOutstanding>
                    <ns0:partner>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:partner) }</ns0:partner>
                    <ns0:earlyUpgradeFee>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns2:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                    <ns0:CCASettlementAmount>{ data($utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/CCASettlementAmount) }</ns0:CCASettlementAmount>
                    {
                        for $uGOLV4_OrderCollectionDetails in $utilGetOrderListV4Resp/ns1:uGOLV4_Order[1]/ns1:uGOLV4_OrderCollectionDetails
                        return
                            <ns0:orderCollectionDetails/>
                    }
                </ns0:orders>
            </ns0:orderList>
        </ns0:getOrderList_3Response>
       else if((fn:count($getArchiveOrderListResponse/*[2]) != data($configXml/ZeroValue)) and (fn:count($utilGetOrderListV4Resp/*[3]) != data($configXml/ZeroValue))) then
        <ns0:getOrderList_3Response>
            <ns0:totalOrders>{ xs:integer(data($utilGetOrderListV4Resp/ns1:totalOrders) + data($getArchiveOrderListResponse/ns2:orderCount)) }</ns0:totalOrders>
            {
            if(data($getArchiveOrderListResponse/ns2:orderCount) < $balanceOrdersCount) then
	            <ns0:ordersReturned>{ xs:integer(data($utilGetOrderListV4Resp/ns1:ordersReturned) + data($getArchiveOrderListResponse/ns2:orderCount)) }</ns0:ordersReturned>
	        else 
	        	<ns0:ordersReturned>{ xs:integer(data($utilGetOrderListV4Resp/ns1:ordersReturned) + $balanceOrdersCount) }</ns0:ordersReturned>
	        }
			{
               for $order in $utilGetOrderListV4Resp/ns1:order 
               return
                    
                    <ns0:order>
                    <ns0:orderNumber>{ data($order/ns1:orderNum) }</ns0:orderNumber>
                     <ns0:orderId>{ xs:string( data($order/ns1:oid) ) }</ns0:orderId>
                      <ns0:orderType>{ data($order/ns1:orderType) }</ns0:orderType>
                       {
                        
                            for $saleableProductName in $order/ns1:saleableProductName
                          return
                         <ns0:packageName>{ data($saleableProductName) }</ns0:packageName>
                        }
                        
                        <ns0:orderDate>{ data($order/ns1:orderDate) }</ns0:orderDate>
                        <ns0:orderStatus>{ data($order/ns1:orderStatus) }</ns0:orderStatus>
                        <ns0:returnsOutstanding>{ data($order/ns1:returnsOutstanding) }</ns0:returnsOutstanding>
                        <ns0:partner>{ data($order/ns1:partner) }</ns0:partner>
                         {
                        
                        if( data($order/ns1:earlyUpgradeFee) ) then
                        <ns0:earlyUpgradeFee>{ data($order/ns1:earlyUpgradeFee) }</ns0:earlyUpgradeFee>
                                                else ""
                        }
                    </ns0:order>
            }
            {
           	for $archiveOrder at $index in $getArchiveOrderListResponse/ns3:orders
           	where $index <= $balanceOrdersCount
            return
            <ns0:order>
               <ns0:orderNumber>{ data($archiveOrder/ns2:saleBTOrderNo) }</ns0:orderNumber>
               {
               if(data($archiveOrder/ns2:salePadNo)) then
		             <ns0:orderId>{ data($archiveOrder/ns2:salePadNo)  }</ns0:orderId>
		       else 
		            <ns0:orderId>{ data($configXml/Unknown) }</ns0:orderId>
		       }
               {
               if(data($archiveOrder/ns2:saleDealer1) = data($configXml/saleDealer1)) then
                    <ns0:orderType>{ data($configXml/orderTypeReplacement) }</ns0:orderType>
               else
               		<ns0:orderType>{ data($configXml/orderType) }</ns0:orderType>
               	}
                    <ns0:orderDate>{ concat(data($archiveOrder/ns2:orderDate),data($configXml/defaultTime)) }</ns0:orderDate>
                    {
                    if(data($archiveOrder/ns2:status)) then
	                    <ns0:orderStatus>{ fn:substring-after(data($archiveOrder/ns2:status),data($configXml/delimiterColon))}</ns0:orderStatus>
	                else
	                    <ns0:orderStatus>{ data($configXml/Unknown)}</ns0:orderStatus>
	                }
                    <ns0:isOrderArchive>{ data($configXml/TrueValue) }</ns0:isOrderArchive>
             </ns0:order>
             }
        </ns0:getOrderList_3Response>
         else if((fn:count($getArchiveOrderListResponse/*[2]) != data($configXml/ZeroValue)) and (fn:count($utilGetOrderListV4Resp/*[3]) = data($configXml/ZeroValue))) then
        <ns0:getOrderList_3Response>
            <ns0:totalOrders>{ data($getArchiveOrderListResponse/ns3:orderCount) }</ns0:totalOrders>
            {
            if(data($getArchiveOrderListResponse/ns2:orderCount) < $balanceOrdersCount) then
	            <ns0:ordersReturned>{ data($getArchiveOrderListResponse/ns3:orderCount) }</ns0:ordersReturned>
	        else 
	        	<ns0:ordersReturned>{ $balanceOrdersCount }</ns0:ordersReturned>
	        }
            {
           		for $archiveOrder at $index in $getArchiveOrderListResponse/ns3:orders
           		where $index <= $balanceOrdersCount
            	return
	            <ns0:order>
	               <ns0:orderNumber>{ data($archiveOrder/ns2:saleBTOrderNo) }</ns0:orderNumber>
	               {
	               if(data($archiveOrder/ns2:salePadNo)) then
			             <ns0:orderId>{ data($archiveOrder/ns2:salePadNo)  }</ns0:orderId>
			       else 
			            <ns0:orderId>{ data($configXml/Unknown) }</ns0:orderId>
			       }
	               {
	               if(data($archiveOrder/ns2:saleDealer1) = data($configXml/saleDealer1)) then
	                    <ns0:orderType>{ data($configXml/orderTypeReplacement) }</ns0:orderType>
	               else
	               		<ns0:orderType>{ data($configXml/orderType) }</ns0:orderType>
	               	}
	                    <ns0:orderDate>{ concat(data($archiveOrder/ns2:orderDate),data($configXml/defaultTime)) }</ns0:orderDate>
	                   if(data($archiveOrder/ns2:status))then
	                    <ns0:orderStatus>{ fn:substring-after(data($archiveOrder/ns2:status),data($configXml/delimiterColon))}</ns0:orderStatus>
	                    else
	                    <ns0:orderStatus>{ data($configXml/Unknown) }</ns0:orderStatus>
	                    <ns0:isOrderArchive>{ data($configXml/TrueValue) }</ns0:isOrderArchive>
	             </ns0:order>
             }
        </ns0:getOrderList_3Response>
        else 
        <ns0:getOrderList_3Response>
            <ns0:totalOrders>{ data($configXml/ZeroValue) }</ns0:totalOrders>
            <ns0:ordersReturned>{ data($configXml/ZeroValue) }</ns0:ordersReturned>
        </ns0:getOrderList_3Response>
};

declare variable $utilGetOrderListV4Resp as element() external;
declare variable $configXml as element(*) external;
declare variable $balanceOrdersCount as xs:integer external;
declare variable $getArchiveOrderListResponse as element(ns3:getArchiveOrderListResponse) external;

xf:ConstructGetOrderList_3RS($utilGetOrderListV4Resp,
    $getArchiveOrderListResponse,$configXml,$balanceOrdersCount)