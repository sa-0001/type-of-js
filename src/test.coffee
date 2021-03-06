#!/usr/bin/env coffee

tap = require '@sa0001/wrap-tap'

typeOf = require './index'

##======================================================================================================================

test_cases = [
	name: 'arguments'
	value: (-> arguments) true, 123, 'abc', { a: 1, b: 2, c: 3 }
	complex_type: 'arguments'
	simple_type: 'object'
,
	name: 'array 1'
	value: [ 1, 2, 3 ]
	complex_type: 'array'
	simple_type: 'array'
,
	name: 'array 1'
	value: Array(1,2,3)
	complex_type: 'array'
	simple_type: 'array'
,
	name: 'array 1'
	value: new Array(1,2,3)
	complex_type: 'array'
	simple_type: 'array'
,
	name: 'boolean 1',
	value: true
	complex_type: 'boolean'
	simple_type: 'boolean'
,
	name: 'boolean 2',
	value: false
	complex_type: 'boolean'
	simple_type: 'boolean'
,
	name: 'boolean 3',
	value: Boolean(true)
	complex_type: 'boolean'
	simple_type: 'boolean'
,
	name: 'boolean 4',
	value: new Boolean(true)
	complex_type: 'boolean'
	simple_type: 'object'
,
	name: 'date',
	value: new Date(981173106789) # must have new
	complex_type: 'date'
	simple_type: 'object'
,
	name: 'error 1',
	value: Error()
	complex_type: 'error'
	simple_type: 'object'
,
	name: 'error 2',
	value: new Error('abc')
	complex_type: 'error'
	simple_type: 'object'
,
	name: 'error 3',
	value: ReferenceError()
	complex_type: 'error'
	simple_type: 'object'
,
	name: 'error 4',
	value: new ReferenceError('abc')
	complex_type: 'error'
	simple_type: 'object'
,
	name: 'error 5',
	value: TypeError()
	complex_type: 'error'
	simple_type: 'object'
,
	name: 'error 6',
	value: new TypeError('abc')
	complex_type: 'error'
	simple_type: 'object'
,
	name: 'function 1',
	value: ->
	complex_type: 'function'
	simple_type: 'function'
,
	name: 'function 2',
	value: Function('a', 'b', 'return a + b')
	complex_type: 'function'
	simple_type: 'function'
,
	name: 'function 3',
	value: new Function('a', 'b', 'return a + b')
	complex_type: 'function'
	simple_type: 'function'
,
	name: 'map',
	value: new Map()
	complex_type: 'map'
	simple_type: 'object'
,
	name: 'null',
	value: null
	complex_type: 'null'
	simple_type: 'null'
,
	name: 'number 1',
	value: 1.23
	complex_type: 'number'
	simple_type: 'number'
,
	name: 'number 2',
	value: Number(1.23)
	complex_type: 'number'
	simple_type: 'number'
,
	name: 'number 3',
	value: new Number(1.23)
	complex_type: 'number'
	simple_type: 'object'
,
	name: 'number 4',
	value: (1 / 'A') # NaN
	complex_type: 'number'
	simple_type: 'number'
,
	name: 'number 5',
	value: (1 / 0  ) # Infinity
	complex_type: 'number'
	simple_type: 'number'
,
	name: 'object 1',
	value: { a: 1, b: 2, c: 3 }
	complex_type: 'object'
	simple_type: 'object'
,
	name: 'object 2',
	value: Object({ a: 1, b: 2, c: 3 })
	complex_type: 'object'
	simple_type: 'object'
,
	name: 'object 3',
	value: new Object({ a: 1, b: 2, c: 3 })
	complex_type: 'object'
	simple_type: 'object'
,
	name: 'object 4',
	value: new (class Model)()
	complex_type: 'object'
	simple_type: 'object'
,
	name: 'promise',
	value: new Promise -> # must have new
	complex_type: 'promise'
	simple_type: 'object'
,
	name: 'regexp 1',
	value: /[\d]/
	complex_type: 'regexp'
	simple_type: 'object'
,
	name: 'regexp 2',
	value: RegExp '[\\d]'
	complex_type: 'regexp'
	simple_type: 'object'
,
	name: 'regexp 3',
	value: new RegExp '[\\d]'
	complex_type: 'regexp'
	simple_type: 'object'
,
	name: 'set',
	value: new Set([1,2,3]) # must have new
	complex_type: 'set'
	simple_type: 'object'
,
	name: 'string 1',
	value: 'abc'
	complex_type: 'string'
	simple_type: 'string'
,
	name: 'string 2',
	value: String('abc')
	complex_type: 'string'
	simple_type: 'string'
,
	name: 'string 3',
	value: new String('abc')
	complex_type: 'string'
	simple_type: 'object'
,
	name: 'symbol',
	value: Symbol('abc') # must NOT have new
	complex_type: 'symbol'
	simple_type: 'symbol'
,
	name: 'undefined 1',
	value: undefined
	complex_type: 'undefined'
	simple_type: 'undefined'
,
	name: 'undefined 2',
	value: `void 0`
	complex_type: 'undefined'
	simple_type: 'undefined'
,
	name: 'weakmap',
	value: new WeakMap()
	complex_type: 'weakmap'
	simple_type: 'object'
,
	name: 'float32array',
	value: new Float32Array()
	complex_type: 'float32array'
	simple_type: 'object'
,
	name: 'float64array',
	value: new Float64Array()
	complex_type: 'float64array'
	simple_type: 'object'
,
	name: 'int8array',
	value: new Int8Array()
	complex_type: 'int8array'
	simple_type: 'object'
,
	name: 'int16array',
	value: new Int16Array()
	complex_type: 'int16array'
	simple_type: 'object'
,
	name: 'int32array',
	value: new Int32Array()
	complex_type: 'int32array'
	simple_type: 'object'
,
	name: 'uint8array',
	value: new Uint8Array()
	complex_type: 'uint8array'
	simple_type: 'object'
,
	name: 'uint16array',
	value: new Uint16Array()
	complex_type: 'uint16array'
	simple_type: 'object'
,
	name: 'uint32array',
	value: new Uint32Array()
	complex_type: 'uint32array'
	simple_type: 'object'
,
	name: 'uint8clampedarray',
	value: new Uint8ClampedArray()
	complex_type: 'uint8clampedarray'
	simple_type: 'object'
]

##------------------------------------------------------------------------------

tap.test 'type-of', (t) ->
	
	t.test 'complex', (t) ->
		
		for test_case in test_cases
			
			type = typeOf test_case.value, true
			
			t.msg("test case '#{test_case.name}'")
				.eq type, test_case.complex_type
	
	t.test 'simple', (t) ->
		
		for test_case in test_cases
			
			type = typeOf test_case.value, false
			
			t.msg("test case '#{test_case.name}'")
				.eq type, test_case.simple_type
