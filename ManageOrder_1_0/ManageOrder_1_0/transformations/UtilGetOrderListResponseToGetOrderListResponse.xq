(:: pragma bea:global-element-parameter parameter="$utilGetOrderListResponse" element="ns1:utilGetOrderListResponse" location="../../NorthBoundInterfaces/utilgetorderlistdata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOrderListResponse" location="../../NorthBoundInterfaces/manageorderdata_1_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 02/09/2009 		1.0.0 		Shashwati 		Initial version :)
(: 26/04/2010 		1.0.1 		Amit Kumar		Removed the DateTime Conevrsions as per the new SID :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_1_0/transformations/UtilGetOrderListResponseToGetOrderListResponse/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_1";
declare namespace ns1 = "http://soa.o2.co.uk/postpay/utilgetorderlistdata_1";

declare function xf:UtilGetOrderListResponseToGetOrderListResponse($utilGetOrderListResponse as element(ns1:utilGetOrderListResponse))
    as element(ns0:getOrderListResponse) {
        <ns0:getOrderListResponse>
            <ns0:totalOrders>{ data($utilGetOrderListResponse/ns1:totalOrders) }</ns0:totalOrders>
            <ns0:ordersReturned>{ data($utilGetOrderListResponse/ns1:ordersReturned) }</ns0:ordersReturned>
            {
             
                for $order in $utilGetOrderListResponse/ns1:order
                return
                    <ns0:order>
                        <ns0:orderNumber>{ data($order/ns1:orderNum) }</ns0:orderNumber>
                        <ns0:orderId>{ data($order/ns1:oid) }</ns0:orderId>
                        <ns0:orderType>{ data($order/ns1:orderType) }</ns0:orderType>
	                        {
	                            for $saleableProductName in $order/ns1:saleableProductName
	                            return
	                             if(data($saleableProductName))then
	                                <ns0:packageName>{ data($saleableProductName) }</ns0:packageName>
	                             else ''   
	                        }
                        <ns0:orderDate> {data($order/ns1:orderDate)}</ns0:orderDate>
                        <ns0:orderStatus>{ data($order/ns1:orderStatus) }</ns0:orderStatus>
                        <ns0:returnsOutstanding>{ data($order/ns1:returnsOutstanding) }</ns0:returnsOutstanding>
                        <ns0:partner>{ data($order/ns1:partner) }</ns0:partner>
                    </ns0:order>
               
            }
        </ns0:getOrderListResponse>
};

declare variable $utilGetOrderListResponse as element(ns1:utilGetOrderListResponse) external;

xf:UtilGetOrderListResponseToGetOrderListResponse($utilGetOrderListResponse)