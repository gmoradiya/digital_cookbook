class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true, length: { maximum: 100 }
  validates :instructions, presence: true, length: { maximum: 1000 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }


  def self.search(cuisine, ingredient)
    query = all

    query = query.where('lower(recipes.name) LIKE ?', "%#{cuisine.to_s.downcase}%")
 
    if ingredient.present?
      query =  query.joins(:ingredients).where('lower(ingredients.name) LIKE ?', "%#{ingredient.downcase}%")
    end

    query
  end

end
