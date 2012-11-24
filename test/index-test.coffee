should = require 'should'
_ = require 'underscore'
require '../lib/index'

describe 'WHEN extending an object with a filter', ->
  obj =
    a : "v1"
    b : "v2"
    c : "v3"

  it 'should exclude c if we filter with a b', ->
    target = {}
    _.extendFiltered target, ['a', 'b'], obj
    target.should.have.property 'a', "v1"
    target.should.have.property 'b', "v2"
    target.should.not.have.property 'c'


