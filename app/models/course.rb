#encoding: utf-8
class Course
  attr_accessor :name
  attr_accessor :cut

  def self.collection()
    list = [
        Course.new(:name => 'Вечерняя школа', :cut => 0 ),
        Course.new(:name => '1', :cut => 1 ),
        Course.new(:name => '2', :cut => 2 ),
        Course.new(:name => '3', :cut => 3 ),
        Course.new(:name => '4', :cut => 4 ),
        Course.new(:name => '5', :cut => 5 ),
        Course.new(:name => '6', :cut => 6 ),
        Course.new(:name => 'Аспирант', :cut => 7 )
    ]
    list
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

  def self.name_by_cut(cut)
    collection.each do |item|
      return value.name if item.cut == cut
    end
    false
  end

end