module AquaticsHelper
  def assign_aquatic_creator(aquatic, creator)
    aquatic.user = creator
    aquatic
  end
end
