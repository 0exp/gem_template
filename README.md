# gem_template &middot; [![Gem Version](https://badge.fury.io/rb/gem_template_rb.svg)](https://badge.fury.io/rb/gem_template_rb) [![Build Status](https://travis-ci.org/0exp/gem_template.svg?branch=master)](https://travis-ci.org/0exp/gem_template)

> Рус, есть какой-нить шаблон для гемов, чтобы мозга не е*ать?

---

### Че по факту?

- ты теперь можешь в гемы (тут есть все: шаблонный проект для гема, настройка сиайки, rubocop, прогон тестов - рай для пацана);
- клонируй репу;
- переименовывай `gem_template.gemspec`, `lib/gem_template.rb`, `lib/gem_template/`;
- читай, че написано ниже;
- потом уже можешь делать себе `gem build твой_гем.gemspec` и `gem push твой_гем-x.x.x.gem` (**x.x.x** - это версия);
- радуйся - ты бахнул свой гем, ты теперь пацан;

---

- [Че по билду?](#че-по-билду)
- [Че надо менять?](#че-надо-менять)
- [А че менять в gemspec?](#а-че-менять-в-gemspec-)
- [Че по спекам?](#че-по-спекам)
- [А че делать с фичами?](#а-че-делать-с-фичами)
- [Ну а почему не бандл гем?](#ну-а-почему-не-бандл-гем)
- [Как тебя поддержать, братан?](#как-тебя-поддержать-братан)

---

### Че по билду?

- весь билд гонится в `TravisCI`;
- весь конфиг в `.travis.yml`, там `rubocop` и `rspec` в билде для `jruby-head`, `ruby-head` и `ruby@2.7.0`;
- настраивай как тебе надо, если надо (ты справишься);
- в этом ридми есть два баджика (глаза разуй) - посмотри в сорцы ридми-файла и возьми их себе (это баджики на гем-вершн и травис-билд-статус);

---

### Че надо менять?

- `gem_template_rb.gemspec` - переименовывай в название своего гема (типа `smart_core.gemspec`)
- переименуй `lib/gem_template.rb` и `lib/gem_template` в свои названия (типа в `lib/smart_core.rb` и в `lib/smart_core/`)
- в `spec_helper.rb` поменяй `require 'gem_template'` на свой гем-реквайр (типа `require 'smart_core'`);
- и константы `module GemTemplate` не забудь поменять (типа на `module SmartCore` или `class SmartCore`);

---

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
  spec.license     = 'MIT' # САМ СМОТРИ. СТАВЬ КАКУЮ ХОЧЕШЬ

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/0exp/gem_template' # МЕНЯЙ НА СВОЙ УРЛ ДО СОРЦОВ
  spec.metadata['changelog_uri']   = 'https://github.com/0exp/gem_template/blob/master/CHANGELOG.md' # МЕНЯЙ НА СВОЙ УРЛ ДО ЧАНДЖЛОГА

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features1)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # ГЕМЫ ДЛЯ ДЭВА. ЭТО МИНИМАЛ МАСТ-ХЭВ. ОСТАВЛЯЙ ВСЕ
  spec.add_development_dependency 'bundler',          '~> 2.1'
  spec.add_development_dependency 'rake',             '~> 13.0'
  spec.add_development_dependency 'rspec',            '~> 3.9'
  spec.add_development_dependency 'armitage-rubocop', '~> 0.78'
  spec.add_development_dependency 'simplecov',        '~> 0.17'
  spec.add_development_dependency 'pry',              '~> 0.12'
end
```

---

### Че по спекам?

- `.rspec` - по умолчанию `progress`;
- `spec/spec_helper.rb` - там сразу тебе SimpleCov 100% кавередж, рандом ордер спеков и четкий конфиг RSpec'а от меня;
- в `spec/spec_helper.rb` поменяй `require 'gem_template'` на свой гем типа `require 'smart_core'`;
- теперь можешь нормально в `bundle exec rspec`;

---

### А че делать с фичами?

Записывай все в [CHANGELOG.md](CHANGELOG.md). Там пример есть. И не тупи - делай, как написано.

---

### Ну а почему не бандл гем?

Да потому, что достало за ним руками потом подкручивать.

---

### Как тебя поддержать, братан?

Ищи меня на улицах.
