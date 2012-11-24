module.exports = _ = require 'underscore'
slice = Array.prototype.slice

_.mixin
  ###
  Similar to extend, but only includes the properties that are listed in filter (filter).
  You can add an arbitrary number of objects as arguments.
  Tickets: CLOUD-65
  ###
  extendFiltered: (target, filter) ->
    _.each slice.call(arguments, 2), (source) ->
      for prop of source
        target[prop] = source[prop]  if source[prop] isnt undefined && _.include(filter, prop)

    target

  arrayify : (obj) ->
    return [] unless obj
    return _.uniq(obj) if _.isArray obj
    [obj]

  ###
  Checks if target exists, raises and error if not.
  ###
  ensurePresent: (target,targetName) ->
    throw new Error("#{targetName} is a required parameter") unless target
