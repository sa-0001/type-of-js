##======================================================================================================================

simpleTypes = [
	'arguments'
	'array'
	'boolean'
	'date'
	
	'error'
	'function'
	'null'
	'number'
	
	'promise'
	'regexp'
	'set'
	'string'
	
	'symbol'
	'undefined'
]

complexTypes =
	'[object Arguments]': 'arguments'
	'[object Array]': 'array'
	'[object Boolean]': 'boolean'
	'[object Date]': 'date'
	
	'[object Error]': 'error'
	'[object Float32Array]': 'float32array'
	'[object Float64Array]': 'float64array'
	'[object Function]': 'function'
	
	'[object Int8Array]': 'int8array'
	'[object Int16Array]': 'int16array'
	'[object Int32Array]': 'int32array'
	'[object Map]': 'map'
	
	'[object Null]': 'null'
	'[object Number]': 'number'
	'[object Promise]': 'promise'
	'[object RegExp]': 'regexp'
	
	'[object Set]': 'set'
	'[object String]': 'string'
	'[object Symbol]': 'symbol'
	'[object Uint8Array]': 'uint8array'
	
	'[object Uint8ClampedArray]': 'uint8clampedarray'
	'[object Uint16Array]': 'uint16array'
	'[object Uint32Array]': 'uint32array'
	'[object Undefined]': 'undefined'
	
	'[object WeakMap]': 'weakmap'

typeArray     = 'array'
typeBoolean   = 'boolean'
typeNull      = 'null'
typeObject    = 'object'
typeUndefined = 'undefined'

##------------------------------------------------------------------------------

module.exports = (v, complex = true) ->
	return typeUndefined if v == undefined
	return typeNull      if v == null
	return typeBoolean   if v == true || v == false
	
	# 'simple' types (using typeof operator)
	type = typeof v
	if simpleTypes.indexOf(type) > -1
		return type
	
	return typeArray if Array.isArray v
	
	# return 'object' for all more complex types
	return typeObject if !complex
	
	# 'complex' types (using Object.toString)
	type = Object.prototype.toString.call v
	if complexTypes[type]
		return complexTypes[type]
	
	return type.substring(8, type.length - 1).toLowerCase()
