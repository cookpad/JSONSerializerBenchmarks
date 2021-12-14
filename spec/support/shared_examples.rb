module SharedExamples
  RSpec.shared_examples "Benchmark Spec" do |path|
    it "returns the expected JSON" do
      create_list(:recipe, 20, state: "published")
      user = create(:user)
      recipe = create(:recipe, :with_comments,
        title: "Recipe title",
        content: "Recipe content",
        state: "published",
        user: user,
        created_at: 1.hour.ago)

      get "/benchmark/#{path}/recipes.json"

      expect(response).to have_http_status(200)
      expect(response.body).to include_json(data: [
                                              { title: "Recipe title",
                                                content: "Recipe content",
                                                created_at: recipe.created_at.xmlschema,
                                                updated_at: recipe.updated_at.xmlschema,
                                                published_at: recipe.published_at.xmlschema,
                                                state: "published",
                                                author: {
                                                  name: user.name,
                                                  email: user.email,
                                                  created_at: user.created_at.xmlschema,
                                                  updated_at: user.created_at.xmlschema,
                                                  language: user.language,
                                                  country: user.country
                                                },
                                                comments: [{
                                                  created_at: datetime_regex,
                                                  updated_at: datetime_regex,
                                                  approved_at: nil,
                                                  restricted_at: nil,
                                                  content: /.+/
                                                }] }
                                            ],
        meta: { page: 2, per_page: 20 })
    end

    private

      def datetime_regex
        /^([+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24:?00)([.,]\d+(?!:))?)?(\17[0-5]\d([.,]\d+)?)?([zZ]|([+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/
      end
  end
end

RSpec.configure do |config|
  config.include(SharedExamples, type: :request)
end
