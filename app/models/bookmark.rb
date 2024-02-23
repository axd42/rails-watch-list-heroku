class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates :comment, length: { minimum: 6 }, allow_blank: true

  # Validation d'unicité de l'association [film, liste]
  validate :unique_film_list_association

  private

  def unique_film_list_association
    if Bookmark.where(movie_id: self.movie_id, list_id: self.list_id).exists?
      errors.add(:base, "Ce film est déjà présent dans cette liste")
    end
  end
end
