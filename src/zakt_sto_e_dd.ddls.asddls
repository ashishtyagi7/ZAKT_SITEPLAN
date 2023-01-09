//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STO Entity Data definition'
define view entity ZAKT_STO_E_DD as select from zakt_sto_data as _sto
//association to parent ZAKT_PROD_STO_E_DD as _siteplan on
//$projection.matnr = _siteplan.matnr
{
@UI.facet: [{type: #IDENTIFICATION_REFERENCE,
            label: 'Stock Transfer Order Data',
            purpose: #STANDARD }]
@UI.lineItem: [{position:10,importance:#HIGH,label: 'STO Number' }]
key _sto.stonum,
@UI.lineItem: [{position:10,importance:#HIGH,label: 'Material' }]
key _sto.matnr,
@UI.lineItem: [{position:10,importance:#HIGH }]
    _sto.quantity,
    @UI.lineItem: [{position:10,importance:#HIGH }]
    _sto.req_date,
    @UI.lineItem: [{position:10,importance:#HIGH }]
    _sto.rec_plant,
    @UI.lineItem: [{position:10,importance:#HIGH,label: 'Supp Plant' }]
    _sto.sup_plant
    //@UI.hidden: true
   // _siteplan.quantity as quan,

    
}
