#encoding: utf-8
class Faculty
  attr_accessor :name
  attr_accessor :cut

  def self.collection()
    list = [
        Faculty.new(:name => 'ФВТ', :cut => 0 ),
        Faculty.new(:name => 'Вечерний', :cut => 1 ),
        Faculty.new(:name => 'Заочный', :cut => 2 ),
        Faculty.new(:name => 'ФХА', :cut => 3 )
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