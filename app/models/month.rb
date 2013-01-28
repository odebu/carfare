class Month < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :month, :year, :recognition_request, :recognition_state
  has_many :fares
  validates :month, :presence => true
  validates :year, :presence => true

  # 承認依頼一覧
  def self.find_fare_for_recognition
  	find(:all, 
         :conditions => [ "recognition_request = ? and recognition_state = ?", true, 0],
         :order => "year, month")
  end

  # 承認済一覧
  def self.find_authorize_fare
  	find(:all, :conditions => [ "recognition_request = ? and recognition_state = ?", true, 1])
  end

  # 差し戻し一覧
  def self.find_rejection_fare
  	find(:all, :conditions => [ "recognition_state = ?", 2])
  end

end
