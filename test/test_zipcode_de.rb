require 'minitest/autorun'
require 'zipcode-de'
require 'set'

class TestZipCodeDE < MiniTest::Test
  class << self
    def setup
      @loaded ||= ZipCode::DB.for(:de).load
    end
  end

  def setup
    self.class.setup
  end

  def test_search_by_word_prefix
    results = ZipCode::DB.for(:de).search(:name, 'ESS')
    assert_equal(49, results.count)
  end

  def test_search_by_first_word_prefix
    results = ZipCode::DB.for(:de).search(:name, 'BADEN')
    assert_equal(7, results.count)
    assert_equal(Set.new(%w(62340 532398 1182320 1245782 311915)),
                 Set.new(results.map { |e| e[:osm_id] }))
  end

  def test_search_by_last_word_prefix
    results = ZipCode::DB.for(:de).search(:name, 'MEINBE')
    assert_equal(1, results.count)
    assert_equal('32805', results.first[:zip])
  end

  def test_search_by_full_name
    results = ZipCode::DB.for(:de).search(:name, 'DETMOLD')
    assert_equal(3, results.count)
    assert_equal('32756', results.first[:zip])
  end

  def test_search_by_full_name_with_space
    results = ZipCode::DB.for(:de).search(:name, 'HORN-BAD MEINBERG')
    assert_equal(1, results.count)
    assert_equal('32805', results.first[:zip])
  end
end
