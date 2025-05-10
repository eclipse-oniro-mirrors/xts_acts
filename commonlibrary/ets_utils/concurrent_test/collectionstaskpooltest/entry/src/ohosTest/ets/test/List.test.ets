import float32ArrayTaskPoolTest from './TypedArrayTaskPool/float32ArrayTaskPool.test';
import int8ArrayTaskPoolTest from './TypedArrayTaskPool/int8ArrayTaskPool.test';
import int16ArrayTaskPoolTest from './TypedArrayTaskPool/int16ArrayTaskPool.test';
import int32ArrayTaskPoolTest from './TypedArrayTaskPool/int32ArrayTaskPool.test';
import uint8ArrayTaskPoolTest from './TypedArrayTaskPool/uint8ArrayTaskPool.test';
import uint8ClampedArrayTaskPoolTest from './TypedArrayTaskPool/uint8ClampedArrayTaskPool.test';
import uint16ArrayTaskPoolTest from './TypedArrayTaskPool/uint16ArrayTaskPool.test';
import uint32ArrayTaskPoolTest from './TypedArrayTaskPool/uint32ArrayTaskPool.test';

import ArrayTaskPoolTest from './Array/ArrayTaskPool.test';
import ArrayBufferTaskPoolTest from './ArrayBuffer/ArrayBufferTaskPool.test';
import BitVectorTaskPoolTest from './BitVector/BitVectorTaskPool.test';
import ConcatArrayTaskPoolTest from './ConcatArray/ConcatArrayTaskPool.test';
import MapTaskPoolTest from './Map/MapTaskPool.test';
import SetTaskPoolTest from './Set/SetTaskPool.test';

export default function testsuite() {
  float32ArrayTaskPoolTest();
  int8ArrayTaskPoolTest();
  int16ArrayTaskPoolTest();
  int32ArrayTaskPoolTest();
  uint8ArrayTaskPoolTest();
  uint8ClampedArrayTaskPoolTest();
  uint16ArrayTaskPoolTest();
  uint32ArrayTaskPoolTest();

  ArrayTaskPoolTest();
  ArrayBufferTaskPoolTest();
  BitVectorTaskPoolTest();
  ConcatArrayTaskPoolTest();
  MapTaskPoolTest();
  SetTaskPoolTest();
}