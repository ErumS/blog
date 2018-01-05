class CreateFeedback < ActiveRecord::Migration[5.1]
	def change
		create_table :feedbacks do |f|
			f.string :name1
			f.text :body
			f.references :feedback, foreign_key: true

			f.timestamps
		end
	end
end