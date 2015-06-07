class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :identify
  belongs_to :personaldoc
  belongs_to :education
  belongs_to :unifiedexam
  belongs_to :educationform

  def generatedocs
  	book = Spreadsheet.open "#{Rails.root}/templatebakalavriat.xls"
	sheet = book.worksheet 0
	sheet.each do |row|
		sheet.rows[4][6] = "#{self.personaldoc.first_name}"
		sheet.rows[5][6] = "#{self.personaldoc.second_name}"
		sheet.rows[6][6] = "#{self.personaldoc.third_name}"
		sheet.rows[7][7] = "#{self.identify.birthday}"
		sheet.rows[4][31] = "#{self.identify.country}"
		sheet.rows[5][45] = "#{self.identify.type_id}"
		sheet.rows[6][38] = "#{self.identify.series}"
		sheet.rows[6][45] = "#{self.identify.number}"
		sheet.rows[7][29] = "#{self.identify.issued_by}"
		sheet.rows[27][0] = "Русский"
		sheet.rows[27][13] = "#{self.unifiedexam.russian}"
		sheet.rows[28][0] = "Математика"
		sheet.rows[28][13] = "#{self.unifiedexam.math}"
		sheet.rows[29][0] = "Физика"
		sheet.rows[29][13] = "#{self.unifiedexam.physics}"
		sheet.rows[30][0] = "Обществознание"
		sheet.rows[30][13] = "#{self.unifiedexam.social_science}"
		sheet.rows[33][22] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 
		sheet.rows[80][0] = DateTime.now
	end
	doclink = "#{Rails.root}/public/xlsdocs/#{Time.now.strftime("%y%m%d_%3s")}_#{self.personaldoc.first_name}_#{self.personaldoc.second_name}.xls"
	book.write doclink
	doclink
  end
end
