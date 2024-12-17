update menu
set price = trunc((price - (price/100 * 10)), 0)
where pizza_name = 'Greek pizza';
