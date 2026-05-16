import ConcatArrayTest from './normal/ConcatArray.test';
import ArrayTest from './normal/Array.test';
import MapTest from './normal/Map.test';
import ArrayBufferTest from './normal/ArrayBuffer.test';
import Uint8ArrayTest from './normal/TypedArray/Uint8Array.test';
import Int8ArrayTest from './normal/TypedArray/Int8Array.test';
import Int16ArrayTest from './normal/TypedArray/Int16Array.test';
import Uint16ArrayTest from './normal/TypedArray/Uint16Array.test';
import Uint32ArrayTest from './normal/TypedArray/Uint32Array.test';
import Int32ArrayTest from './normal/TypedArray/Int32Array.test';
import Uint8ClampedArrayTest from './normal/TypedArray/Uint8ClampedArray.test';
import Float32ArrayTest from './normal/TypedArray/Float32Array.test';
import BitVectorTest from './normal/BitVector.test';
import SetTest from './normal/Set.test';

export default function testsuite() {
  ConcatArrayTest();
  ArrayTest();
  MapTest();
  ArrayBufferTest();
  Uint8ArrayTest();
  Int8ArrayTest();
  Int16ArrayTest();
  Uint16ArrayTest();
  Uint32ArrayTest();
  Int32ArrayTest();
  Uint8ClampedArrayTest();
  Float32ArrayTest();
  BitVectorTest();
  SetTest();
}