# frozen_string_literal: true

class TestWrapper
  def initialize
    @foo = :foo
    @hash = { foo: 1 }
  end
end

RSpec.describe DiggyDiggyHole do
  it "does something useful" do
    expect { TestWrapper.new.dig(:foo) }.to raise_error(NoMethodError)
  end

  it 'works for Hashes' do
    expect({ foo: { bar: 1 }}.dig(:foo, :bar)).to eq 1
  end

  it 'works for mixed' do
    expect { TestWrapper.new.dig(:hash, :foo) }.to raise_error(NoMethodError)
  end
end

