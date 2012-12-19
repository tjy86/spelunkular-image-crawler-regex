# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  depth      :integer
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  # def self.images

  # end

end
