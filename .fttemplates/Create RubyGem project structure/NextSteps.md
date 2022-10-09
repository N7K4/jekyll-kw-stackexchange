# Next Steps

> 🥳 Amazing! You created your project from the [template][GitHub jekyll-plugin-template].

Your input variables defined in `.ftsettings.json` for the template:

| Key         | Default             | Transform           |
|-------------|---------------------|---------------------|
| Company     | KargWare            | pascalcase          |
| Project     | NewPlugIn           | pascalcase          |
| ProjectName | jekyll-kw-newplugin | lowercase paramcase |

Transformations (combine them with `?`)

- **Company**     : `<Company>` ➔ <Company | pascalcase>
- **Project**     : `<Project>`➔ <Project | pascalcase>
- **ProjectName** : `<ProjectName>` ➔ <ProjectName | lowercase?paramcase>

The namespace of the project `<ProjectName | lowercase?paramcase>` is `Jekyll::<Company | pascalcase>::<Project | pascalcase>`

```ruby
module Jekyll
  module <Company | pascalcase>
    module <Project | pascalcase>
    ...
    end
  end
end
```

## Commands and Clean-Up Steps

- Check the content of `[.gitignore](.gitignore)` file
- Delete not needed files and folders from root folder
  - `STEPS.md`
  - `README.md`
  - `docu-img/`
  - `.fttemplates/Create RubyGem project structure/`
- Do the `initial commit` to the project
- Install dependencies `bundle install`
- Run tests `bundle exec rake test`
- Create documentation `bundle exec rake rdoc`
- Observe the documentation (via docker) on [localhost:8099](http://localhost:8099) `docker run -d --rm -p 8099:80 --name rdoc-jekyll-kw -v $(pwd)/rdoc:/usr/local/apache2/htdocs/ httpd:alpine`

## Step 1

TODO: NextSteps.md -> Step 1

## Step 2

TODO: NextSteps.md -> Step 2

## Step 3

TODO: NextSteps.md -> Step 3

[GitHub jekyll-plugin-template]: https://github.com/n13org/jekyll-plugin-template