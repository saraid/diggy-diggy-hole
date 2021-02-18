# frozen_string_literal: true

require 'diggy-diggy-hole/monkeypatch'

class TestWrapper
  def initialize
    @foo = :foo
    @hash = { foo: 1 }
  end
end

RSpec.describe DiggyDiggyHole do
  it "does something useful" do
    expect(TestWrapper.new.dig(:foo)).to eq :foo
  end

  it 'works for Hashes' do
    expect({ foo: { bar: 1 }}.dig(:foo, :bar)).to eq 1
  end

  it 'works for mixed' do
    expect(TestWrapper.new.dig(:hash, :foo)).to eq 1
  end
end

