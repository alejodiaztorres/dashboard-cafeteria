class DashboardController < ApplicationController
  def index

    @sales_grouped_by_month = Sale.group_by_month(:date_time, last: 12, current: false).order(date_time: :asc).sum(:amount)
    @quantity_grouped_by_month = Sale.group_by_month(:date_time, last: 12, current: false).order(date_time: :asc).sum(:quantity)
    @sales_prom_grouped_by_month = Sale.group_by_month(:date_time, last: 12, current: false).order(date_time: :asc).average(:amount)

    @quantity_sales_grouped_by_origin_12 = Product.includes(:sales).where(sales: {date_time: (12.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.origin, sum(sales.quantity)")
    @quantity_sales_grouped_by_origin_6 = Product.includes(:sales).where(sales: {date_time: (6.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.origin, sum(sales.quantity)")
    @quantity_sales_grouped_by_origin_3 = Product.includes(:sales).where(sales: {date_time: (3.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.origin, sum(sales.quantity)")
    @quantity_sales_grouped_by_origin_1 = Product.includes(:sales).where(sales: {date_time: (1.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.origin, sum(sales.quantity)")

    @quantity_sales_grouped_by_product_12 = Product.includes(:sales).where(sales: {date_time: (12.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")
    @quantity_sales_grouped_by_product_6 = Product.includes(:sales).where(sales: {date_time: (6.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")
    @quantity_sales_grouped_by_product_3 = Product.includes(:sales).where(sales: {date_time: (3.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")
    @quantity_sales_grouped_by_product_1 = Product.includes(:sales).where(sales: {date_time: (1.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")

  end



end
