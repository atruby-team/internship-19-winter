require 'mysql2'

class Leave
	USR = 'minhvuong'
	DB = 'MANAGER_EMPLOYEE'
	TABLE = 'leave'

  attr_accessor :id, :user_id, :reason, :total_date_off, :status, :publish_dates
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: "#{USR}",
      password: 'qwertyuiop',
      database: "#{DB}")
  end

  def create_request(reason, total, user_id)
    date = DateTime.now
    d = DateTime.parse(date.to_s).to_time.strftime('%F %T')
    sql = "INSERT INTO `#{DB}`.`#{TABLE}`(id_user, reason, total_day_off, status, publish_date)
      VALUES('#{user_id}', '#{reason}', #{total}, 'non-sending', '#{d}')"
    @connect.query(sql)
  end

  def send_request(id)
    date = DateTime.now
    d = DateTime.parse(date.to_s).to_time.strftime('%F %T')
    sql = "UPDATE `#{DB}`.`#{TABLE}` SET (status = 'sending',  publish_date = #{d})
      WHERE id = #{id}"
    @connect.query(sql)
  end

  def get_your_team_leave(team_id, status)
    sql = "SELECT *, `#{TABLE}`.id AS #{TABLE}_id  FROM `#{DB}`.`#{TABLE}` INNER JOIN `#{DB}`.`employee`
      ON #{TABLE}.id_user = employee.id WHERE team_id = #{team_id} and status = '#{status}'"
    @connect.query(sql).to_a
  end

  def get_your_leave(id_user)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE id_user = #{id_user}"
    @connect.query(sql).to_a
  end

  def get_list_employee(id_user, status)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE id_user = #{id_user} and status = '#{status}'"
    @connect.query(sql).to_a
  end

  def reponse_approve(id)
    sql = "UPDATE `#{DB}`.`#{TABLE}` SET status = 'approved' WHERE id = #{id}"
    @connect.query(sql)
  end

  def reponse_reject(id)
    sql = "UPDATE `#{DB}`.`#{TABLE}` SET status = 'rejected' WHERE id = #{id}"
    @connect.query(sql)
  end

  def get_item(id)
    sql = "SELECT * FROM `#{DB}`.`#{TABLE}` WHERE id = #{id}"
    @connect.query(sql).to_a
  end

  def update_request(reason, id)
    sql = "UPDATE `#{DB}`.`#{TABLE}` SET reason = '#{reason}', status = 'sending' WHERE id = #{id}"
    @connect.query(sql)
  end

  def delete_request(id)
    sql = "DELETE FROM `#{DB}`.`#{TABLE}` WHERE id = #{id}"
    @connect.query(sql)
  end
end
