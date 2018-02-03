require 'watir_pump'

require_relative 'base_page'

class CalculatorPage < BasePage
  uri '/calculator.html{?query*}'
  text_field :operand1, id: 'operand1'
  text_field :operand2, id: 'operand2'
  button :btn_add, id: 'op_add'
  button :btn_sub, id: 'op_sub'
  button :btn_mul, id: 'op_mul'
  button :btn_div, id: 'op_div'
  button :btn_reset, id: 'reset'
  div :result_div, id: 'result'
  query :result2, -> { result_div.text.to_i }
  query :result, -> { browser.div(id: 'result').text.to_i }
  query :reset, -> { btn_reset.click }

  def add(a, b)
    operand1.set a
    operand2.set b
    btn_add.click
    result_div.wait_until { |el| el.text.match(/\d/) }
  end

  def sub(a, b)
    operand1.set a
    operand2.set b
    btn_sub.click
    result_div.wait_until { |el| el.text.match(/\d/) }
  end
end
