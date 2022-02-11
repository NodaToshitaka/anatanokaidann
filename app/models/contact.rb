class Contact < ApplicationRecord
  enum subject: {"お問い合わせ": 0,  "ご意見、ご要望": 1, "通報": 2, "その他要件": 3}
end
