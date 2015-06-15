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
  belongs_to :priority

  def generatedocs
  	##puts "hello AMAZING PEOPLES!"
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
		sheet.rows[16][20] = "#{self.priority.first}"
		sheet.rows[18][20] = "#{self.priority.second}"
		sheet.rows[20][20] = "#{self.priority.third}"	
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
		sheet.rows[80][0] = DateTime.now.to_date
		sheet.rows[80][12] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 
		sheet.rows[27][26] = "Сертификат № #{self.unifiedexam.number}"
		sheet.rows[28][26] = "Сертификат № #{self.unifiedexam.number}" 
		sheet.rows[29][26] = "Сертификат № #{self.unifiedexam.number}" 
		sheet.rows[30][26] = "Сертификат № #{self.unifiedexam.number}" 
 
	end
	
	sheet1 = book.worksheet 1
	sheet1.each do |row|
		sheet1.rows[5][4] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 		
		sheet1.rows[9][24] = "#{self.priority.first}"
		sheet1.rows[21][24] = "#{self.priority.second}"
		sheet1.rows[33][24] = "#{self.priority.third}"
		sheet1.rows[12][36] = "14"
		sheet1.rows[46][1] = DateTime.now
		sheet1.rows[46][11] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}" 			
	end
	
	sheet2 = book.worksheet 2
	sheet2.each do |row|
		sheet2.rows[9][24] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}"
		sheet2.rows[17][5] = "№14 Ступинский филиал"
		sheet2.rows[130][4] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}"
		sheet2.rows[131][6] = "#{self.identify.address}"
		sheet2.rows[132][5] = "#{self.personaldoc.phone_number}"
		sheet2.rows[132][14] = "#{self.identify.birthday}"
		sheet2.rows[132][26] = "#{self.identify.series} #{self.identify.number}"
		sheet2.rows[133][7] = "#{self.identify.issued_by} #{self.identify.where}"
		sheet2.rows[138][19] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}"
		sheet2.rows[145][12] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}"
		sheet2.rows[145][27] = DateTime.now	
	end	

	sheet3 = book.worksheet 3
	sheet3.each do |row|
		sheet3.rows[4][6] = "#{self.personaldoc.first_name}"
		sheet3.rows[4][19] = "#{self.personaldoc.second_name}"
		sheet3.rows[4][35] = "#{self.personaldoc.third_name}"
		sheet3.rows[6][10] = "#{self.identify.birthday}"
		sheet3.rows[8][10] = "#{self.identify.birth_place}"
		sheet3.rows[10][8] = "#{self.identify.country}"
		sheet3.rows[14][1] = "#{self.education.university} #{self.education.where}"
		sheet3.rows[11][37] = "#{self.identify.address}"
		sheet3.rows[16][35] = "#{self.personaldoc.phone_number}"
		sheet3.rows[18][36] = DateTime.now
	end

	sheet4 = book.worksheet 4
	sheet4.each do |row|
		sheet4.rows[5][19] = "№14 Ступинский филиал"
		sheet4.rows[9][11] = "#{self.personaldoc.first_name}"
		sheet4.rows[10][11] = "#{self.personaldoc.second_name}"
		sheet4.rows[11][11] = "#{self.personaldoc.third_name}"
		sheet4.rows[12][11] = "#{self.identify.birthday}"
		sheet4.rows[13][11] = "#{self.identify.country}"
		sheet4.rows[9][32] = "среднее (полное) общее образование"
		sheet4.rows[12][31] = "#{self.identify.address}"
		sheet4.rows[9][11] = "#{self.personaldoc.first_name}"
		sheet4.rows[15][34] = "#{self.personaldoc.phone_number}"
		sheet4.rows[4][61] = "#{self.unifiedexam.math}"
		sheet4.rows[5][61] = "#{self.unifiedexam.russian}"
		sheet4.rows[6][61] = "#{self.unifiedexam.physics}"
		sheet4.rows[7][61] = "#{self.unifiedexam.social_science}"
		sheet4.rows[6][19] = "#{self.priority.first}"
	end

	sheet5 = book.worksheet 5
	sheet5.each do |row|
		sheet5.rows[6][7] = "#{self.personaldoc.first_name}"
		sheet5.rows[7][7] = "#{self.personaldoc.second_name}"
		sheet5.rows[8][7] = "#{self.personaldoc.third_name}"
		sheet5.rows[13][11] = DateTime.now
		sheet5.rows[5][8] = "#{self.priority.first}"
	end

	sheet6 = book.worksheet 6
	sheet6.each do |row|
		sheet6.rows[5][4] = "#{self.personaldoc.first_name} #{self.personaldoc.second_name} #{self.personaldoc.third_name}"
		sheet6.rows[9][2] = DateTime.now 
	end
	doclink = "#{Rails.root}/public/xlsdocs/#{Time.now.strftime("%y%m%d_%3s")}_#{self.personaldoc.first_name}_#{self.personaldoc.second_name}.xls"
	book.write doclink
	doclink
  end
end
