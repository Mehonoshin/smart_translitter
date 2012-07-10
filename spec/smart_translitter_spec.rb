# encoding: UTF-8
require 'spec_helper'

describe SmartTranslitter do
  it 'should translate cyrillic chars' do
    SmartTranslitter.t('Мехоношин').should eql ["Mechonoshin", "Mehonoshin", "Mekhonoshin"]
  end

  it 'should keep unchanged latin chars' do
    SmartTranslitter.t('Stanislav').should eql ["Stanislav"]
  end

  it 'should translate where possible mixed strings' do
    SmartTranslitter.t('StanislavМехоношин').should eql ["StanislavMechonoshin", "StanislavMehonoshin", "StanislavMekhonoshin"]
  end

  it 'should keep upper case' do
    SmartTranslitter.t('СтаС').should_not eql ["stas"]
  end
end
