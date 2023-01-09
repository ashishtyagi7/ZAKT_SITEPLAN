//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Production order with STO data'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZAKT_PROD_STO_E_DD as select from ZAKT_PROD_ORD_E_DD as _prod
association[0..1] to ZAKT_STO_E_DD as _sto
on $projection.matnr = _sto.matnr {
@UI.hidden: true
key _prod.ordnum,
@UI.selectionField: [{ position:10}]
@UI.lineItem: [{position:10,importance:#HIGH}]
key _prod.matnr,
//@UI.selectionField: [{ position:20}]
    @UI.lineItem: [{position:20,importance:#HIGH }]
    _prod.ord_begda,
    @UI.lineItem: [{position:30,importance:#HIGH }]
    _prod.ord_endda,
        @UI.selectionField: [{ position:40}]
    @UI.lineItem: [{position:40,importance:#HIGH }]
    _sto.req_date as sto_req_date,
   // _sto.matnr as sto_matnr,
   @UI.lineItem: [{position:50,importance:#HIGH,label: 'Order Quantity' }]
    _prod.quantity,
   @UI.lineItem: [{position:60,importance:#HIGH,label: 'STO Quantity' }]
    _sto.quantity as sto_quan,
    @UI.dataFieldDefault: [{emphasized: true}]
     @UI.lineItem: [{position:70,importance:#HIGH,label: 'Quantity Diff(Order - STO)' }]
    _prod.quantity - _sto.quantity as quantity_diff,
    
    @UI.lineItem: [{position:71,importance:#HIGH  }]
    _sto.rec_plant,
    @UI.lineItem: [{position:72,importance:#HIGH }]
    _sto.sup_plant,
    @UI.lineItem: [{position:80,importance:#HIGH, label: 'Stock Transfer Order' }]
    _sto
    
}
