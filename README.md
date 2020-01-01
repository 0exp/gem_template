# gem_template

> Рус, есть какой-нить шаблон для гемов, чтобы мозга не е*ать?

### Че по факту?

- ты теперь можешь четко в гемы. как? рано вопросы задаешь, дальше прочитай сначала;
- клонируй репу;
- переименовывай `gem_tempalte.gemspec`, `lib/gem_tempalte.rb`, `lib/gem_template/`;
- читай, че написано ниже;
- потом уже можешь делать себе `gem build твой_гем.gemspec` и `gem push твой_гем.gemspec`;
- радуйся - ты бахнул свой гем, ты теперь пацан;

---

- [Че надо менять?](#че-надо-менять)
- [Че по спекам?](#че-по-спекам)
- [А че делать с фичами?](#а-че-делать-с-фичами)

---

### Че надо менять?

- `gem_template_rb.gemspec` - переименовывай в название своего гема (типа `smart_core.gemspec`)

### А че менять в *.gemspec ?

В комментах ниже написано, че делать:

```ruby
# frozen_string_literal: true

require_relative 'lib/gem_template/version' # МЕНЯЙ НА СВОЙ ПУТЬ

Gem::Specification.new do |spec|
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0') # СТАВЬ СВОЮ ВЕРСИЮ

  spec.name    = 'gem_template_rb' # МЕНЙ НА ИМЯ СВОЕГО ГЕМА
  spec.version = GemTemplate::VERSION # МЕНЯЙ НА ПУТЬ ДО СВОЕЙ VERSION-КОНСТАНТЫ
  spec.authors = ['Rustam Ibragimov'] # МОЖЕШЬ ОСТАВИТЬ. ОТДАЙ МНЕ СВОЙ ГЕМ
  spec.email   = ['iamdaiver@gmail.com'] # А ВОТ ЭТО МЕНЯЙ. НЕ ШЛИ МНЕ СПАМ, ОК?

  spec.summary     = 'Gem Template' # МЕНЯЙ НА ЧИСТО КРАТКОЕ ОПИСАНИЕ
  spec.description = 'Рус, есть какой-нить шаблон для гемов, чтобы мозга не е*ать?' # МЕНЯЙ НА ЧИСТО ДЛИННОЕ ОПИСАНИЕ
  spec.homepage    = 'https://github.com/0exp/gem_template' # УРЛ ДО СОРЦОВ ТВОЕГО ГЕМА ИЛИ ПРОМО-САЙТИКА
  spec.license     = 'MIT' # САМ СМОТРИ, КАК ХОЧЕШЬ

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/0exp/gem_template' # МЕНЯ НА СВОЙ УРЛ ДО СОРЦОВ
  spec.metadata['changelog_uri']   = 'https://github.com/0exp/gem_template/blob/master/CHANGELOG.md' # МЕНЯЙ НА СВОЙ УРЛ ДО ЧАНДЖЛОГА

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features1)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',          '~> 2.1'
  spec.add_development_dependency 'rake',             '~> 13.0'
  spec.add_development_dependency 'rspec',            '~> 3.9'
  spec.add_development_dependency 'armitage-rubocop', '~> 0.78'
  spec.add_development_dependency 'simplecov',        '~> 0.17'
  spec.add_development_dependency 'pry',              '~> 0.12'
end
```

### Че по спекам?

- `.rspec` - по умолчанию `progress`;
- `spec/spec_helper.rb` - там сразу тебе SimpleCov 100% кавередж, рандом ордер спеков и четкий конфиг RSpec'а от меня;
- в `spec/spec_helper.rb` поменяй `require 'gem_template' на свой гем типа `require 'smart_core'`;
- теперь можешь нормально в `bundle exec rspec`;

### А че делать с фичами?

Записывай все в [CHANGELOG.md](changelog.md). Там пример есть. Как я там показал - так и делай. По другому не делай - ты же не туопй?
