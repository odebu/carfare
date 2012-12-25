class Month < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :month, :year, :recognition_request, :recognition_state
  has_many :fares
  validates :month, :presence => true
  validates :year, :presence => true

  def self.find_fare_for_recognition
  	find(:all, :conditions => [ "recognition_request = ? and recognition_state = ?", true, 0])
  end

  def self.find_authorize_fare
  	find(:all, :conditions => [ "recognition_request = ? and recognition_state = ?", true, 1])
  end

  def self.find_rejection_fare
  	find(:all, :conditions => [ "recognition_request = ? and recognition_state = ?", true, 2])
  end

end
