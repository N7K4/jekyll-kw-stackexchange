# <Project>

![CI](https://github.com/n13org/<Project>/workflows/CI/badge.svg)
![Coverage](https://github.com/n13org/<Project>/workflows/Coverage/badge.svg)
![RuboCop](https://github.com/n13org/<Project>/workflows/RuboCop/badge.svg)

[![Gem Version](https://badge.fury.io/rb/<Project>.svg)](https://badge.fury.io/rb/<Project>)

A plugin for [jekyll][Jekyll Website] to ...
TODO: Add the project description here

## 🚀 Installation

Add this section to your application's `Gemfile` inside the `jekyll_plugins` and execute `bundle install`

```ruby
group :jekyll_plugins do
  gem '<Project>'
end
```

Or install the dependency with `bundle` itself, you can use the option `--skip-install`, when `bundle install` will be called later

```sh
bundle add <Project> --group jekyll_plugins 
```

Then add the following to your site's `_config.yml` to activate the plugin, see also the [Configuration](#%EF%B8%8F-configuration) section to change the default configuration. 

```yaml
plugins:
  - <Project>
```

> The Plug-In is tested with jekyll 3.8, 3.9, 4.0 and 4.1!

## 🔥 Usage

## ⏰ Changelog

* ...
* 0.0.2 Read the [NextSteps.md](NextSteps.md) and follow the introduction steps
* 0.0.1 Install [Visual Studio Extension - Folder Templates](https://marketplace.visualstudio.com/items?itemName=Huuums.vscode-fast-folder-structure), and run `NewJekyllPlugInAsRubyGem` to get the a skeleton project from template
* 0.0.0 Create project `<Project>` from [template][GitHub jekyll-plugin-template]

## ⚙️ Configuration

Add `<Project>` section to `_config.yml` configure the plugin globally. If you want to use defaults you can omit the config-section.

```yaml
<Project>:
  my_boolean: false
  my_string: 'sha384'
  my_number: 1.23
```

Configuration values, the `default` value is in **bold**

| Key | Description | Values (**default**) |
|-----|-------------|----------------------|
| my_boolean | A boolean value    | **false**, true |
| my_string  | A string           | foo, **hello plugin**, bar |
| my_number  | A (decimal) number | **0** |

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
