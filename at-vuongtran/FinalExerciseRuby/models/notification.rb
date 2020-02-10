require 'mysql2'

class Notification
	DB = 'MANAGER_EMPLOYEE'
	USR = 'minhvuong'
	TABLE = 'notification'
  attr_accessor :id, :title, :content, :publish_dates, :id_team
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: "#{USR}",
      password: 'qwertyuiop',
      database: "#{DB}")
  end

  def add_notif(title, content, id_team)
    date = DateTime.now
    d = DateTime.parse(date.to_s).to_time.strftime('%F %T')
    sql = "INSERT INTO `#{DB}`.`#{TABLE}`(title, content, pulbish_date, id_team)
                        VALUES('#{title}', '#{content}', '#{d}', #{id_team})"
    @connect.query(sql)
  end

  def get_list(id_team)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE id_team = #{id_team}"
    @connect.query(sql).to_a
  end

  def get_item(id)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE id = #{id}"
    @connect.query(sql).to_a
  end

  def delete(id)
    sql = "DELETE FROM `#{DB}`.`#{TABLE}` WHERE id = #{id}"
    @connect.query(sql)
  end
end
