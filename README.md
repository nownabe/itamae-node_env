# Itamae::NodeEnv

itamae-node_env gem is an [Itamae](https://github.com/ryotarai/itamae) plugin.
Using itamae-node_env, you can use environment variables in node attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-node_env'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-node_env

## Usage

recipe.rb:

```ruby
file '/home/someone/.ssh/id_rsa' do
  content node["secret_key"]
  mode "0600"
  owner "someone"
  group "someone"
end
```

node.json:

```json
{"secret_key": "env[IR_SECRET_KEY]"}
```

Execute Itamae with `itamae-env` command:

```bash
export IR_SECRET_KEY="$(cat ./id_rsa_for_someone)"
bundle exec itamae-env ssh -h target_host -j node.json recipe.rb
```

### With dotenv
Add this line to Gemfile:

```ruby
gem "dotenv"
```

Make `.env` file:

```bash
IR_PASSWORD="password"
```

And execute `itamae-env` command.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-node_env/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
