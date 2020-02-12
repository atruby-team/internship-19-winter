require 'bcrypt'
require 'mysql2'

class Employee
	DB = 'MANAGER_EMPLOYEE'
	USR = 'minhvuong'
	PASS = 'qwertyuiop'
	TABLE = 'employee'

	attr_accessor :id, :name, :username, :password, :team_id, :role, :leave_balance

	def initialize
		@connect = Mysql2::Client.new(host: 'localhost', username: USR,
			password: PASS,
			database: DB)
	end
	
	def check_user(username)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE username = '#{username}'"
    @connect.query(sql).to_a
  end

	def add_employee(name, team_id, username, password, role = 0)
    sql = "INSERT INTO `#{DB}`.`#{TABLE}`(name, team_id, role, username, password, leave_balance)
      VALUES('#{name}', #{team_id}, #{role}, '#{username}', '#{password}', 10)"
    @connect.query(sql)
  end
	
	def update_password(username, password)
    sql = "UPDATE `#{DB}`.`#{TABLE}` SET password = '#{password}' WHERE username = '#{username}'"
    @connect.query(sql)
	end
	
	def get_member_team(team_id)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE team_id = #{team_id}"
    @connect.query(sql).to_a
	end
	
	def update_balance(id, total_date_off)
    sql = "UPDATE `#{DB}`.`#{TABLE}` SET leave_balance = leave_balance - #{total_date_off} WHERE id = '#{id}'"
    @connect.query(sql)
	end

	def get_all
		sql = <<-SQL
				SELECT * FROM #{DB}.#{TABLE}
			SQL
		@connect.query(sql).to_a
	end

	def update_team(id_member, team_id)
		sql = <<-SQL
				UPDATE #{DB}.#{TABLE} SET team_id = #{team_id} WHERE id = #{id_member}
			SQL
		@connect.query(sql)
	end
end
