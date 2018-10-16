(:: pragma bea:global-element-parameter parameter="$getArchiveOrderDetailsResponse" element="ns2:getArchiveOrderDetailsResponse" location="../../SouthBoundInterfaces/order100/orderenquirydata_1_0.xsd" ::)
(:: pragma  parameter="$configXml" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getOrderDetails_2Response" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 28/03/2011 		2.0.0 		Pronisa Baruah  	Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/GetArchiveOrderDetailsRSToGetOrderDetails_2RS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/pscommonpostpaydata_2";
declare namespace ns2 = "http://soa.o2.co.uk/orderenquirydata_1";

declare function xf:GetArchiveOrderDetailsRSToGetOrderDetails_2RS($getArchiveOrderDetailsResponse as element(ns2:getArchiveOrderDetailsResponse),
    $configData as element(*))
    as element(ns0:getOrderDetails_2Response) {
        let $order := $getArchiveOrderDetailsResponse/ns2:orders/ns2:order[1]
    	let $getOrderDetailsConfigData := $configData/getOrderDetails
        return
        <ns0:getOrderDetails_2Response>
        	{
        	if(data($getArchiveOrderDetailsResponse/ns2:retrievalStatus) = data($getOrderDetailsConfigData/orderEnquiryWarningCode)) then
        		<ns0:responseCode>{data($getOrderDetailsConfigData/warningCode)}</ns0:responseCode>
        	else
        		<ns0:responseCode>{data($getOrderDetailsConfigData/successCode)}</ns0:responseCode>
        	}
            <ns0:orderHeaderDetails>
                <ns0:orderNumber>{ data($order/ns2:saleBTOrderNo) }</ns0:orderNumber>
                <ns0:orderDate>{ xs:date( data($order/ns2:orderDate) ) }</ns0:orderDate>
                {
                if(data($order/ns2:saleDealer1) = data($configData/saleDealer1)) then
	                <ns0:orderType>{ data($configData/orderTypeReplacement) }</ns0:orderType>
	            else 
	            	<ns0:orderType>{ data($configData/orderType) }</ns0:orderType>
                }
                <ns0:isOrderArchive>{ data($configData/TrueValue) }</ns0:isOrderArchive>
                <ns0:sourceOfSale>{ data($configData/Online) }</ns0:sourceOfSale>
                {
                if(data($order/ns2:status)) then
	                <ns0:orderStatus>{ fn:substring-after(data($order/ns2:status),data($configData/delimiterColon)) }</ns0:orderStatus>
	            else
	            	<ns0:orderStatus>{ data($configData/Unknown) }</ns0:orderStatus>
	            }
	            <ns0:portalRegisterationDetails>
                    <ns1:portalUserId>{ data($configData/Unknown) }</ns1:portalUserId>
                    <ns1:portalDomain>{ data($configData/Unknown) }</ns1:portalDomain>
                </ns0:portalRegisterationDetails>
                <ns0:customerTier>{ data($configData/Unknown) }</ns0:customerTier>
                {
                if(data($order/ns2:invoiceAmount)) then
                	<ns0:orderTotalAmount>{ xs:integer( data($order/ns2:invoiceAmount) ) }</ns0:orderTotalAmount>
                else ''
                }
                {
                    if(data($order/ns2:saleOrigOrder)) then
                        <ns0:linkedOrderNum>{ data($order/ns2:saleOrigOrder) }</ns0:linkedOrderNum>
                    else ''
                }
                {
                if(data($order/ns2:consignmentNo) or data($order/ns2:carrier) or data($order/ns2:lineItem[1]/ns2:despatchTime)) then
	                <ns0:actualDeliveryDetails>
	                    {
	                        if(data($order/ns2:consignmentNo)) then
	                            <ns0:consignmentNumber>{ data($order/ns2:consignmentNo) }</ns0:consignmentNumber>
	                        else ''
	                    }
	                    {
	                        if(data($order/ns2:carrier)) then
	                            <ns0:courierDeliveryOrder>{ data($order/ns2:carrier) }</ns0:courierDeliveryOrder>
	                        else ''
	                    }
	                    {
	                        if(data($order/ns2:lineItem[1]/ns2:despatchTime)) then
	                            <ns0:despatchDate>{ fn:substring-before(data($order/ns2:lineItem[1]/ns2:despatchTime),data($getOrderDetailsConfigData/delimiterT))  }</ns0:despatchDate>
	                        else ''
	                    }
	                </ns0:actualDeliveryDetails>
	            else ''
	            }
	            <ns0:vatTotal>{ data($configData/ZeroValue) }</ns0:vatTotal>
            </ns0:orderHeaderDetails>
            <ns0:orderDetails>
            {
            for $lineItem in $order/ns2:lineItem
            return
                <ns0:package>
                    <ns0:orderLineKey>
                    {
                    	if(data($order/ns2:salePadNo)) then
                        	<ns1:orderId>{ data($order/ns2:salePadNo) }</ns1:orderId>
                    	else ''
                    }
                    </ns0:orderLineKey>
                    <ns0:item>
                        <ns0:orderLineKey>
                        	{
                        		if(data($order/ns2:salePadNo)) then
		                            <ns1:orderId>{ data($order/ns2:salePadNo) }</ns1:orderId>
		                        else ''
		                    }
                        </ns0:orderLineKey>
                        {
                        if(data($lineItem/ns2:productCode)) then
                        	<ns0:itemId>{ fn:concat($lineItem/ns2:productCode , $lineItem/ns2:condition) }</ns0:itemId>
                        else
                        	<ns0:itemId>{ data($configData/Unknown) }</ns0:itemId>
                        }
                        {
                        if(data($lineItem/ns2:prodDescription)) then
                        	<ns0:itemName>{ data($lineItem/ns2:prodDescription) }</ns0:itemName>
                        else
                        	<ns0:itemName>{ data($configData/Unknown) }</ns0:itemName>
                        }
                        <ns0:change>{ data($configData/AddedItem) }</ns0:change>
                        {
                            for $imeiProductType in $getOrderDetailsConfigData/imeiProductType/productType
                            return
                            if(fn:substring-before(data($lineItem/ns2:productType),data($configData/delimiterColon)) = $imeiProductType and data($lineItem/ns2:serialNo)) then
                                <ns0:imei>{ data($lineItem/ns2:serialNo) }</ns0:imei>
                            else ''
                        }
                        {
                            if(data($lineItem/ns2:mobileNo)) then
                                <ns0:msisdn>{ data($lineItem/ns2:mobileNo) }</ns0:msisdn>
                            else ''
                        }
                        {
                            for $ssnProductType in $getOrderDetailsConfigData/ssnProductType/productType
                            return
                            if(fn:substring-before(data($lineItem/ns2:productType),data($configData/delimiterColon)) = $ssnProductType and data($lineItem/ns2:serialNo)) then
                                <ns0:ssn>{ data($lineItem/ns2:serialNo) }</ns0:ssn>
                            else ''
                        }
                        {
							if(((data($getOrderDetailsConfigData/serialNoProductType[productType = fn:substring-before(data($lineItem/ns2:productType),data($configData/delimiterColon))])) or (not(fn:substring-before(data($lineItem/ns2:productType),data($configData/delimiterColon)) = data($getOrderDetailsConfigData/productTypeToCategoryMappings/productTypeToCategoryMapping/productTypes/productType)))) and data($lineItem/ns2:serialNo)) then
								<ns0:serialNo>{ data($lineItem/ns2:serialNo) }</ns0:serialNo>
							else ''
						}
						{
							if(fn:substring-before(data($lineItem/ns2:productType),data($configData/delimiterColon)) = data($getOrderDetailsConfigData/productTypeToCategoryMappings/productTypeToCategoryMapping/productTypes/productType)) then
								for $productTypeToCategoryMapping in $getOrderDetailsConfigData/productTypeToCategoryMappings/productTypeToCategoryMapping
								for $productType in $productTypeToCategoryMapping/productTypes/productType
								where data($productType) = fn:substring-before(data($lineItem/ns2:productType),data($configData/delimiterColon))
								return
									<ns0:category>{ data($productTypeToCategoryMapping/category) }</ns0:category>
							else
								<ns0:category>{ 'MISC' }</ns0:category>
						}

                    </ns0:item>
                    <ns0:vatExclusivePrice>{ xs:integer( data($lineItem/ns2:linePrice) ) }</ns0:vatExclusivePrice>
                </ns0:package>
                }
                <ns0:VATReceiptRequired>{ data($configData/Yes) }</ns0:VATReceiptRequired>
            </ns0:orderDetails>
            {
	            if(data($order/ns2:paymentType) or data($order/ns2:invoiceDate) or data($order/ns2:saleAccountCode)) then
		            <ns0:oneOffPaymentDetails>
		                {
		                    for $paymentTypeToPaymentMethodMapping in $getOrderDetailsConfigData/paymentTypeToPaymentMethodMappings/paymentTypeToPaymentMethodMapping
		                    return 
		                    if($paymentTypeToPaymentMethodMapping/paymentType = data($order/ns2:paymentType)) then
		                        <ns0:paymentMethod>{ data($paymentTypeToPaymentMethodMapping/paymentMethod) }</ns0:paymentMethod>
		                    else ''
		                }
		                {
		                    if(data($order/ns2:invoiceDate)) then
		                        <ns0:paymentSettledDate>{ data($order/ns2:invoiceDate) }</ns0:paymentSettledDate>
		                    else ''
		                }
		                {
		                    if(data($order/ns2:saleAccountCode)) then
		                        <ns0:billingAccountNumber>{ data($order/ns2:saleAccountCode) }</ns0:billingAccountNumber>
		                    else ''
		                }
		            </ns0:oneOffPaymentDetails>
	            else ''
            }
            <ns0:deliveryDetails>
            	{
            	if(data($order/ns2:shipToName)) then
               		<ns0:name>{ data($order/ns2:shipToName) }</ns0:name>
               	else
               		<ns0:name>{ data($configData/Unknown) }</ns0:name>
               	}
                <ns0:basicAddress>
                    {
                        if(data($order/ns2:shipToAdd1)) then
                            <ns0:addressLine1>{ data($order/ns2:shipToAdd1) }</ns0:addressLine1>
                        else ''
                    }
                    {
                        if(data($order/ns2:shipToAdd2)) then
                            <ns0:addressLine2>{ data($order/ns2:shipToAdd2) }</ns0:addressLine2>
                        else ''
                    }
                    {
                        if(data($order/ns2:shipToAdd3)) then
                            <ns0:addressLine3>{ data($order/ns2:shipToAdd3) }</ns0:addressLine3>
                        else ''
                    }
                    {
                        if(data($order/ns2:shipToAdd4)) then
                            <ns0:addressLine4>{ data($order/ns2:shipToAdd4) }</ns0:addressLine4>
                        else ''
                    }
                    <ns0:country>{ data($configData/countryNameGeographical) }</ns0:country>
                    {
                    	if(data($order/ns2:shipToPostCode)) then
                    		<ns0:postCode>{ data($order/ns2:shipToPostCode) }</ns0:postCode>
                    	else 
                    		<ns0:postCode>{ data($configData/Unknown) }</ns0:postCode>
                    }
                </ns0:basicAddress>
            </ns0:deliveryDetails>
        </ns0:getOrderDetails_2Response>
};

declare variable $getArchiveOrderDetailsResponse as element(ns2:getArchiveOrderDetailsResponse) external;
declare variable $configData as element(*) external;

xf:GetArchiveOrderDetailsRSToGetOrderDetails_2RS($getArchiveOrderDetailsResponse,
    $configData)