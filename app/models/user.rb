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
  belongs_to :specialization

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
		sheet.rows[8][8] = "#{self.identify.birth_place}"
		sheet.rows[10][15] = "#{self.identify.address}"
		sheet.rows[11][37] = "#{self.personaldoc.phone_number}"
		sheet.rows[16][20] = "#{self.specialization.title}"
			
			sheet.rows[22][4] = "среднее (полное) общее образование"
		
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
		sheet.rows[80][12] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 
		sheet.rows[27][26] = "Сертификат № #{self.unifiedexam.number}"
		sheet.rows[28][26] = "Сертификат № #{self.unifiedexam.number}" 
		sheet.rows[29][26] = "Сертификат № #{self.unifiedexam.number}" 
		sheet.rows[30][26] = "Сертификат № #{self.unifiedexam.number}" 
 
	end
	
	sheet1 = book.worksheet 1
	sheet1.each do |row|
		sheet1.rows[5][4] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 		
		sheet1.rows[9][24] = "#{self.specialization.title}"
		sheet1.rows[12][2] = "#{self.specialization.chair.title}"
		sheet1.rows[11][36] = "14"
		sheet1.rows[46][1] = DateTime.now
		sheet1.rows[46][11] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 			
	end
	
	doclink = "#{Rails.root}/public/xlsdocs/#{Time.now.strftime("%y%m%d_%3s")}_#{self.personaldoc.first_name}_#{self.personaldoc.second_name}.xls"
	book.write doclink
	doclink
  end
end
