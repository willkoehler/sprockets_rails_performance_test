RSpec.configure do |config|

  # allows us to call create(), build() instead of Factory.create(), Factory.build()
  config.include FactoryGirl::Syntax::Methods

  # This code will be run each time you run your specs.
  config.before(:all) do
    FactoryGirl.reload
  end
end