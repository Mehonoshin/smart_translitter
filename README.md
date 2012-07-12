#SmartTranslitter

[![Build Status](https://secure.travis-ci.org/Mehonoshin/smart_translitter.png?branch=master)](http://travis-ci.org/Mehonoshin/smart_translitter)

SmartTranslitter allows you to transliterate words from russian cyrillic to latin characters, considering double cases.

Example: in different standards russian char "Х" can transliterate as "H" or "Kh".



Позволяет производить транслитерацию слов на кириллице в латиницу, в учетом различных вариантов транслитерации.

Пример: в разных стандартах буква "Х" транслитерируется как "H" либо "Kh". 


##Installation
Add `gem "smart_translitter"` to the `Gemfile` and run `bundle install`


##Usage
Type `require 'smart_translitter'`
and call `SmartTranslitter.t('Русский текст')`


##Requirements
Ruby >= 1.9.2

