class Order < ApplicationRecord

  enum status: { shipping_in_process: 0, shipping_completed: 1 }

end
