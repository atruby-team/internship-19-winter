require 'mysql2'

class Team
	DB = 'MANAGER_EMPLOYEE'
	USR = 'minhvuong'
	PASS = 'qwertyuiop'
	attr_accessor :id, :name, :team_lead, :total_members

	def initialize
		@connect = Mysql2::Client.new(host: 'localhost', username: USR,
			password: PASS,
			database: DB)
	end

	def create_team(name, team_lead = 1)
    sql = "INSERT INTO `#{DB}`.`team`(name, team_lead, total_members)
      VALUES('#{name}', '#{team_lead}', 1)"
		@connect.query(sql)
		@connect.close
	end
	
	def get_all_team
		sql = "SELECT * FROM `#{DB}`.`team`;"
		result = @connect.query(sql).to_a
		@connect.close
		result
	end
end
