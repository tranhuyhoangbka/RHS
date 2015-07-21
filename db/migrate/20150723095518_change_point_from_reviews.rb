class ChangePointFromReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :point, :float, default: 0
  end
end
