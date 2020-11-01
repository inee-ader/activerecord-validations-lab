class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be Fiction or Non-Fiction" }
    validate :clickbait_title

    ARR = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    def clickbait_title
        if ARR.none?{|pattern| pattern.match title}
            errors.add(:title, "Title must include click-bait phrases")
        end
    end

    # def clickbait_title 
    #     if number.integer? == true && !title.include?("Won't Believe", "Secret", "Top #{number}", "Guess")
    #         errors.add(:title, "Title must include click-bait phrases")
    #     end
    # end
end
