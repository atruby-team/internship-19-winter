require 'mysql2'

class Notification
	DB = 'MANAGER_EMPLOYEE'
	USR = 'minhvuong'
	TABLE = 'notification'
  attr_accessor :id, :title, :content, :publish_dates, :team_id
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: "#{USR}",
      password: 'qwertyuiop',
      database: "#{DB}")
  end

  def add_notif(title, content, team_id)
    date = DateTime.now
    d = DateTime.parse(date.to_s).to_time.strftime('%F %T')
    sql = "INSERT INTO `#{DB}`.`#{TABLE}`(title, content, public_date, team_id)
                        VALUES('#{title}', '#{content}', '#{d}', #{team_id})"
    @connect.query(sql)
  end

  def get_list(team_id)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE team_id = #{team_id}"
    @connect.query(sql).to_a
  end

  def get_item(id)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE id = #{id}"
    @connect.query(sql).to_a
  end

  def delete_item(id)
    sql = "DELETE FROM `#{DB}`.`#{TABLE}` WHERE id = #{id}"
    @connect.query(sql)
  end
end
