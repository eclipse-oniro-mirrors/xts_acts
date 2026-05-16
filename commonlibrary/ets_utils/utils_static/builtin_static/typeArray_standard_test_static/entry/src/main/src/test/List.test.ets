import arrayTest from './Array.test.ets'
import BigInt64ArrayTest from './BigInt64Array.test.ets'
import BigUint64ArrayTest from './BigUint64Array.test.ets'
import Float32ArrayTest from './Float32Array.test.ets'
import Float64ArrayTest from './Float64Array.test.ets'
import Int16ArrayTest from './Int16Array.test.ets'
import Int8ArrayTest from './Int8Array.test.ets'
import Int32ArrayTest from './Int32Array.test.ets'
import typedArray from './TypedArray.test.ets'
import Uint8ArrayTest from './Uint8Array.test.ets'
import Uint32ArrayTest from './Uint32Array.test.ets'
export default function testsuite() {
  arrayTest()
  BigInt64ArrayTest()
  BigUint64ArrayTest()
  Float32ArrayTest()
  Float64ArrayTest()
  Int16ArrayTest()
  Int8ArrayTest()
  Int32ArrayTest()
  typedArray()
  Uint8ArrayTest()
  Uint32ArrayTest()
}
