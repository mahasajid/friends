class Friend < ApplicationRecord

    has_many :friends_with, class_name: "Friend", foreign_key: "friends_with_id"
    belongs_to :friends_with, class_name: "Friend", optional: true
    belongs_to :account
    validates :first_name,presence: true
    validates :last_name, presence:true
    before_save do |friend| 
        friend.first_name=friend.first_name.titleize
    end

    #model call back

    # def capitalise
    #     @friend.upcase!
    # end
end
