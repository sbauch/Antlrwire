class FanPage < ActiveRecord::Base
  #Associations
  belongs_to :user
  
  #validations
  validates :url, :presence => true
  
  validates :url, :uniqueness => { :scope => :user_id,
      :notice => "Already added this page" }
  
  #scopes
  default_scope :order => 'updated_at DESC'
end
