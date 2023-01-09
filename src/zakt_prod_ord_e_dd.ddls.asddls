//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity for Production Order'
define view entity ZAKT_PROD_ORD_E_DD as select from zakt_prod_ord as _prod {
    key _prod.ordnum,
    key _prod.matnr,
        _prod.quantity,
        _prod.ord_begda,
        _prod.ord_endda
        
}
