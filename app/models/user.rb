class User < ApplicationRecord
    has_many :scores, dependent: :destroy

    validates :name, uniqueness: { case_sensitive: false }
    validates :name, presence: :true
    validate :name_cannot_be_admin

    def name_cannot_be_admin
        if self.name.downcase == 'admin'
            errors.add(:name, "cannot be 'admin'")
        end
    end

end
