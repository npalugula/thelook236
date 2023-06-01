view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
#I put an extra s and now the filter is not working. Is it the problem?
  dimension: test_bug {
    description: "Test filter bug"
    type: string
    sql:
        CASE (COALESCE(${category}, ${department}))
          WHEN 'Plus' then 'Grosse taile'
          WHEN 'MATERNITY' then 'marternité'
          when 'Suits' then 'Complet'
          when 'Underwear' then 'Sous-vêtements'
          when 'Sockss' then 'Chaussette'
        END;;
    group_label: "Hello world"
    alias: [vetement]

  }


  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
