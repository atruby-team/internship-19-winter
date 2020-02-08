require 'mysql2'
require_relative '../db/migrate'

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

	def create_team(name, team_lead)
    sql = "INSERT INTO `#{DB}`.`team`(name, team_lead, total_members)
      VALUES('#{name}', '#{team_lead}', 1)"
    @connect.query(sql)
  end
end