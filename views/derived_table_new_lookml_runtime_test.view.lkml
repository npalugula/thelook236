view: derived_table_new_lookml_runtime_test {
  fields_hidden_by_default: yes

  derived_table: {
    sql:
    SELECT
   id,inventory_item_id,order_id  from ${order_items.SQL_TABLE_NAME} AS order_items
    where
    {% condition order_items.returned_date %} returned_date {% endcondition %};;

}

  dimension: Inventory_ID{
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: ID{
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: Order_ID{
    type: number
    sql: ${TABLE}.order_id ;;
  }


  }
