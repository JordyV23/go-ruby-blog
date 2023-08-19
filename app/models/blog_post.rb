class BlogPost < ApplicationRecord
    #Valida que el titulo y el cuerpo no esten vacios
    validates :title, presence: true
    validates :body, presence: true

end
