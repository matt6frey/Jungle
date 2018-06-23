class UserMailer < ApplicationMailer
  def send_mail(user, order)
    @user = user
    @order = order
    @items = order.line_items
    @products = Product.find(@order.id)
    @rows = make_table(@items, @products)
    @total = total_cost(@rows)
    @subject = "Your Order ##{@order.id}"
    mail(to: @user.email, subject: @subject) do |format|
      format.html {render "mail"}
    end
  end

  def total_cost(order)
    total = 0
    order.each { |item|
      total += item["price"]
    }
    total
  end

  def make_table(items, products)
    formatted = []
    items = @order.line_items.where(order_id: @order.id)
    items.each { |item|
      product = Product.find(item.product_id)
      formatted.push({"name" => product.name, "qty" => item.quantity, "price" => (product.price_cents*item.quantity)})
    }
    formatted
  end
end
