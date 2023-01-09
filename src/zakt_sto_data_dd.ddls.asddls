@AbapCatalog.sqlViewName: 'ZAKTSTODATADD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Stock Transfer Order Interface'
define root view ZAKT_STO_DATA_DD as select from zakt_sto_data {
//@UI.facet: [{type: #IDENTIFICATION_REFERENCE,
 //            label: 'Stock Transfer Order Data',
 //            purpose: #STANDARD }]
    @UI.lineItem: [{position:10,importance:#HIGH}] 
    key stonum ,
    @UI.lineItem: [{position:20,importance:#HIGH,label: 'Material' }] 
    key matnr ,
    @UI.lineItem: [{position:30,importance:#HIGH}] 
    quantity ,
    @UI.lineItem: [{position:40,importance:#HIGH}] 
    req_date,
    @UI.lineItem: [{position:50,importance:#HIGH}] 
    sup_plant ,
    @UI.lineItem: [{position:60,importance:#HIGH}] 
    rec_plant 
}
