(:: pragma bea:global-element-parameter parameter="$utilGetOrderList_2Response" element="ns1:utilGetOrderList_2Response" location="../../NorthBoundInterfaces/utilgetorderlistdata_1_0.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getArchiveOrderListResponse" element="ns2:getArchiveOrderListResponse" location="../../SouthBoundInterfaces/order100/orderenquirydata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderList_2Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 25/03/2011 		2.0.0 		Pronisa Baruah  	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/ConstructGetOrderList_2RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderlistdata_1";
declare namespace ns2 = "http://soa.o2.co.uk/orderenquirydata_1";

declare function xf:ConstructGetOrderList_2RS($utilGetOrderList_2Response as element(ns1:utilGetOrderList_2Response),
    $getArchiveOrderListResponse as element(ns2:getArchiveOrderListResponse),
    $configXml as element(*),
    $balanceOrdersCount as xs:integer)
    as element(ns0:getOrderList_2Response) {
        if((fn:count(data($getArchiveOrderListResponse/*[2])) = data($configXml/ZeroValue)) and (fn:count($utilGetOrderList_2Response/*[3]) != data($configXml/ZeroValue))) then
        <ns0:getOrderList_2Response>
            <ns0:totalOrders>{ data($utilGetOrderList_2Response/ns1:totalOrders) }</ns0:totalOrders>
            <ns0:ordersReturned>{ data($utilGetOrderList_2Response/ns1:ordersReturned) }</ns0:ordersReturned>
            {
                for $order in $utilGetOrderList_2Response/ns1:order
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
        </ns0:getOrderList_2Response>
        else if((fn:count($getArchiveOrderListResponse/*[2]) != data($configXml/ZeroValue)) and (fn:count($utilGetOrderList_2Response/*[3]) != data($configXml/ZeroValue))) then
        <ns0:getOrderList_2Response>
            <ns0:totalOrders>{ xs:integer(data($utilGetOrderList_2Response/ns1:totalOrders) + data($getArchiveOrderListResponse/ns2:orderCount)) }</ns0:totalOrders>
            {
            if(data($getArchiveOrderListResponse/ns2:orderCount) < $balanceOrdersCount) then
	            <ns0:ordersReturned>{ xs:integer(data($utilGetOrderList_2Response/ns1:ordersReturned) + data($getArchiveOrderListResponse/ns2:orderCount)) }</ns0:ordersReturned>
	        else 
	        	<ns0:ordersReturned>{ xs:integer(data($utilGetOrderList_2Response/ns1:ordersReturned) + $balanceOrdersCount) }</ns0:ordersReturned>
	        }
			{
               for $order in $utilGetOrderList_2Response/ns1:order 
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
           	for $archiveOrder at $index in $getArchiveOrderListResponse/ns2:orders
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
        </ns0:getOrderList_2Response>
        else if((fn:count($getArchiveOrderListResponse/*[2]) != data($configXml/ZeroValue)) and (fn:count($utilGetOrderList_2Response/*[3]) = data($configXml/ZeroValue))) then
        <ns0:getOrderList_2Response>
            <ns0:totalOrders>{ data($getArchiveOrderListResponse/ns2:orderCount) }</ns0:totalOrders>
            {
            if(data($getArchiveOrderListResponse/ns2:orderCount) < $balanceOrdersCount) then
	            <ns0:ordersReturned>{ data($getArchiveOrderListResponse/ns2:orderCount) }</ns0:ordersReturned>
	        else 
	        	<ns0:ordersReturned>{ $balanceOrdersCount }</ns0:ordersReturned>
	        }
            {
           		for $archiveOrder at $index in $getArchiveOrderListResponse/ns2:orders
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
	                    <ns0:orderStatus>{ fn:substring-after(data($archiveOrder/ns2:status),data($configXml/delimiterColon))}</ns0:orderStatus>
	                    <ns0:isOrderArchive>{ data($configXml/TrueValue) }</ns0:isOrderArchive>
	             </ns0:order>
             }
        </ns0:getOrderList_2Response>
        else 
        <ns0:getOrderList_2Response>
            <ns0:totalOrders>{ data($configXml/ZeroValue) }</ns0:totalOrders>
            <ns0:ordersReturned>{ data($configXml/ZeroValue) }</ns0:ordersReturned>
        </ns0:getOrderList_2Response>
};

declare variable $utilGetOrderList_2Response as element(ns1:utilGetOrderList_2Response) external;
declare variable $getArchiveOrderListResponse as element(ns2:getArchiveOrderListResponse) external;
declare variable $configXml as element(*) external;
declare variable $balanceOrdersCount as xs:integer external;

xf:ConstructGetOrderList_2RS($utilGetOrderList_2Response,
    $getArchiveOrderListResponse,
    $configXml,
    $balanceOrdersCount)