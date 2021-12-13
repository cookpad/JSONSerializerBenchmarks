json.data do
  json.array!(@recipes) do |recipe|
    json.id recipe.id
    json.title recipe.title
    json.content recipe.content
    json.state recipe.state
    json.created_at recipe.created_at.xmlschema
    json.updated_at recipe.updated_at.xmlschema
    json.published_at recipe.published_at.try(:xmlschema)
    json.author do
      json.partial!("benchmark/j_builder/users/user", user: recipe.user)
    end
    json.comments recipe.comments, :id, :content, :created_at, :updated_at, :approved_at, :restricted_at
  end
end
json.meta do
  json.page @recipes.page
  json.per_page @recipes.per_page
end