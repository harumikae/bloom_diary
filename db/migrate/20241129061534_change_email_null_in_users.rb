class ChangeEmailNullInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :email, true # emailを空でもOKにする
    change_column_default :users, :email, nil # emailのデフォルト値を削除
  end
end
