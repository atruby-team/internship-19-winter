require 'mysql2'

class Team
	DB = 'MANAGER_EMPLOYEE'
	TABLE = 'team'
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

	def update_team_member(old_team, new_team)
		sql = <<-SQL
				UPDATE #{DB}.#{TABLE} SET total_members = total_members - 1  WHERE id = #{old_team}
			SQL
		@connect.query(sql)
		sql1 = <<-SQL
		UPDATE #{DB}.#{TABLE} SET total_members = total_members + 1  WHERE id = #{new_team}
			SQL
		@connect.query(sql)
		@connect.query(sql1)
	end
end
