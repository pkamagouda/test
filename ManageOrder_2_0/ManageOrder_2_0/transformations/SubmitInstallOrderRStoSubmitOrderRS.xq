(:: pragma bea:global-element-parameter parameter="$submitInstallOrderResponse" element="ns1:submitInstallOrderResponse" location="../../NorthBoundInterfaces/submitinstallorderdata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:submitOrderResponse" location="../../NorthBoundInterfaces/manageorderdata_2_0.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/ManageOrder_2_0/transformations/SubmitInstallOrderRStoSubmitOrderRS/";
declare namespace ns0 = "http://soa.o2.co.uk/manageorderdata_2";
declare namespace ns1 = "http://soa.o2.co.uk/submitinstallorderdata_1";

(: # Date # 	# Version # 	# Author # 		# Change Description # :)
(: 30/03/2010 		2.0.0 		Amit Kumar 			Initial version :)

declare function xf:SubmitInstallOrderRStoSubmitOrderRS($submitInstallOrderResponse as element(ns1:submitInstallOrderResponse))
    as element(ns0:submitOrderResponse) {
        <ns0:submitOrderResponse>
            {
                let $responseHeader := $submitInstallOrderResponse/ns1:responseHeader
                return
                    <ns0:responseHeader>
                        <ns0:orderNumber>{ data($responseHeader/ns1:orderNumber) }</ns0:orderNumber>
                        <ns0:orderTimestamp>{ data($responseHeader/ns1:orderTimestamp) }</ns0:orderTimestamp>
                    </ns0:responseHeader>
            }
            <ns0:acceptStatus>{ data($submitInstallOrderResponse/ns1:acceptStatus) }</ns0:acceptStatus>
            {
                if (data($submitInstallOrderResponse/ns1:ruleOutcome)) then
                let $ruleOutcome := $submitInstallOrderResponse/ns1:ruleOutcome
                return
                    <ns0:ruleOutcome>
                        <ns0:ruleValidateCheck>{ data($ruleOutcome/ns1:ruleValidateCheck) }</ns0:ruleValidateCheck>
                        <ns0:ruleValidationString>{ data($ruleOutcome/ns1:ruleValidationString) }</ns0:ruleValidationString>
                    </ns0:ruleOutcome>
               	else ""
            }
        </ns0:submitOrderResponse>
};

declare variable $submitInstallOrderResponse as element(ns1:submitInstallOrderResponse) external;

xf:SubmitInstallOrderRStoSubmitOrderRS($submitInstallOrderResponse)