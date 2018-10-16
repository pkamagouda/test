xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsV5Resp" type="ns1:companionMessage/ns1:utilGetOrderDetailsV5Resp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns0:referenceDetails" location="../../NorthBoundInterfaces/referencedetailsdata_1_0.xsd" ::)

(: 10/02/2016 		1.0.0		Dolly K 			Initial version :)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/UtilGetOrderDetailsV5RespToReferenceDetailServiceRQ/";
declare namespace ns0 = "http://soa.o2.co.uk/product/referencedetailsdata_1";
declare namespace ns1 = "http://WMQIServices.eai.o2c.ibm.com";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";

declare function xf:UtilGetOrderDetailsV5RespToReferenceDetailServiceRQ($utilGetOrderDetailsV5Resp as element(),$configXML as element(*))
    as element(ns0:referenceDetails) {
        <ns0:referenceDetails>
         <ns0:referenceOperation>{ data($configXML/ReferenceDetailsOperations/BoltonsById) }</ns0:referenceOperation>
        <ns0:referenceData>
         { fn-bea:serialize(  		
        <params>

<tariffDetailsByLongProdIds>
{
let $codes := xf:TarrifProductId($utilGetOrderDetailsV5Resp)
for $code in distinct-values(data($codes/Code))
return

   <tariff>

      <tariffId>{data($code)}</tariffId>

   </tariff>
   
}
</tariffDetailsByLongProdIds>

<boltonDetailsByLongProdIds>
{
let $codes := xf:GetProductId($utilGetOrderDetailsV5Resp)
for $code in distinct-values(data($codes/Code))
return
   
   
   <bolton>

       <boltonId> 
       {data($code)}   
       
       </boltonId>
    </bolton>

   
}
</boltonDetailsByLongProdIds>

</params>)}

</ns0:referenceData>
</ns0:referenceDetails>
};

declare function xf:GetProductId($utilGetOrderDetailsV5Resp as element(ns1:utilGetOrderDetailsV5Resp)) as element(*) {
		<Codes>
		{
		for $uGODV5_SaleProd in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd
return
if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct))then
if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT))then
if (data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM))then

			for $productId in  $uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns1:uGODV5_TAM
			return
								
						
				<Code>{data($productId/ns2:productId) }</Code>
					
				else ""
				else ""
				else ""		
		}		 
		</Codes>											  
};

declare function xf:TarrifProductId($utilGetOrderDetailsV5Resp as element(ns1:utilGetOrderDetailsV5Resp)) as element(*) {
		<Codes>
		{
		for $uGODV5_SaleProd in $utilGetOrderDetailsV5Resp/ns1:uGODV5_SaleProd
return
if(data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct))then
if (data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT))then
								
						
				<Code>{data($uGODV5_SaleProd/ns1:uGODV5_AssignedProduct/ns1:uGODV5_POT/ns2:productId) }</Code>
					
				else ""
				else ""
						
		 }		 
	</Codes>											  
};

declare variable $utilGetOrderDetailsV5Resp as element() external;
declare variable $configXML as element(*) external;

xf:UtilGetOrderDetailsV5RespToReferenceDetailServiceRQ($utilGetOrderDetailsV5Resp,$configXML)