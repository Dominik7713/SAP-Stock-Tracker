@AbapCatalog.sqlViewName: 'ZSTOCK_CDS_DDL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for STOCK'
@Search.searchable: true
@Metadata.ignorePropagatedAnnotations: true
define view ZSTOCK_CDS as select from zstock_data_fin as d
left outer join zstock_data_rat as r 
    on d.zstock_ticker = r.zstock_ticker
{

  @UI.lineItem: [{ position: 10, label: 'Ticker Symbol' }]
  @UI.selectionField: [{ position: 10 }]
  key d.zstock_ticker,

  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8
  @UI.lineItem: [{ position: 20, label: 'Company Name' }]
  d.zstock_name,
  
  @UI.lineItem: [{ position: 30, label: 'Rating', criticality: 'RatingColor', criticalityRepresentation: #WITHOUT_ICON }]
  r.zstock_rating,

  @UI.lineItem: [{ position: 40, label: 'Current Price',criticality: 'PriceColor', criticalityRepresentation: #WITHOUT_ICON}]
  @Semantics.amount.currencyCode: 'zstock_currency'
  d.zstock_price,

  @UI.hidden: true
  d.zstock_currency,

  @UI.lineItem: [{ position: 50, label: 'Change %',criticality: 'ChangeColor', criticalityRepresentation: #WITHOUT_ICON }]
  cast( d.zstock_changepct * 100 as abap.dec( 10, 2 ) ) as ChangePercent,
  
  @UI.lineItem: [{ position: 60, label: 'Open Price' }]
  d.zstock_priceopen,
  
  @UI.lineItem: [{ position: 70, label: 'Close Yesterday' }]
  d.zstock_closeyest,
  
  @UI.lineItem: [{ position: 80, label: 'High' }]
  d.zstock_high,
  
  case
    when d.zstock_price >= d.zstock_closeyest then 3 
    else 1
  end as PriceColor,
  
    case
     when d.zstock_changepct > 0 then 3
     else 1
    end as ChangeColor,
    
    case
        when r.zstock_rating = 'Buy' then 3
        when r.zstock_rating = 'Sell' then 1
        else 0
    end as RatingColor
  
  
}
