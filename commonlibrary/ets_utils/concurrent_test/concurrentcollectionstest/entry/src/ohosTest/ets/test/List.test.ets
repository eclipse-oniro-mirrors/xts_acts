import abilityTest from './Ability.test';
import SendableTest from './SendableLruCachetest.test';
import ArrayTest from './ConcurrentArrayTest.test'
import MapAndSetTest from './ConcurrentMapAndSetTest.test'
import AsyncLockTest from './ConcurrentAsyncLockTest.test'
import CondVariableTest from './ConcurrentCondVariableTest.test'
import int8ArrayTest from './ClassInt8Array.test';
import Int16ArrayGlobalTest from './ClassInt16Array.test';
import Int32ArrayGlobalTest from './ClassInt32Array.test';
import Float32ArrayGlobalTest from './ClassFloat32Array.test';
import BitVectorTest from './ConcurrentBitVectorTest.test'
import Uint8ArrayTest from './ConcurrentUint8ArrayTest.test'
import Uint16ArrayTest from './ConcurrentUint16ArrayTest.test'
import Uint32ArrayTest from './ConcurrentUint32ArrayTest.test'
import Uint8ClampedArrayTest from './ConcurrentUint8ClampedArrayTest.test'

export default function testsuite() {
  SendableTest();
  ArrayTest();
  MapAndSetTest();
  AsyncLockTest();
  CondVariableTest();
  int8ArrayTest();
  Int16ArrayGlobalTest();
  Int32ArrayGlobalTest();
  Float32ArrayGlobalTest();
  BitVectorTest();
  Uint8ArrayTest();
  Uint16ArrayTest();
  Uint32ArrayTest();
  Uint8ClampedArrayTest();
}