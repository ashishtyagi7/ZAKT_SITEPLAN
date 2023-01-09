@AbapCatalog.sqlViewName: 'ZAKTPRODORDDD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Production Order Interface view DD'
@Metadata.allowExtensions: true
define root view ZAKT_PROD_ORD_DD as select from zakt_prod_ord {
//@UI.facet: [{type: #IDENTIFICATION_REFERENCE,
 //            label: 'Production Order Data',
 //            purpose: #STANDARD }]
 @UI.lineItem: [{position:10,importance:#HIGH,label: 'Order Number' }]
//@UI.identification: [{position: 1 }]
    key ordnum ,
    @UI.lineItem: [{position:20,importance:#HIGH,label: 'Material' }]    
    key matnr ,
    quantity ,
    ord_begda ,
    ord_endda 
}
