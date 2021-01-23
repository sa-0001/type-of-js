# @sa0001/type-of

[NPM][https://www.npmjs.com/package/@sa0001/type-of]

A library which returns an accurate type for any possible value.

The following standard types are known to work correctly:
* arguments
* array
* boolean
* date
* error
* float32array
* float64array
* function
* int16array
* int32array
* int8array
* map
* null
* number
* object
* promise
* regexp
* set
* string
* symbol
* uint16array
* uint32array
* uint8array
* uint8clampedarray
* undefined
* weakmap

However because `Object.prototype.toString.call(val)` is used, a type does not have to be in this list for it to return the correct value.

## Install

```bash
npm install @sa0001/type-of
```

## Usage

```javascript
const typeOf = require('@sa0001/type-of')

typeOf(arguments) // "arguments"
typeOf(['a',1]) // "array"
typeOf(true) // "boolean"
typeOf(new Date()) // "date"
typeOf(new Error()) // "error"
typeOf(function(){}) // "function"
typeOf(null) // "null"
typeOf(1.23) // "number"
typeOf({a:1}) // "object"
typeOf(new Promise()) // "promise"
typeOf(/\w/) // "regexp"
typeOf(new Set()) // "set"
typeOf('abc') // "string"
typeOf(Symbol('a')) // "symbol"
typeOf(undefined) // "undefined"
```

## License

[MIT](http://vjpr.mit-license.org)
