xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$utilGetOrderDetailsResp" type="ns0:companionMessage/ns0:utilGetOrderDetailsResp" location="../../SouthBoundInterfaces/cuk/ICD375/SOA_WMQIServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:referenceDetails" location="../../NorthBoundInterfaces/referencedetailsdata_1_0.xsd" ::)


(: 10/02/2016 		1.0.0		Dolly K 			Initial version :)

(: 25/05/2016 		1.0.1		Subra Bose 			refering utilGetOrderDetailsResp instead of utilGetOrderDetailsV5Resp as part of Global care and Running :)
declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/UtilGetOrderDetailsRespToReferenceDetailServiceRQ/";
declare namespace ns2 = "http://companion.eai.o2c.ibm.com";
declare namespace ns1 = "http://soa.o2.co.uk/product/referencedetailsdata_1";
declare namespace ns0 = "http://WMQIServices.eai.o2c.ibm.com";

declare function xf:UtilGetOrderDetailsRespToReferenceDetailServiceRQ($utilGetOrderDetailsResp as element(),
$configXML as element(*))
    as element(ns1:referenceDetails) {
            <ns1:referenceDetails>
         <ns1:referenceOperation>{ data($configXML/ReferenceDetailsOperations/BoltonsById) }</ns1:referenceOperation>
        <ns1:referenceData>
         { fn-bea:serialize(  		
        <params>

<tariffDetailsByLongProdIds>
{
let $codes := xf:TarrifProductId($utilGetOrderDetailsResp)
for $code in distinct-values(data($codes/Code))
return

   <tariff>

      <tariffId>{data($code)}</tariffId>

   </tariff>
   
}
</tariffDetailsByLongProdIds>

<boltonDetailsByLongProdIds>
{
let $codes := xf:GetProductId($utilGetOrderDetailsResp)
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

</ns1:referenceData>
</ns1:referenceDetails>
};						  
declare function xf:GetProductId($utilGetOrderDetailsResp as element(ns0:utilGetOrderDetailsResp)) as element(*) {
		<Codes>
		{
		for $uGOD_SaleProd in $utilGetOrderDetailsResp/ns0:uGOD_SaleProd
return
if(data($uGOD_SaleProd/ns0:uGOD_AssignedProduct))then
if(data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_POT))then
if (data($uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_POT/ns0:uGOD_TAM))then

			for $productId in  $uGOD_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_POT/ns0:uGOD_TAM
			return
								
						
				<Code>{data($productId/ns2:productId) }</Code>
					
				else ""
				else ""
				else ""		
		}		 
		</Codes>											  
};

declare function xf:TarrifProductId($utilGetOrderDetailsResp as element(ns0:utilGetOrderDetailsResp)) as element(*) {
		<Codes>
		{
		for $uGODV_SaleProd in $utilGetOrderDetailsResp/ns0:uGOD_SaleProd
return
if(data($uGODV_SaleProd/ns0:uGOD_AssignedProduct))then
if (data($uGODV_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_POT))then
								
						
				<Code>{data($uGODV_SaleProd/ns0:uGOD_AssignedProduct/ns0:uGOD_POT/ns2:productId) }</Code>
					
				else ""
				else ""
						
		 }		 
	</Codes>											  
};


declare variable $utilGetOrderDetailsResp as element() external;
declare variable $configXML as element(*) external;

xf:UtilGetOrderDetailsRespToReferenceDetailServiceRQ($utilGetOrderDetailsResp,$configXML)