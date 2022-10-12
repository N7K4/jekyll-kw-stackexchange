# jekyll-kw-stackexchange

![CI](https://github.com/n13org/jekyll-kw-stackexchange/workflows/CI/badge.svg)
![Coverage](https://github.com/n13org/jekyll-kw-stackexchange/workflows/Coverage/badge.svg)
![RuboCop](https://github.com/n13org/jekyll-kw-stackexchange/workflows/RuboCop/badge.svg)

[![Maintainability](https://api.codeclimate.com/v1/badges/98c24cd21fac2e4ef06f/maintainability)](https://codeclimate.com/github/n13org/jekyll-kw-stackexchange/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/98c24cd21fac2e4ef06f/test_coverage)](https://codeclimate.com/github/n13org/jekyll-kw-stackexchange/test_coverage)

[![Gem Version](https://badge.fury.io/rb/jekyll-kw-stackexchange.svg)](https://badge.fury.io/rb/jekyll-kw-stackexchange)

A plugin for [jekyll][Jekyll Website] to ...
TODO: Add the project description here

## 🔥 Usage

## ⚙️ Configuration

Add `jekyll-kw-stackexchange` section to `_config.yml` configure the plugin globally, see [jekyll-documentation](https://jekyllrb.com/docs/configuration/). If you want to use defaults you can omit the config-section.

```yaml
jekyll-kw-stackexchange:
  user_id: 14754800
  api_baseurl: "https://api.stackexchange.com/2.3"
```

Configuration values, the `default` value is in **bold**

| Key | Description | Values (**default**) |
|-----|-------------|----------------------|
| user_id | your user-id from StackExchange as number | **14754800** |
| api_baseurl | The base-url to the API of StackExchange | **https://api.stackexchange.com/2.3**|

## 🚀 Installation

Add this section to your application's `Gemfile` inside the `jekyll_plugins` and execute `bundle install`

```ruby
group :jekyll_plugins do
  gem 'jekyll-kw-stackexchange'
end
```

Or install the dependency with `bundle` itself, you can use the option `--skip-install`, when `bundle install` will be called later

```sh
bundle add jekyll-kw-stackexchange --group jekyll_plugins 
```

Then add the following to your site's `_config.yml` to activate the plugin, see also the [Configuration](#%EF%B8%8F-configuration) section to change the default configuration. 

```yaml
plugins:
  - jekyll-kw-stackexchange
```

> The Plug-In is tested with ruby `v3.1` jekyll `v4.2`!


## Local linting and testing

* Run linting `bundle exec rubocop`.
* Run tests `bundle exec rake test`.

## ⏰ Changelog

* ...
* Prepare CI-workflow with Appraisal `bundle exec appraisal install` and `bundle exec appraisal generate`
* Rubocop `rubocop --display-cop-names --format markdown -o rubocop.md --format html -o rubocop.html --format simple`
* Rubocop -> `rubocop --display-cop-names --format markdown -o rubocop.md --format html -o rubocop.html --format progress --format offenses`
* Prepare workflow on GitHub `CI` and `rubocop`
* 0.0.1 Install [Visual Studio Extension - Folder Templates](https://marketplace.visualstudio.com/items?itemName=Huuums.vscode-fast-folder-structure), and run `NewJekyllPlugInAsRubyGem` to get the a skeleton project from template
* 0.0.0 Create project `jekyll-kw-stackexchange` from [template][GitHub jekyll-plugin-template]

## 📝 Notes / Hints

TODO: Add notes, hints and learnings

## 👋 Contribution

TODO: How to contribute, e.g. [CONTRIBUTING.md](CONTRIBUTING.md)

## 🏆 Kudos

TODO: Add big thanks and kudos persons / links / blogs

## ✅ Template

The project was created from the template [GitHub n13org/jekyll-plugin-template][GitHub jekyll-plugin-template]. We would ❤️ when you keep the reference. Thanks. TODO: Create hint to start a Pull Request to the "Who Is Using" ...

To update code from template or provide ideas to the template, add the template as second git remote, via `git add remote template git@github.com:n13org/jekyll-plugin-template.git`. Create a branch `git checkout -b update-template`. Change the code and push it `git push template update-template`. Navigate to the [Pull request area](https://github.com/n13org/jekyll-plugin-template/pulls) on GitHub website.

[GitHub jekyll-plugin-template]: https://github.com/n13org/jekyll-plugin-template
[Jekyll Website]: https://jekyllrb.com/
